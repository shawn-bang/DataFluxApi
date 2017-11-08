create or replace package AF_HXBCB is

  -- Created : 2017/11/3 17:15:27
  -- Purpose : Package for Antifraud
  -- 全局变量声明
  v_errors varchar2(500);
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
    select c1_coadd1 || c1_coadd2 || c1_coadd3 || c1_coadd4,
           c1_hmadd1 || c1_hmadd2 || c1_hmadd3 || c1_hmadd4,
           c1_mobile,
           c1_cotel,
           c1_hmare || c1_hmtel,
           c4_abuser,
           c4_abname into v_coadd, v_hmadd, v_mobile, v_cotel, v_hmtel, v_abuser, v_abname
      from af_request_applicantinfo
     where app_id = app_id_input;
    --调用规则
    AF_HXBCB_RULE(app_id_input);
    --调用模型
    AF_HXBCB_MODEL(app_id_input);
    --调用SNA
    AF_HXBCB_SNA(app_id_input);
    --toResponse
    AF_HXBCB_ToResponse(app_id_input);
    
    --生成反欺诈决策结果数据(聚合结果)
    select max(ra.value) into riskcode from af_response_afsummary ra where ra.app_id = app_id_input;
    if nvl(riskcode, 'null') != 'null' then
      insert into af_response_afsummary(app_id, type, value, remarks) values(app_id_input, 'AF_ALL', riskcode, '');
      commit;
    end if;    
  end RT_MAIN;
  --规则存储过程
  
  
  
  procedure AF_HXBCB_RULE(app_id_input in varchar2) is
    rules_riskcode af_response_afriskwarning.riskcode%type;    
  begin
    --调用规则包中的黑名单规则编号160
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
    end if;
  end AF_HXBCB_RULE;
  
  --模型存储过程
  procedure AF_HXBCB_MODEL(app_id_model in varchar2) is   
  begin
    AF_HXBCB_MODEL_PKG.getModelResult(app_id => app_id_model);
            
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
     insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type)
     values
     (app_id_res,'Z2','Z05','Z05_1',' ',v_model_res,'MODEL');
     insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskdesc,riskcode,type)
     values
     (app_id_res,'Z2','Z06','Z06_1',' ',v_sna_res,'SNA');
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

/

-- hxb api business rules package and procedure
create or replace package AF_HXBCB_RULE_PKG as
  -- Created : 2017/11/3 17:22:14
  -- Purpose : Rule
  --触发规则列表
  -- rule:160  
  procedure RULE_160(app_id_input in varchar2, v_coadd in varchar2);
  -- rule:162  
  procedure RULE_162(app_id_input in varchar2, v_hmadd in varchar2);
  -- rule:164  
  procedure RULE_164(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type);
  -- rule:166  
  procedure RULE_166(app_id_input in varchar2, v_cotel in af_request_applicantinfo.c1_cotel%type);
  -- rule:168  
  procedure RULE_168(app_id_input in varchar2, v_hmtel in varchar2);
  -- rule:232  
  procedure RULE_232(app_id_input in varchar2, v_abuser in af_request_applicantinfo.c4_abuser%type, v_abname in af_request_applicantinfo.c4_abname%type);
end AF_HXBCB_RULE_PKG;

/

