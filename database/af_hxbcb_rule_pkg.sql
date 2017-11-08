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