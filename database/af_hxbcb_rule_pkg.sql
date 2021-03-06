﻿-- hxb api business rules package and procedure
create or replace package AF_HXBCB_RULE_PKG as
  -- Created : 2017/11/3 17:22:14
  -- Purpose : Rule
  -- 触发规则列表
  -- rule:155
  procedure RULE_155(app_id_input in varchar2, v_idnbr in varchar2);
  -- rule:156
  procedure RULE_156(app_id_input in varchar2, v_idnbr in varchar2);
  -- rule:158
  procedure RULE_158(app_id_input in varchar2, v_coname in af_request_applicantinfo.c1_coname%type);
  -- rule:160
  procedure RULE_160(app_id_input in varchar2, v_coadd in varchar2);
  -- rule:162
  procedure RULE_162(app_id_input in varchar2, v_hmadd in varchar2);
  -- rule:164
  procedure RULE_164(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type);
  -- rule:166
  procedure RULE_166(app_id_input in varchar2, v_cotel in af_request_applicantinfo.c1_cotel%type);
  -- rule:168
  procedure RULE_168(app_id_input in varchar2, v_hmare in af_request_applicantinfo.c1_hmare%type, v_hmtel in af_request_applicantinfo.c1_hmtel%type);
  -- rule:232
  procedure RULE_232(app_id_input in varchar2, v_abuser in af_request_applicantinfo.c4_abuser%type, v_abname in af_request_applicantinfo.c4_abname%type);
end AF_HXBCB_RULE_PKG;

/

create or replace package body AF_HXBCB_RULE_PKG as

  -- rule:155
  procedure RULE_155(app_id_input in varchar2,v_idnbr in varchar2) is
    flag number;
    v_error varchar2(500);
    begin
      if nvl(v_idnbr, 'null') != 'null' then
        -- TODO certifi_type check?
        select count(1) into flag
        from opas_identity_risklist t
        where v_idnbr = t.certifi_no and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_1', 'E', '高风险', 'RULE_155', 'RULE', 'Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_155: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_155;

  -- rule:156
  procedure RULE_156(app_id_input in varchar2,v_idnbr in varchar2) is
    flag number;
    v_error varchar2(500);
    begin
      if nvl(v_idnbr, 'null') != 'null' then
        select count(1) into flag
        from opas_sameindustry_risklist t
        where v_idnbr = t.certifi_no and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_5', 'D', '中高风险', 'RULE_156', 'RULE', 'Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_156: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_156;
    
  -- rule:158
  procedure RULE_158(app_id_input in varchar2, v_coname in af_request_applicantinfo.c1_coname%type) is
    flag number;
    v_error varchar2(500);
    begin
      if nvl(v_coname, 'null') != 'null' then
        select count(1) into flag
        from opas_company_risklist t
         where t.company_name = v_coname and t.curr_status = '1';
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '中高风险', 'RULE_158', 'RULE', 'Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_158: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_158;    

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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_3', 'D', '中高风险', 'RULE_160', 'RULE', 'Z');
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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_3', 'D', '中高风险', 'RULE_162', 'RULE', 'Z');
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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'E', '高风险', 'RULE_164', 'RULE', 'Z');
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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'E', '高风险' , 'RULE_166', 'RULE', 'Z');
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_166: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_166;
  -- rule:168
  procedure RULE_168(app_id_input in varchar2, v_hmare in af_request_applicantinfo.c1_hmare%type, v_hmtel in af_request_applicantinfo.c1_hmtel%type) is
    flag number;
    v_telephone varchar2(21);
    v_error varchar2(500);
    begin
      if nvl(v_hmare, 'null') != 'null' and nvl(v_hmtel, 'null') != 'null' then
        v_telephone:=v_hmare || v_hmtel;
        select count(1) into flag
        from opas_tel_risklist t
        where exists(
                  select 1 from opas_tel_risklist t_1
                  where t.company_tel = v_telephone
                  union all
                  select 1 from opas_tel_risklist t_2
                  where t.living_tel = v_telephone
                  union all
                  select 1 from opas_tel_risklist t_3
                  where t.other_tel = v_telephone
              ) and t.curr_status = '1';
        -- about curr_status column, mybe we need to add a bitmap index
        -- curr_status must hava value for index and order by
        -- check flag status
        if flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'E', '高风险', 'RULE_168', 'RULE', 'Z');
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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type, class) values(app_id_input, 'Z2', 'Z01', 'Z01_6', 'D', '中高风险', 'RULE_232', 'RULE', 'Z');
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_232: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_232;
end AF_HXBCB_RULE_PKG;
