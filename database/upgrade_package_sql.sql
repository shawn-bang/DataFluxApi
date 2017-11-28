create or replace package AF_HXBCB is

  -- Created : 2017/11/3 17:15:27
  -- Purpose : Package for Antifraud
  -- 全局变量声明
  --以下全局变量是r_121至r_131规则开发过程中添加的
  --申请人姓名英文风险描述v_CODENAMEENGLISH = CODENAMEENGLISH
  v_codenameenglish  af_request_applicantinfo.codenameenglish%type;
  --申请人地址邮件英文风险描述v_codeemailenglish = codeemailenglish
  v_codeemailenglish  af_request_applicantinfo.codeemailenglish%type;
  --申请人地址英文风险描述v_codeaddrenglish  = ipenenglish
  v_codeaddrenglish  af_request_applicantinfo.codeaddrenglish%type;
  --申请人ip地址v_ipenenglish  = ipenenglish
  v_ipenenglish  af_request_applicantinfo.ipenenglish%type;
  --申请人国际移动用户识别码v_imsienenglish = imsienenglish
  v_imsienenglish af_request_applicantinfo.imsienenglish%type;
  --申请人国际移动设备标志v_imeienenglish = imeienenglish
  v_imeienenglish af_request_applicantinfo.imeienenglish%type;
  -- 申请人wifi的物理地址:v_wifimacenenglish = wifimacenenglish
  v_wifimacenenglish af_request_applicantinfo.wifimacenenglish%type;
  -- 是否有风险是否有风险，有风险为“T”，无风险为“F”:zm_isrisk=isrisk
  zm_isrisk af_request_appinfo_zmivsinfo.isrisk%type;
  -- 申请人出生日期:v_birth = c2_birth
  v_birth af_request_applicantinfo.c2_birth%type;
  -- 申请人证件有效日期:v_idte1 = c5_idte1
  v_idte1 af_request_applicantinfo.c5_idte1%type;
  -- 申请人证件起始日期:v_iddt1 = c2_iddt1
  v_iddt1 af_request_applicantinfo.c2_iddt1%type;
  -- 申请人证件类型:v_idtype = c1_idtype
  v_idtype af_request_applicantinfo.c1_idtype%type;
  --以上全局变量是r_121至r_131规则开发过程中添加的
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
  --最近30天内的查询机构数_担保资格审查 v_query_org_1m_sum5 = query_org_1m_sum5
  v_query_org_1m_sum5 af_request_applicantinfo.query_org_1m_sum5%type;
  --最近30天内的查询机构数_贷后管理 v_query_org_1m_sum1=query_org_1m_sum1
  v_query_org_1m_sum1 af_request_applicantinfo.query_org_1m_sum1%type;
  --最近两年内的查询次数_担保资格审查 v_query_rec_2y_sum5=query_rec_2y_sum5
  v_query_rec_2y_sum5 af_request_applicantinfo.query_rec_2y_sum5%type;
  --最近两年内的查询次数_贷后管理 v_query_rec_2y_sum1=query_rec_2y_sum1
  v_query_rec_2y_sum1 af_request_applicantinfo.query_rec_2y_sum1%type;
  --配偶_联系电话 v_mate_contact_tel = mate_contact_tel
  v_mate_contact_tel af_request_applicantinfo.mate_contact_tel%type;
  --直系亲属手机 v_remobil = c1_remobil
  v_remobil af_request_applicantinfo.c1_remobil%type;
  --直系亲属关系 v_reship = c1_reship
  v_reship  af_request_applicantinfo.c1_reship%type;
  --首张贷记卡发卡月份 v_frs_cred_crd_issue_mon = frs_cred_crd_issue_mon
  v_frs_cred_crd_issue_mon af_request_applicantinfo.frs_cred_crd_issue_mon%type;
  --相对位置 v_opposite_position = opposite_position
  v_opposite_position af_request_applicantinfo.opposite_position%type;
  --未销户贷记卡_贷款法人机构数/发卡法人机构数 v_no_pd_card_loan_corp_number = no_pd_card_loan_corp_number
  v_no_pd_card_loan_corp_number af_request_applicantinfo.no_pd_card_loan_corp_number%type;
  --未销户贷记卡_贷款机构数/发卡机构数 v_no_pd_card_loan_org_number = no_pd_card_loan_org_number
  v_no_pd_card_loan_org_number af_request_applicantinfo.no_pd_card_loan_org_number%type;
   --未销户贷记卡_笔数/账户数 v_no_pin_debit_card_acct_num = no_pin_debit_card_acct_num
  v_no_pin_debit_card_acct_num  af_request_applicantinfo.no_pin_debit_card_acct_num%type;
    --申主卡申请人教育程度 v_educls = c1_educls
  v_educls  af_request_applicantinfo.c1_educls%type;
   --办学形式 v_educationapproach = educationapproach
  v_educationapproach  af_request_applicantinfo.educationapproach%type;
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
        c1_coname into v_app_num, v_coadd, v_hmadd, v_mobile, v_cotel, v_hmtel, v_abuser, v_abname, v_idnbr, v_coname,v_idte1,v_iddt1,v_idtype,
        v_birth,v_wifimacenenglish,v_imeienenglish,v_imsienenglish,v_ipenenglish,v_codeaddrenglish,v_codeemailenglish,v_codenameenglish,v_educls,
         v_educationapproach,v_no_pin_debit_card_acct_num,v_no_pd_card_loan_org_number,v_opposite_position,v_frs_cred_crd_issue_mon,
         v_reship,v_remobil,v_mate_contact_tel,v_query_rec_2y_sum1,v_query_rec_2y_sum5,v_query_org_1m_sum1,v_query_org_1m_sum5
      from af_request_applicantinfo
      where app_id = app_id_input;

      --从af_request_appinfo_zmivsinfo获取全局变量
      select isrisk into zm_isrisk from af_request_appinfo_zmivsinfo t  where t.app_id = app_id_input AND isrisk='T';
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
      AF_HXBCB_RULE_PKG.RULE_131(app_id_input,v_codenameenglish);
      AF_HXBCB_RULE_PKG.RULE_130(app_id_input,v_codeemailenglish);
      AF_HXBCB_RULE_PKG.RULE_129(app_id_input,v_codeaddrenglish);
      AF_HXBCB_RULE_PKG.RULE_128(app_id_input,v_ipenenglish);
      AF_HXBCB_RULE_PKG.RULE_127(app_id_input,v_imsienenglish);
      AF_HXBCB_RULE_PKG.RULE_126(app_id_input,v_imeienenglish);
      AF_HXBCB_RULE_PKG.RULE_125(app_id_input,v_wifimacenenglish);
      AF_HXBCB_RULE_PKG.RULE_124(app_id_input,zm_isrisk);
      AF_HXBCB_RULE_PKG.RULE_122(app_id_input,v_idte1,v_iddt1);
      AF_HXBCB_RULE_PKG.RULE_121(app_id_input,v_idtype, v_idnbr,v_iddt1,v_idte1,v_birth);
      --调用规则包中的黑名单规则编号160
      AF_HXBCB_RULE_PKG.RULE_155(app_id_input, v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_156(app_id_input, v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_158(app_id_input, v_coname);
      AF_HXBCB_RULE_PKG.RULE_160(app_id_input, v_coadd);
      AF_HXBCB_RULE_PKG.RULE_162(app_id_input, v_hmadd);
      AF_HXBCB_RULE_PKG.RULE_164(app_id_input, v_mobile);
      AF_HXBCB_RULE_PKG.RULE_166(app_id_input, v_cotel);
      AF_HXBCB_RULE_PKG.RULE_168(app_id_input, v_hmtel);
      AF_HXBCB_RULE_PKG.RULE_232(app_id_input, v_abuser, v_abname);
      AF_HXBCB_RULE_PKG.RULE_138(app_id_input, v_educls,v_educationapproach);
      AF_HXBCB_RULE_PKG.RULE_139(app_id_input, v_no_pin_debit_card_acct_num);
      AF_HXBCB_RULE_PKG.RULE_140(app_id_input, v_no_pd_card_loan_org_number);
      AF_HXBCB_RULE_PKG.RULE_141(app_id_input, v_no_pd_card_loan_corp_number);
      AF_HXBCB_RULE_PKG.RULE_142(app_id_input, v_opposite_position);
      AF_HXBCB_RULE_PKG.RULE_143(app_id_input, v_frs_cred_crd_issue_mon);
      AF_HXBCB_RULE_PKG.RULE_145(app_id_input, v_reship ,v_remobil ,v_mate_contact_tel);
      AF_HXBCB_RULE_PKG.RULE_146(app_id_input, v_query_rec_2y_sum1);
      AF_HXBCB_RULE_PKG.RULE_147(app_id_input, v_query_rec_2y_sum5);
      AF_HXBCB_RULE_PKG.RULE_148(app_id_input, v_query_org_1m_sum1);
      AF_HXBCB_RULE_PKG.RULE_149(app_id_input, v_query_org_1m_sum5);
      --生成规则风险等级结果数据(聚合结果)
      select max(ra.riskcode) into rules_riskcode from af_response_afriskwarning ra where ra.type = 'RULE' and ra.app_id = app_id_input;
      if nvl(rules_riskcode, 'null') != 'null' then
        insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'RULE', rules_riskcode, '');
        commit;
      else        
        insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'RULE', 'C', '');
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
        v_sna_res varchar(30):='';
        v_model_res varchar(30):='';
        v_desc varchar(20):='';
        v_code varchar(10):='';
        riskcode af_response_afriskwarning.riskcode%type;
      begin
        begin
          begin
            select model_ressult into v_model_res
            from af_app_model_result
            where app_id = app_id_res;
            exception when no_data_found then
            null;
          end;
          begin
            select sna_result into v_sna_res
            from af_app_sna_result
            where app_id = app_id_res;
            exception when no_data_found then
            null;
          end;
        end;
        if nvl(v_model_res, 'null') != 'null' then
          v_code:=substr(v_model_res,1,1);
          v_desc:=substr(v_model_res,2);
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type, class)
          values
            (app_id_res,'Z2','Z05','Z05_1',v_desc,v_code,'MODEL', 'Z');
          commit;
        end if;
        if nvl(v_sna_res, 'null') != 'null' then
          v_code:=substr(v_sna_res,1,1);
          v_desc:=substr(v_sna_res,2);
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type, class)
          values
            (app_id_res,'Z2','Z06','Z06_1',v_desc,v_code,'SNA', 'Z');
          commit;
        end if;
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
