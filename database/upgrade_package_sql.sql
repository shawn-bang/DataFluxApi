create or replace package AF_HXBCB is

  -- Created : 2017/11/3 17:15:27
  -- Purpose : Package for Antifraud
  -- 全局变量声明
  v_errors varchar2(500);
  -- 申请次数
  v_app_num number;
  -- 申请人证件号码
  v_idnbr af_request_applicantinfo.c1_idnbr%type;
  -- 申请人单位名称
  v_coname af_request_applicantinfo.c1_coname%type;
  -- 申请人单位地址:v_coadd = c1_coadd1 + c1_coadd2 + c1_coadd3 + c1_coadd4
  v_coadd varchar2(120);
  -- 申请人住宅地址:v_hmadd = c1_hmadd1 + c1_hmadd2 + c1_hmadd3 + c1_hmadd4
  v_hmadd varchar2(120);
  -- 申请人手机号码:v_mobile = c1_mobile
  v_mobile af_request_applicantinfo.c1_mobile%type;
  -- 申请人单位号码:v_cotel = c1_cotel
  v_cotel af_request_applicantinfo.c1_cotel%type;
  -- 申请人住宅号码:v_hmtel = c1_hmare + c1_hmtel
  v_hmtel varchar2(21);
  -- 推广员编号:c4_abuser
  v_abuser af_request_applicantinfo.c4_abuser%type;
  -- 推广员姓名:c4_abname
  v_abname af_request_applicantinfo.c4_abname%type;
  -- 声明入口调用过程
  procedure RT_MAIN(app_id_input in varchar2);
  -- 规则调用过程
  procedure AF_HXBCB_RULE(app_id_input in varchar2);

  procedure AF_HXBCB_MODEL(app_id_model in varchar2);
  --调用SNA
  procedure AF_HXBCB_SNA(app_id_sna in varchar2);
  --ToRes
  procedure AF_HXBCB_ToResponse(app_id_res in varchar2);

end AF_HXBCB;

/
create or replace package body AF_HXBCB is

  procedure RT_MAIN(app_id_input in varchar2) is
    riskcode af_response_afsummary.value%type;
    begin
      --从request_applicantinfo获取全局参数
      select
        req_app_num,
        c1_coadd1 || c1_coadd2 || c1_coadd3 || c1_coadd4,
        c1_hmadd1 || c1_hmadd2 || c1_hmadd3 || c1_hmadd4,
        c1_mobile,
        c1_cotel,
        c1_hmare || c1_hmtel,
        c4_abuser,
        c4_abname,
        c1_idnbr,
        c1_coname into v_app_num, v_coadd, v_hmadd, v_mobile, v_cotel, v_hmtel, v_abuser, v_abname, v_idnbr, v_coname
      from af_request_applicantinfo
      where app_id = app_id_input;
      --调用规则
      -- TODO业务场景是(需要添加流程控制):
      -- 1.申请件首次进来会直接进行黑名单规则计算,不执行模型和SNA计算
      -- 2.黑名单校验不通过业务方会直接拒掉该笔申请,通过后，业务方会带着新数据再次调用接口进行业务规则，模型，SNA完成全部计算
      AF_HXBCB_RULE(app_id_input);
      -- 第一次申请只计算黑名单规则
      if v_app_num > 1 then
        --调用模型
        AF_HXBCB_MODEL(app_id_input);
        --调用SNA
        AF_HXBCB_SNA(app_id_input);
        --toResponse
        AF_HXBCB_ToResponse(app_id_input);
      end if;

      --生成反欺诈决策结果数据(聚合结果)
      select max(ra.value) into riskcode from af_response_afsummary ra where ra.app_id = app_id_input;
      if nvl(riskcode, 'null') != 'null' then
        insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'AF_ALL', riskcode, '');
        commit;
      end if;
      select max(ra.riskcode) into riskcode from af_response_afriskwarning ra where ra.class = 'Z' and ra.app_id = app_id_input;
      if nvl(riskcode, 'null') = 'null' then
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', '', '', '', '', '', 'RULE', 'Z');
        commit;
      end if;
      -- TODO W&H             
    end RT_MAIN;
  --规则存储过程



  procedure AF_HXBCB_RULE(app_id_input in varchar2) is
    rules_riskcode af_response_afriskwarning.riskcode%type;
    begin
      --调用规则包中的黑名单规则编号160
      AF_HXBCB_RULE_PKG.RULE_155(app_id_input, v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_158(app_id_input, v_coname);
      AF_HXBCB_RULE_PKG.RULE_160(app_id_input, v_coadd);
      AF_HXBCB_RULE_PKG.RULE_162(app_id_input, v_hmadd);
      AF_HXBCB_RULE_PKG.RULE_164(app_id_input, v_mobile);
      AF_HXBCB_RULE_PKG.RULE_166(app_id_input, v_cotel);
      AF_HXBCB_RULE_PKG.RULE_168(app_id_input, v_hmtel);
      AF_HXBCB_RULE_PKG.RULE_232(app_id_input, v_abuser, v_abname);
      --生成规则风险等级结果数据(聚合结果)
      select max(ra.riskcode) into rules_riskcode from af_response_afriskwarning ra where ra.type = 'RULE' and ra.app_id = app_id_input;
      if nvl(rules_riskcode, 'null') != 'null' then
        insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'RULE', rules_riskcode, '');
        commit;
      else        
        insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'RULE', 'A', '');
        commit;
      end if;     
    end AF_HXBCB_RULE;

  --模型存储过程
  procedure AF_HXBCB_MODEL(app_id_model in varchar2) is
    begin
      AF_HXBCB_MODEL_PKG.getModelResult(appid => app_id_model);

    end AF_HXBCB_MODEL;


  -- SNA存储过程
  procedure AF_HXBCB_SNA(app_id_sna in varchar2) is
    begin
      AF_HXBCB_SNA_PKG.getSnaResult(appid => app_id_sna);

    end AF_HXBCB_SNA;

  procedure AF_HXBCB_ToResponse(app_id_Res in varchar2) is
    begin
      declare
        v_sna_res varchar(10):='';
        v_model_res varchar(10):='';
        riskcode af_response_afriskwarning.riskcode%type;
      begin
        select model_ressult into v_model_res
        from af_app_model_result
        where app_id = app_id_res;
        select sna_result into v_sna_res
        from af_app_sna_result
        where app_id = app_id_res;
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type, class)
        values
          (app_id_res,'Z2','Z05','Z05_1',' ',v_model_res,'MODEL', 'Z');
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type, class)
        values
          (app_id_res,'Z2','Z06','Z06_1',' ',v_sna_res,'SNA', 'Z');
        commit;
        --生成模型风险等级结果数据(聚合结果)
        select max(ra.riskcode) into riskcode from af_response_afriskwarning ra where ra.type = 'MODEL' and ra.app_id = app_id_Res;
        if nvl(riskcode, 'null') != 'null' then
          insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_Res, 'MODEL', riskcode, '');
          commit;
        end if;
        --生成SNA风险等级结果数据(聚合结果)
        select max(ra.riskcode) into riskcode from af_response_afriskwarning ra where ra.type = 'SNA' and ra.app_id = app_id_Res;
        if nvl(riskcode, 'null') != 'null' then
          insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_Res, 'SNA', riskcode, '');
          commit;
        end if;
        exception when others then
        v_errors:= 'Main_PKG.ToResponse:' || to_char(sqlerrm);
        insert into AF_App_Prc_Logs(App_Id,Error_Logs)
        values
          (app_id_res,v_errors);

      end;
    end AF_HXBCB_ToResponse;
end AF_HXBCB;
