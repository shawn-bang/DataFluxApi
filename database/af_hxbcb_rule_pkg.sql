-- hxb api business rules package and procedure
create or replace package AF_HXBCB_RULE_PKG as
  -- Created : 2017/11/3 17:22:14
  -- Purpose : Rule
  -- 触发规则列表
  -- rule:131
  procedure RULE_131(app_id_input in varchar2,v_codenameenglish in varchar2);
  -- rule:130
  procedure RULE_130(app_id_input in varchar2,v_codeemailenglish in varchar2);
  -- rule:129
  procedure RULE_129(app_id_input in varchar2,v_codeaddrenglish in varchar2);
  -- rule:128
  procedure RULE_128(app_id_input in varchar2,v_ipenenglish in varchar2);
  -- rule:127
  procedure RULE_127(app_id_input in varchar2,v_imsienenglish in varchar2);
  -- rule:126
  procedure RULE_126(app_id_input in varchar2,v_imeienenglish in varchar2);
  -- rule:125
  procedure RULE_125(app_id_input in varchar2,v_wifimacenenglish in varchar2);
  -- rule:124
  procedure RULE_124(app_id_input in varchar2,zm_isrisk in varchar2);
  -- rule:122
  procedure RULE_122(app_id_input in varchar2,v_idte1 in varchar2,v_iddt1 in varchar2);
  -- rule:121
  procedure RULE_121(app_id_input in varchar2,v_idtype in varchar2, v_idnbr in varchar2,v_iddt1 in varchar2,v_idte1 in varchar2,v_birth in varchar2);
  -- rule:155
  procedure RULE_155(app_id_input in varchar2, v_idnbr in varchar2);
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
  procedure RULE_168(app_id_input in varchar2, v_hmtel in varchar2);
  -- rule:232
  procedure RULE_232(app_id_input in varchar2, v_abuser in af_request_applicantinfo.c4_abuser%type, v_abname in af_request_applicantinfo.c4_abname%type);
end AF_HXBCB_RULE_PKG;

/

create or replace package body AF_HXBCB_RULE_PKG as

  -- rule:131
  procedure RULE_131(app_id_input in varchar2,v_codenameenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codenameenglish,'null') != 'null' and v_codenameenglish='NAME_Mismatch' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '131', '', '', '', '', 'RULE_131', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_131: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_131;

  -- rule:130
  procedure RULE_130(app_id_input in varchar2,v_codeemailenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codeemailenglish,'null') != 'null' and v_codeemailenglish='EMAIL_Histroy_NegativeList'  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '130', '', '', '', '', 'RULE_130', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_130: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_130;
  -- rule:129
  procedure RULE_129(app_id_input in varchar2,v_codeaddrenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codeaddrenglish,'null') != 'null' and v_codeaddrenglish='ADDR_Mismatch' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '129', '', '', '', '', 'RULE_129', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_129: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_129;
  -- rule:128
  procedure RULE_128(app_id_input in varchar2,v_ipenenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_ipenenglish,'null') != 'null' and  v_ipenenglish='IP_Mismatch' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '128', '', '', '', '', 'RULE_128', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_128: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_128;
  -- rule:127
  procedure RULE_127(app_id_input in varchar2,v_imsienenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_imsienenglish,'null') != 'null' and v_imsienenglish='IMSI_Histroy_NegativeList' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '127', '', '', '', '', 'RULE_127', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_127: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_127;
  -- rule:126
  procedure RULE_126(app_id_input in varchar2,v_imeienenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_imeienenglish,'null') != 'null' and v_imeienenglish='IMEI_Histroy_NegativeList' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '126', '', '', '', '', 'RULE_126', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_126: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_126;
  -- rule:125
  procedure RULE_125(app_id_input in varchar2,v_wifimacenenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_wifimacenenglish,'null') != 'null' and v_wifimacenenglish='WIFI-MAC_Histroy_NegativeLis' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '125', '', '', '', '', 'RULE_125', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_125: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_125;
  -- rule:124
  procedure RULE_124(app_id_input in varchar2,zm_isrisk in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(zm_isrisk,'null') != 'null' and  zm_isrisk='T' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '124', '', '', '', '', 'RULE_124', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_124: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_124;
  -- rule:122
  procedure RULE_122(app_id_input in varchar2,v_idte1 in varchar2,v_iddt1 in varchar2) is
    b_date number(10);
    v_error varchar2(500);
    begin
      --需要确定是否会出现v_idte1是长期的情况
      if v_idte1 != '长期' then
        RULE_122.b_date := trunc(months_between(to_date('20'||substr(app_id_input,1,6),'yyyy-mm-dd'),to_date(v_idte1,'yyyy-mm-dd')),2);
        if nvl(v_idte1,'null') != 'null' and nvl(v_iddt1,'null') != 'null' and RULE_122.b_date <=3  then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '122', '122', '122', '122', '122', 'RULE_122', 'RULE','Z');
          commit;
        end if ;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_122: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything

    end RULE_122;
  -- rule:121
  procedure RULE_121(app_id_input in varchar2,v_idtype in varchar2, v_idnbr in varchar2,v_iddt1 in varchar2,v_idte1 in varchar2,v_birth in varchar2) is
    birth  varchar2(10);
    v_error varchar2(500);
    begin
      if nvl(v_iddt1, 'null') != 'null' and nvl(v_idte1, 'null') !='null' then
        --身份证代类型码值有待确定
        if v_idtype = 1 then
          RULE_121.birth := substr(v_idnbr,7,8);
        else
          RULE_121.birth := v_birth;
        end if;
        if trunc(months_between(to_date(v_iddt1,'yyyy-mm-dd'), to_date(RULE_121.birth,'yyyy-mm-dd'))/ 12,2) > 46 and v_idte1 = '长期' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, '121', '121', '121', '121', '121', 'RULE_121', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_121: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_121;

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