create or replace package body AF_HXBCB_RULE_PKG as
  -- rule:160
  procedure RULE_160(app_id_input in varchar2, v_coadd in varchar2) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_coadd, 'null') != 'null' then
       select count(1) into flag
         from opas_addr_risklist t
        where exists(
              select 1 from opas_addr_risklist t_1
                      where t.company_addr = v_coadd
              union all
              select 1 from opas_addr_risklist t_2
                      where t.living_addr = v_coadd
              union all
              select 1 from opas_addr_risklist t_3
                      where t.born_addr = v_coadd
              union all
              select 1 from opas_addr_risklist t_4
                      where t.bill_addr = v_coadd
              union all
              select 1 from opas_addr_risklist t_5
                      where t.other_addr = v_coadd
        ) and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_3', 'D', '', 'RULE_160', 'RULE');
          commit;
        end if;
     end if;
     -- handle exceptions     
     exception when others then v_error := 'RULE_160: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;     
     -- don't anything
  end RULE_160;

  -- rule:162
  procedure RULE_162(app_id_input in varchar2, v_hmadd in varchar2) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_hmadd, 'null') != 'null' then
       select count(1) into flag
         from opas_addr_risklist t
        where exists(
              select 1 from opas_addr_risklist t_1
                      where t.company_addr = v_hmadd
              union all
              select 1 from opas_addr_risklist t_2
                      where t.living_addr = v_hmadd
              union all
              select 1 from opas_addr_risklist t_3
                      where t.born_addr = v_hmadd
              union all
              select 1 from opas_addr_risklist t_4
                      where t.bill_addr = v_hmadd
              union all
              select 1 from opas_addr_risklist t_5
                      where t.other_addr = v_hmadd
        ) and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_3', 'D', '', 'RULE_162', 'RULE');
          commit;
        end if;
     end if;
     exception when others then v_error := 'RULE_162: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;    
     -- don't anything
  end RULE_162;
  
  -- rule:164
  procedure RULE_164(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_mobile, 'null') != 'null' then
       select count(1) into flag
         from opas_tel_risklist t
        where t.mobile_id = v_mobile and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'D', '', 'RULE_164', 'RULE');
          commit;
        end if;
     end if;
     exception when others then v_error := 'RULE_164: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;
     -- don't anything
  end RULE_164;
  -- rule:166
  procedure RULE_166(app_id_input in varchar2, v_cotel in af_request_applicantinfo.c1_cotel%type) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_cotel, 'null') != 'null' then
       select count(1) into flag
         from opas_tel_risklist t
        where exists(
              select 1 from opas_tel_risklist t_1
                      where t.company_tel = v_cotel
              union all
              select 1 from opas_tel_risklist t_2
                      where t.living_tel = v_cotel
              union all
              select 1 from opas_tel_risklist t_3
                      where t.other_tel = v_cotel
        ) and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'D', '' , 'RULE_166', 'RULE');
          commit;
        end if;
     end if;
     exception when others then v_error := 'RULE_166: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;
     -- don't anything
  end RULE_166;
  -- rule:168
  procedure RULE_168(app_id_input in varchar2, v_hmtel in varchar2) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_hmtel, 'null') != 'null' then
       select count(1) into flag
         from opas_tel_risklist t
        where exists(
              select 1 from opas_tel_risklist t_1
                      where t.company_tel = v_hmtel
              union all
              select 1 from opas_tel_risklist t_2
                      where t.living_tel = v_hmtel
              union all
              select 1 from opas_tel_risklist t_3
                      where t.other_tel = v_hmtel
        ) and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'D', '', 'RULE_168', 'RULE');
          commit;
        end if;
     end if;
     exception when others then v_error := 'RULE_168: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;
     -- don't anything
  end RULE_168;
  -- rule:232
  procedure RULE_232(app_id_input in varchar2, v_abuser in af_request_applicantinfo.c4_abuser%type, v_abname in af_request_applicantinfo.c4_abname%type) is
   flag number;
   v_error varchar2(500);
  begin
     if nvl(v_abuser, 'null') != 'null' and nvl(v_abname, 'null') != 'null' then
       select count(1) into flag
         from opas_promoter_risklist t
        where t.promoter_no = v_abuser and t.promoter_name = v_abname and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by        
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_6', 'D', '', 'RULE_232', 'RULE');
          commit;
        end if;
     end if;
     exception when others then v_error := 'RULE_232: ' || sqlerrm;
     insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
     commit;
     -- don't anything
  end RULE_232;
end AF_HXBCB_RULE_PKG;
