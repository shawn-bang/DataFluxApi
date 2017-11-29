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
  -- rule:138
  procedure RULE_138(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_educationapproach in af_request_applicantinfo.educationapproach%type);
  -- rule:139
  procedure RULE_139(app_id_input in varchar2, v_no_pin_debit_card_acct_num in af_request_applicantinfo.no_pin_debit_card_acct_num%type);
  -- rule:140
  procedure RULE_140(app_id_input in varchar2, v_no_pd_card_loan_org_number in af_request_applicantinfo.no_pd_card_loan_org_number%type);
  -- rule:141
  procedure RULE_141(app_id_input in varchar2, v_no_pd_card_loan_corp_number in af_request_applicantinfo.no_pd_card_loan_corp_number%type);
  -- rule:142
  procedure RULE_142(app_id_input in varchar2, v_opposite_position in af_request_applicantinfo.opposite_position%type);
  -- rule:143
  procedure RULE_143(app_id_input in varchar2, v_frs_cred_crd_issue_mon in af_request_applicantinfo.frs_cred_crd_issue_mon%type);
  -- rule:145
  procedure RULE_145(app_id_input in varchar2, v_reship in af_request_applicantinfo.c1_reship%type,v_remobil in af_request_applicantinfo.c1_remobil%type,v_mate_contact_tel in af_request_applicantinfo.mate_contact_tel%type);
  -- rule:146
  procedure RULE_146(app_id_input in varchar2, v_query_rec_2y_sum1 in af_request_applicantinfo.query_rec_2y_sum1%type);
  -- rule:147
  procedure RULE_147(app_id_input in varchar2, v_query_rec_2y_sum5 in af_request_applicantinfo.query_rec_2y_sum5%type);
  -- rule:148
  procedure RULE_148(app_id_input in varchar2, v_query_org_1m_sum1 in af_request_applicantinfo.query_org_1m_sum1%type);
  -- rule:149
  procedure RULE_149(app_id_input in varchar2, v_query_org_1m_sum5 in af_request_applicantinfo.query_org_1m_sum5%type);


  -- rule:1
  procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type);
  -- rule:2
  procedure RULE_2(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:18
  procedure RULE_18(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:19
  procedure RULE_19(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:20
  procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:21
  procedure RULE_21(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);

  -- rule:22
  procedure RULE_22(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:23
  procedure RULE_23(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:24
  procedure RULE_24(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:25
  procedure RULE_25(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:26
  procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:27
  procedure RULE_27(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:28
  procedure RULE_28(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:29
  procedure RULE_29(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:30
  procedure RULE_30(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:31
  procedure RULE_31(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:32
  procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:33
  procedure RULE_33(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:34
  procedure RULE_34(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:35
  procedure RULE_35(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:36
  procedure RULE_36(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:37
  procedure RULE_37(app_id_input in varchar2,v_cumul_pay_months in af_request_applicantinfo.cumul_pay_months%type, v_pboc_yl_pay_status in af_request_applicantinfo.pboc_yl_pay_status%type);


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
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', 'E', '高风险', 'RULE_164', 'RULE', 'Z');
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

     -- rule:138
  procedure RULE_138(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_educationapproach in af_request_applicantinfo.educationapproach%type) is
    v_error varchar2(500);
    begin
      if nvl(v_educls, 'null') != 'null' and nvl(v_educationapproach, 'null') != 'null' then
          if v_educls = v_educationapproach then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_138', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_138: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_138;

 -- rule:139
  procedure RULE_139(app_id_input in varchar2, v_no_pin_debit_card_acct_num in af_request_applicantinfo.no_pin_debit_card_acct_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_no_pin_debit_card_acct_num, 'null') != 'null' then
         if v_no_pin_debit_card_acct_num >=4 then
           --4 为N  未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_139', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_139: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_139;

 -- rule:140
  procedure RULE_140(app_id_input in varchar2, v_no_pd_card_loan_org_number in af_request_applicantinfo.no_pd_card_loan_org_number%type) is
    v_error varchar2(500);
    begin
      if nvl(v_no_pd_card_loan_org_number, 'null') != 'null' and v_no_pd_card_loan_org_number >= 3 then
        -- 3 为N值  未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_140', 'RULE','Z');
          commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_140: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_140;

  -- rule:141
  procedure RULE_141(app_id_input in varchar2, v_no_pd_card_loan_corp_number in af_request_applicantinfo.no_pd_card_loan_corp_number%type) is
    v_error varchar2(500);
    begin
      if nvl(v_no_pd_card_loan_corp_number, 'null') != 'null'and v_no_pd_card_loan_corp_number >= 4 then
        --4为N 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_141', 'RULE','Z');
          commit;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_141: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_141;

 -- rule:142
  procedure RULE_142(app_id_input in varchar2, v_opposite_position in af_request_applicantinfo.opposite_position%type) is
    v_error varchar2(500);
    begin
      if nvl(v_opposite_position, 'null') != 'null' then
         if v_opposite_position > 3 and v_opposite_position < 6 then
          -- 3  6 为X,Y未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_142', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_142: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_142;

 -- rule:143
  procedure RULE_143(app_id_input in varchar2, v_frs_cred_crd_issue_mon in af_request_applicantinfo.frs_cred_crd_issue_mon%type) is
    v_error varchar2(500);
    begin
      if nvl(v_frs_cred_crd_issue_mon, 'null') != 'null'  and months_between(to_date(v_frs_cred_crd_issue_mon,'yyyy-mm-dd'), to_date('20'||substr(app_id_input,1,6),'yyyy-dd-mm')) <= 4 then
          -- 4为N 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_143', 'RULE','Z');
          commit;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_143: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_143;

-- rule:145
  procedure RULE_145(app_id_input in varchar2, v_reship in af_request_applicantinfo.c1_reship%type,v_remobil in af_request_applicantinfo.c1_remobil%type,v_mate_contact_tel in af_request_applicantinfo.mate_contact_tel%type) is
    v_error varchar2(500);
    begin
      if v_reship = '配偶' then
        if nvl(v_remobil, 'null') != 'null' or nvl(v_mate_contact_tel, 'null') != 'null' and v_remobil = v_mate_contact_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_145', 'RULE','Z');
          commit;
          end if;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_145: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_145;

  -- rule:146   540D按照俩年算
    procedure RULE_146(app_id_input in varchar2, v_query_rec_2y_sum1 in af_request_applicantinfo.query_rec_2y_sum1%type) is
    v_error varchar2(500);
    begin
    if nvl(to_char(v_query_rec_2y_sum1), 'null') != 'null' and v_query_rec_2y_sum1 >= 5 then
          -- 5为X 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_146', 'RULE','Z');
          commit;
    end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_146: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_146;

 -- rule:147   540D按俩年算
    procedure RULE_147(app_id_input in varchar2, v_query_rec_2y_sum5 in af_request_applicantinfo.query_rec_2y_sum5%type) is
    v_error varchar2(500);
    begin
      if nvl(to_char(v_query_rec_2y_sum5), 'null') != 'null' and v_query_rec_2y_sum5 >= 5 then
           -- 5为X 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_147', 'RULE','Z');
          commit;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_147: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_147;

 -- rule:148   180D按1月算
    procedure RULE_148(app_id_input in varchar2, v_query_org_1m_sum1 in af_request_applicantinfo.query_org_1m_sum1%type) is
    v_error varchar2(500);
    begin
      if nvl(to_char(v_query_org_1m_sum1), 'null') != 'null' and v_query_org_1m_sum1 >= 5 then
           -- 5为X 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_148', 'RULE','Z');
          commit;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_148: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_148;

-- rule:149   180D按1月算
    procedure RULE_149(app_id_input in varchar2, v_query_org_1m_sum5 in af_request_applicantinfo.query_org_1m_sum5%type) is
    v_error varchar2(500);
    begin
      if nvl(to_char(v_query_org_1m_sum5), 'null') != 'null' and v_query_org_1m_sum5 >= 5 then
          -- 5为X 未知
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_149', 'RULE','Z');
          commit;
        end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_149: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_149;

    -- rule:1
 procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type) is
   v_error varchar(500);
   begin
     if v_reship = '配偶'  then
       if nvl(v_rename,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_1', 'RULE','Z');
         else
       if v_rename = v_mate_name then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_1', '', '', 'RULE_1', 'RULE','Z');
          commit;
        end if;
      end if;
     end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_1: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_1;
-- rule:2
 procedure RULE_2(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_mobile,'null') != 'null'  then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_3', 'NULL', 'NULL', 'RULE_2', 'RULE','Z');
         else
       if v_mobile = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_3', '', '', 'RULE_2', 'RULE','Z');
          commit;
        end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_2: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_2;
-- rule:18
 procedure RULE_18(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_mobile,'null') != 'null'  then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_18', 'RULE','Z');
         else
       if v_mobile = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_18', 'RULE','Z');
          commit;
        end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_18: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_18;
-- rule:19
 procedure RULE_19(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_cotel,'null') != 'null'  then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_19', 'RULE','Z');
         else
       if v_cotel = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_19', 'RULE','Z');
          commit;
        end if;
      end if;
     end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_19: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_19;
-- rule:20
 procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_cotel,'null') != 'null'  then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_20', 'RULE','Z');
        else
       if v_cotel = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_20', 'RULE','Z');
          commit;
        end if;
      end if;
     end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_20: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_20;
-- rule:21
 procedure RULE_21(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_cotel,'null') != 'null'  then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_21', 'RULE','Z');
         else
       if v_cotel = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_21', 'RULE','Z');
          commit;
        end if;
      end if;
     end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_21: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_21;

   -- rule:22
 procedure RULE_22(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_c1_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_22', 'RULE','Z');
         else
       if  v_c1_hmtel || v_hmare = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_22', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_22: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_22;
   -- rule:23
 procedure RULE_23(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_c1_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_23', 'RULE','Z');
         else
       if  v_c1_hmtel || v_hmare = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_23', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_23: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_23;

   -- rule:24
 procedure RULE_24(app_id_input in varchar2,v_c1_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_c1_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_24', 'RULE','Z');
         else
      if  v_c1_hmtel || v_hmare = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_24', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_24: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_24;

   -- rule:25
 procedure RULE_25(app_id_input in varchar2, v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_retel,'null') != 'null' and nvl(v_retelar,'null') != 'null'  then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_24', 'RULE','Z');
         else
       if  v_retel || v_retelar = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_25', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_25: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_25;
   -- rule:26
 procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_remobil,'null') != 'null' then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_26', 'RULE','Z');
         else
       if  v_remobil = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_26', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_26: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_26;

  -- rule:27
 procedure RULE_27(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_retel,'null') != 'null' and nvl(v_retelar,'null') != 'null' then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_27', 'RULE','Z');
         else
       if  v_retel || v_retelar = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_27', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_27: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_27;

   -- rule:28
 procedure RULE_28(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_remobil,'null') != 'null' then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_28', 'RULE','Z');
         else
       if  v_remobil = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_28', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_28: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_28;

   -- rule:29
 procedure RULE_29(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_retel,'null') != 'null' and  nvl(v_retelar,'null') != 'null' then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_29', 'RULE','Z');
         else
       if  v_retel || v_retelar = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_29', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_29: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_29;

   -- rule:30
 procedure RULE_30(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_remobil,'null') != 'null' then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_30', 'RULE','Z');
         else
       if  v_remobil = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_30', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_30: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_30;






    -- rule:31
 procedure RULE_31(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_xtel1,'null') != 'null' and nvl(v_xtelar1,'null') != 'null' then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_31', 'RULE','Z');
         else
       if  v_xtel1 || v_xtelar1  = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_31', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_31: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_31;
    -- rule:32
 procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_xmobil1,'null') != 'null'  then
       if nvl(v_cell_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_32', 'RULE','Z');
         else
       if  v_xmobil1 = v_cell_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_32', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_32: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_32;
    -- rule:33
 procedure RULE_33(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_xtel1,'null') != 'null' and nvl(v_xtelar1,'null') != 'null' then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_33', 'RULE','Z');
         else
       if  v_xtel1 || v_xtelar1 = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_33', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_33: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_33;
    -- rule:34
 procedure RULE_34(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
   v_error varchar(500);
   begin
     if nvl(v_xmobil1,'null') != 'null'  then
       if nvl(v_resi_tel,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_34', 'RULE','Z');
         else
       if  v_xmobil1 = v_resi_tel then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_34', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_34: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_34;


     -- rule:35
 procedure RULE_35(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type, v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_xtel1,'null') != 'null'  and nvl(v_xtelar1,'null') != 'null' then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_35', 'RULE','Z');
         else
       if  v_xtel1 || v_xtelar1 = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_35', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_35: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_35;
     -- rule:36
 procedure RULE_36(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type, v_c_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
   v_error varchar(500);
   begin
     if nvl(v_xmobil1,'null') != 'null' then
       if nvl(v_c_comp_phone,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_36', 'RULE','Z');
         else
       if  v_xmobil1 = v_c_comp_phone then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_2', '', '', 'RULE_36', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_36: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_36;
     -- rule:37
 procedure RULE_37(app_id_input in varchar2,v_cumul_pay_months in af_request_applicantinfo.cumul_pay_months%type, v_pboc_yl_pay_status in af_request_applicantinfo.pboc_yl_pay_status%type) is
   v_error varchar(500);
   begin
     if v_pboc_yl_pay_status = '缴交状态' then
       if nvl(v_cumul_pay_months,'null') = 'null' then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_37', 'RULE','Z');
         else
       if  v_cumul_pay_months >= 6 then
         insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z', 'Z03', 'Z03_1', '', '', 'RULE_37', 'RULE','Z');
          commit;
      end if;
      end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_37: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_37;



end AF_HXBCB_RULE_PKG;
