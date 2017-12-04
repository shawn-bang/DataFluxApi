-- hxb api business rules package and procedure
create or replace package AF_HXBCB_RULE_PKG as
  -- Created : 2017/11/3 17:22:15
  -- Purpose : Rule
  -- 触发规则列表
  --rule:40
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_40(app_id_input in varchar2,v_bad_debt_num in af_request_applicantinfo.bad_debt_num%type);
  --rule:42
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_42(app_id_input in varchar2,v_loan_overdue_month_num in af_request_applicantinfo.loan_overdue_month_num%type);
  --rule:44
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_44(app_id_input in varchar2,v_debit_card_over_due_acct_num in af_request_applicantinfo.debit_card_over_due_acct_num%type);
  --rule:45
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_45(app_id_input in varchar2,v_debit_card_over_due_month in af_request_applicantinfo.debit_card_over_due_month_num%type);
  --rule:46
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_46(app_id_input in varchar2,v_debit_co_due_longest_over in af_request_applicantinfo.debit_co_due_longest_over_due%type);
  --rule:48
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_48(app_id_input in varchar2,v_deb_c60overd_month_num in af_request_applicantinfo.deb_c60overd_month_num%type);
  --rule:49
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_49(app_id_input in varchar2,v_deb_c60overd_longest_over in af_request_applicantinfo.deb_c60overd_longest_over_due%type);
  --rule:65
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_65(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_hmare in af_request_applicantinfo.c1_hmare%type,v_hmtel in af_request_applicantinfo.c1_hmtel%type);
  --rule:67
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_67(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type);
  --rule:68
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_68(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type);
  --rule:70
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_70(app_id_input in varchar2,v_idnbr af_request_applicantinfo.c1_idnbr%type);
  --rule:71
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_71(app_id_input in varchar2,v_idnbr af_request_applicantinfo.c1_idnbr%type);
  --rule:96
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_96(app_id_input in varchar2,v_educationdegree in af_request_applicantinfo.educationdegree%type);
  --rule:98
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_98(app_id_input in varchar2,v_result_xm in af_request_applicantinfo.result_xm%type);
  --rule:118
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_118(app_id_input in varchar2,v_remobil af_request_applicantinfo.c1_remobil%type,  v_mobile af_request_applicantinfo.c1_mobile%type);
  --rule:138
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_138(app_id_input in varchar2,v_educls in af_request_applicantinfo.c1_educls%type,v_educationapproach in af_request_applicantinfo.educationapproach%type);
  --rule:139
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_139(app_id_input in varchar2,v_no_pin_debit_card_acct_num in af_request_applicantinfo.no_pin_debit_card_acct_num%type);
  --rule:140
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_140(app_id_input in varchar2,v_no_pd_card_loan_org_number in af_request_applicantinfo.no_pd_card_loan_org_number%type);
  --rule:141
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_141(app_id_input in varchar2,v_no_pd_card_loan_corp_number in af_request_applicantinfo.no_pd_card_loan_corp_number%type);
  --rule:143
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_143(app_id_input in varchar2,v_frs_cred_crd_issue_mon af_request_applicantinfo.frs_cred_crd_issue_mon%type);
  --rule:145
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_145(app_id_input in varchar2,v_reship in af_request_applicantinfo.c1_reship%type, v_mate_contact_tel in af_request_applicantinfo.mate_contact_tel%type,v_remobil in af_request_applicantinfo.c1_remobil%type);
  --rule:152_1
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_152_1(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);
  --rule:152_2
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_152_2(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);
  --rule:152_4
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_152_4(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);
  --rule:153_2
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_153_2(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);
  --rule:153_3
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_153_3(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);
  --rule:179
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_179(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type);
  --rule:182
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_182(app_id_input in varchar2,v_coname in af_request_applicantinfo.c1_coname%type);
  --rule:198
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_198(app_id_input in varchar2,v1v2_flag in af_request_applicantinfo.c1c2_flag%type,v2_gender  in af_request_applicantinfo.c2_gender%type,v2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v2_idtype in af_request_applicantinfo.c2_idtype%type,v_gender in af_request_applicantinfo.c1_gender%type,v_idtype in  af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type);
  --rule:236
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_236(app_id_input in varchar2);
  -- rule:121
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_121(app_id_input in varchar2,v_idtype in varchar2, v_idnbr in varchar2,v_iddt1 in varchar2,v_idte1 in varchar2,v_birth in varchar2);
  -- rule:122
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_122(app_id_input in varchar2,v_idte1 in varchar2,v_iddt1 in varchar2);
  -- rule:125
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_125(app_id_input in varchar2,v_wifimacenenglish in varchar2);
  -- rule:126
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_126(app_id_input in varchar2,v_imeienenglish in varchar2);
  -- rule:127
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_127(app_id_input in varchar2,v_imsienenglish in varchar2);
  -- rule:128
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_128(app_id_input in varchar2,v_ipenenglish in varchar2);
  -- rule:129
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_129(app_id_input in varchar2,v_codeaddrenglish in varchar2);
  -- rule:130
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_130(app_id_input in varchar2,v_codeemailenglish in varchar2);
  -- rule:131
  --@author chen
  --@date 2017-12-1 18:52:00
  procedure RULE_131(app_id_input in varchar2,v_codenameenglish in varchar2);
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
  procedure RULE_168(app_id_input in varchar2, v_hmtel in varchar2);
  -- rule:232
  procedure RULE_232(app_id_input in varchar2, v_abuser in af_request_applicantinfo.c4_abuser%type, v_abname in af_request_applicantinfo.c4_abname%type);


  -- rule:1
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type);
  -- rule:2
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_2(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:18
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_18(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:19
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_19(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:20
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:21
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_21(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:22
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_22(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:23
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_23(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:24
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_24(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:25
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_25(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:26
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:27
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_27(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:28
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_28(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:29
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_29(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:30
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_30(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:31
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_31(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:32
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:33
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_33(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:34
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_34(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:35
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_35(app_id_input in varchar2, v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:36
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_36(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:37
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_37(app_id_input in varchar2,v_cumul_pay_months in af_request_applicantinfo.cumul_pay_months%type, v_pboc_yl_pay_status in af_request_applicantinfo.pboc_yl_pay_status%type);
  -- rule:38
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_38(app_id_input in varchar2,v_pboc_gjj_pay_status in af_request_applicantinfo.pboc_gjj_pay_status%type,v_pay_ym in af_request_applicantinfo.pay_ym%type, v_first_deposit_ym in af_request_applicantinfo.first_deposit_ym%type);
  -- rule:80
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_80(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type);
  -- rule:142
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_142(app_id_input in varchar2, v_opposite_position in af_request_applicantinfo.opposite_position%type);
  -- rule:146
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_146(app_id_input in varchar2, v_query_rec_2y_sum1 in af_request_applicantinfo.query_rec_2y_sum1%type);
  -- rule:147
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_147(app_id_input in varchar2, v_query_rec_2y_sum5 in af_request_applicantinfo.query_rec_2y_sum5%type);
  -- rule:148
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_148(app_id_input in varchar2, v_query_org_1m_sum1 in af_request_applicantinfo.query_org_1m_sum1%type);
  -- rule:149
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_149(app_id_input in varchar2, v_query_org_1m_sum5 in af_request_applicantinfo.query_org_1m_sum5%type);
  -- rule:175
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_175(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_reship in af_request_applicantinfo.c1_reship%type);
  -- rule:176
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_176(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type);
  -- rule:178
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_178(app_id_input in varchar2,v_xname1 in af_request_applicantinfo.c1_xname1%type,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type);

end AF_HXBCB_RULE_PKG;

/
create or replace package body AF_HXBCB_RULE_PKG as

  -- rule:40
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_40(app_id_input in varchar2,v_bad_debt_num in af_request_applicantinfo.bad_debt_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_bad_debt_num,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_40', 'RULE','Z');
        commit;
      elsif v_bad_debt_num >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_40', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_40: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_40;

  -- rule:42
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_42(app_id_input in varchar2,v_loan_overdue_month_num in af_request_applicantinfo.loan_overdue_month_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_loan_overdue_month_num,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_42', 'RULE','Z');
        commit;
      elsif v_loan_overdue_month_num >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_42', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_42: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_42;

  -- rule:44
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_44(app_id_input in varchar2,v_debit_card_over_due_acct_num af_request_applicantinfo.debit_card_over_due_acct_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_debit_card_over_due_acct_num,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_44', 'RULE','Z');
        commit;
      elsif v_debit_card_over_due_acct_num >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_44', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_44: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_44;

  -- rule:45
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_45(app_id_input in varchar2,v_debit_card_over_due_month in af_request_applicantinfo.debit_card_over_due_month_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_debit_card_over_due_month,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_45', 'RULE','Z');
        commit;
      elsif v_debit_card_over_due_month >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_45', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_45: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_45;

  -- rule:46
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_46(app_id_input in varchar2,v_debit_co_due_longest_over in af_request_applicantinfo.debit_co_due_longest_over_due%type) is
    v_error varchar2(500);
    begin
      if nvl(v_debit_co_due_longest_over,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_46', 'RULE','Z');
        commit;
      elsif v_debit_co_due_longest_over >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_46', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_46: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_46;

  -- rule:48
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_48(app_id_input in varchar2,v_deb_c60overd_month_num in af_request_applicantinfo.deb_c60overd_month_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_deb_c60overd_month_num,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_48', 'RULE','Z');
        commit;
      elsif v_deb_c60overd_month_num >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_48', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_48: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_48;

  -- rule:49
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_49(app_id_input in varchar2,v_deb_c60overd_longest_over in af_request_applicantinfo.deb_c60overd_longest_over_due%type) is
    v_error varchar2(500);
    begin
      if nvl(v_deb_c60overd_longest_over,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_49', 'RULE','Z');
        commit;
      elsif v_deb_c60overd_longest_over >= 2  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_49', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_49: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_49;

  -- rule:65
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_65(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_hmare in af_request_applicantinfo.c1_hmare%type,v_hmtel in af_request_applicantinfo.c1_hmtel%type) is
    v_error varchar2(500);
    begin
      if nvl(v_hmare,'null') != 'null' and nvl(v_hmtel,'null') != 'null' and nvl(v_cotel,'null') != 'null' and v_hmare || v_hmtel = v_cotel then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_65', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_65: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_65;

  -- rule:67
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_67(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type) is
    v_error varchar2(500);
    begin
      -- 假设码值是5,后面还需要根据具体的码表更改
      if nvl(v_cycadd1,'null') != 'null' and v_cycadd1 = 'B' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_3', '', '', 'RULE_67', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_67: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_67;

  -- rule:68
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_68(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type) is
    v_error varchar2(500);
    begin
      -- 动态码值,后面还需要根据具体的需求更改
      if nvl(v_cycadd1,'null') != 'null' and v_cycadd1 = 'H' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_3', '', '', 'RULE_68', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_68: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_68;

  -- rule:70
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_70(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    flag number;
    v_error varchar2(500);
    begin
      select count(distinct(t.c1_mobile))
      into flag
      from af_request_appinfo_his_hot t
      where 1 = 1
            and t.c1_idnbr = v_idnbr
            and t.c1_mobile is not null;
      if flag >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_70', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_70: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_70;

  -- rule:71
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_71(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    flag number;
    v_error varchar2(500);
    begin
      select count(distinct(t.c1_cotel))
      into flag
      from af_request_appinfo_his_hot t
      where t.c1_idnbr = v_idnbr
            and t.c1_cotel is not null;
      if flag >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_71', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_71: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_71;

  -- rule:96
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_96(app_id_input in varchar2,v_educationdegree in af_request_applicantinfo.educationdegree%type) is
    v_error varchar2(500);
    begin
      if nvl(v_educationdegree,'null') != 'null' then
        -- educationdegree学历对应码值判断学位是否高于大专
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_96', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_96: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_96;

  -- rule:98
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_98(app_id_input in varchar2,v_result_xm in af_request_applicantinfo.result_xm%type) is
    v_error varchar2(500);
    begin
      if nvl(v_result_xm,'null') != 'null' then
        -- result_xm公民身份号码核查结果码值需要确定
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_98', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_98: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_98;

  -- rule:118
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_118(app_id_input in varchar2, v_remobil af_request_applicantinfo.c1_remobil%type,  v_mobile af_request_applicantinfo.c1_mobile%type) is
    v_error varchar2(500);
    begin
      if nvl(v_remobil,'null') != 'null' and nvl(v_mobile,'null') != 'null' and v_remobil = v_mobile  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_118', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_118: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_118;

  -- rule:138
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_138(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_educationapproach in af_request_applicantinfo.educationapproach%type) is
    v_error varchar2(500);
    begin
      if nvl(v_educls,'null') != 'null' and nvl(v_educationapproach,'null') != 'null'  and v_educls = v_educationapproach then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_138', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_138: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_138;

  -- rule:139
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_139(app_id_input in varchar2,v_no_pin_debit_card_acct_num in af_request_applicantinfo.no_pin_debit_card_acct_num%type) is
    v_error varchar2(500);
    begin
      --N的值不确定
      if nvl(v_no_pin_debit_card_acct_num,'null') = 'null'  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_139', 'RULE','Z');
        commit;
      elsif v_no_pin_debit_card_acct_num >= 'N' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_139', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_139: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_139;

  -- rule:140
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_140(app_id_input in varchar2,v_no_pd_card_loan_org_number in af_request_applicantinfo.no_pd_card_loan_org_number%type) is
    v_error varchar2(500);
    begin
      --N的值不确定
      if nvl(v_no_pd_card_loan_org_number,'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_140', 'RULE','Z');
        commit;
      elsif  v_no_pd_card_loan_org_number >= 'N'  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_140', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_140: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_140;

  -- rule:141
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_141(app_id_input in varchar2,v_no_pd_card_loan_corp_number in af_request_applicantinfo.no_pd_card_loan_corp_number%type) is
    v_error varchar2(500);
    begin
      --N的值不确定
      if nvl(v_no_pd_card_loan_corp_number,'null') = 'null'then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_141', 'RULE','Z');
        commit;
      elsif  v_no_pd_card_loan_corp_number >= 'N'  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_141', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_141: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_141;

  -- rule:143
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_143(app_id_input in varchar2,v_frs_cred_crd_issue_mon in af_request_applicantinfo.frs_cred_crd_issue_mon%type) is
    v_error varchar2(500);
    begin
      --N的值不确定
      if nvl(v_frs_cred_crd_issue_mon,'null') = 'null'  then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_143', 'RULE','Z');
        commit;
      elsif  v_frs_cred_crd_issue_mon <= 'N' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_143', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_143: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_143;

  -- rule:145
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_145(app_id_input in varchar2,v_reship in af_request_applicantinfo.c1_reship%type,v_mate_contact_tel in af_request_applicantinfo.mate_contact_tel%type,v_remobil in af_request_applicantinfo.c1_remobil%type) is
    v_error varchar2(500);
    begin
      --c1_reship配偶是字段 还是码值不确定
      if v_reship = '配偶' and nvl(v_remobil,'null') != 'null' then
        if nvl(v_mate_contact_tel,'null') = 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_145', 'RULE','Z');
          commit;
        elsif v_remobil = v_mate_contact_tel then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_145', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_145: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_145;

  -- rule:152_1
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_152_1(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      -- c4_apsour推广进件来源的码值还需要根据具体的码表更改判断码值是否等于 (我行客户 or 陌生拜访 or 电话营销 or 信函营销)
      if nvl(v_apsour,'null') != 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_152_1', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_152_1: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_152_1;

  -- rule:152_2
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_152_2(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      -- c4_apsour推广进件来源的码值还需要根据具体的码表更改判断码值是否等于 (我行客户 or 陌生拜访 or 电话营销 or 信函营销)
      if nvl(v_apsour,'null') != 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_152_2', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_152_2: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_152_2;

  -- rule:152_4
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_152_4(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      -- c4_apsour推广进件来源的码值还需要根据具体的码表更改判断码值是否等于 (我行客户 or 陌生拜访 or 电话营销 or 信函营销)
      if nvl(v_apsour,'null') != 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_152_4', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_152_4: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_152_4;

  -- rule:153_2
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_153_2(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      -- c4_apsour推广进件来源的码值还需要判断码值是否等于 (他人转介 or 设点营销 or 熟人介绍 or 自进件)
      if nvl(v_apsour,'null') != 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_153_2', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_153_2: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_153_2;

  -- rule:153_3
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_153_3(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      -- c4_apsour推广进件来源的码值还需要判断码值是否等于 (他人转介 or 设点营销 or 熟人介绍 or 自进件)
      if nvl(v_apsour,'null') != 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_153_3', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_153_3: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_153_3;

  -- rule:179
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_179(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type) is
    flag number;
    v_error varchar2(500);
    --N的值还需要确定
    begin
      if nvl(v_remobil,'null') != 'null' and nvl(v_remobil,'null') != 'null' then
        select count(1)
        into flag
        from af_request_appinfo_his_hot t
        where t.c1_remobil = v_remobil
              and t.c1_rename != v_rename;
        if flag > 'N' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_179', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_179: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_179;

  -- rule:182
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_182(app_id_input in varchar2,v_coname in af_request_applicantinfo.c1_coname%type) is
    v_error varchar2(500);
    begin
      if nvl(v_coname,'null') != 'null' and instr(v_coname,'投资') != '0' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_4', '', '', 'RULE_182', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_182: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_182;

  -- rule:198
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_198(app_id_input in varchar2,v1v2_flag in af_request_applicantinfo.c1c2_flag%type,v2_gender  in af_request_applicantinfo.c2_gender%type,v2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v2_idtype in af_request_applicantinfo.c2_idtype%type,v_gender in af_request_applicantinfo.c1_gender%type,v_idtype in  af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    v_error varchar2(500);
    begin
      --'v_idtype码值和v1v2_flag所对应的码值还需要确定,'
      if v1v2_flag = '主卡' and nvl(v_gender,'null') != 'null' and v_idtype = '身份证' then
        if mod(substr(v_idnbr,-2,1),2) = 0 and v_gender = '女' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'W2', 'W01', 'W01_4', '', '', 'RULE_198', 'RULE','Z');
          commit;
        end if;
        if mod(substr(v_idnbr,-2,1),2) = 1 and  v_gender = '男' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'W2', 'W01', 'W01_4', '', '', 'RULE_198', 'RULE','Z');
          commit;
        end if;
      elsif  nvl(v2_gender,'null') != 'null' and v2_idtype = '身份证'  then
        if mod(substr(v2_idnbr,-2,1),2) = 0 and v2_gender = '女' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'W2', 'W01', 'W01_4', '', '', 'RULE_198', 'RULE','Z');
          commit;
        end if;
        if mod(substr(v2_idnbr,-2,1),2) = 1 and  v2_gender = '男' then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'W2', 'W01', 'W01_4', '', '', 'RULE_198', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_198: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_198;

  -- rule:236
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_236(app_id_input in varchar2) is
    v_error varchar2(500);
    begin
      if substr(app_id_input,11,1) = 'V' then
        -- update result data
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno,type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_236', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_236: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_236;

  -- rule:121
  -- @author chen
  -- @date 2017-12-1 18:52:00
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
        if trunc(months_between(to_date(v_iddt1,'yyyy-mm-dd'), to_date(RULE_121.birth,'yyyy-mm-dd'))/ 12,2) > 46 and v_idte1 != '长期' then
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

  -- rule:122
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_122(app_id_input in varchar2,v_idte1 in varchar2,v_iddt1 in varchar2) is
    b_date varchar2(10);
    v_error varchar2(500);
    begin
      --需要确定是否会出现v_idte1是长期的情况
      if  nvl(v_idte1,'null') != 'null' and nvl(v_iddt1,'null') != 'null' and v_idte1 != '长期'  then
        RULE_122.b_date := trunc(months_between(to_date(v_idte1,'yyyy-mm-dd'),to_date('20'||substr(app_id_input,1,6),'yyyy-mm-dd')),2);
        if  RULE_122.b_date <=3  then
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

  -- rule:125
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_125(app_id_input in varchar2,v_wifimacenenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_wifimacenenglish,'null') != 'null' and v_wifimacenenglish = 'WIFI-MAC_Histroy_NegativeLis' then
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

  -- rule:126
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_126(app_id_input in varchar2,v_imeienenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_imeienenglish,'null') != 'null' and v_imeienenglish = 'IMEI_Histroy_NegativeList' then
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

  -- rule:127
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_127(app_id_input in varchar2,v_imsienenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_imsienenglish,'null') != 'null' and v_imsienenglish = 'IMSI_Histroy_NegativeList' then
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

  -- rule:128
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_128(app_id_input in varchar2,v_ipenenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_ipenenglish,'null') != 'null' and  v_ipenenglish = 'IP_Mismatch' then
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

  -- rule:129
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_129(app_id_input in varchar2,v_codeaddrenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codeaddrenglish,'null') != 'null' and v_codeaddrenglish = 'ADDR_Mismatch' then
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

  -- rule:130
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_130(app_id_input in varchar2,v_codeemailenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codeemailenglish,'null') != 'null' and v_codeemailenglish = 'EMAIL_Histroy_NegativeList'  then
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

  -- rule:131
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_131(app_id_input in varchar2,v_codenameenglish in varchar2) is
    v_error varchar2(500);
    begin
      if nvl(v_codenameenglish,'null') != 'null' and v_codenameenglish = 'NAME_Mismatch' then
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
        -- TODO certifi_type check?
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

  -- rule:1
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type) is
    v_error varchar(500);
    begin
      if v_reship = '配偶'  then
        if nvl(v_rename,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_1', 'RULE','Z');
        elsif v_rename = v_mate_name then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_1', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_1: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_1;

  -- rule:2
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_2(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_mobile,'null') != 'null'  then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_3', 'NULL', 'NULL', 'RULE_2', 'RULE','Z');
        elsif v_mobile = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_3', '', '', 'RULE_2', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_2: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_2;

  -- rule:18
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_18(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_mobile,'null') != 'null'  then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_18', 'RULE','Z');
        elsif v_mobile = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_18', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_18: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_18;

  -- rule:19
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_19(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_cotel,'null') != 'null'  then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_19', 'RULE','Z');
        elsif v_cotel = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_19', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_19: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_19;

  -- rule:20
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_cotel,'null') != 'null'  then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_20', 'RULE','Z');
        elsif v_cotel = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_20', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_20: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_20;

  -- rule:21
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_21(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_cotel,'null') != 'null'  then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_21', 'RULE','Z');
        elsif v_cotel = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_21', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_21: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_21;

  -- rule:22
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_22(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_22', 'RULE','Z');
        elsif  v_hmtel || v_hmare = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_22', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_22: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_22;

  -- rule:23
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_23(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_23', 'RULE','Z');
        elsif  v_hmtel || v_hmare = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_23', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_23: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_23;

  -- rule:24
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_24(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_24', 'RULE','Z');
        elsif  v_hmtel || v_hmare = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_24', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_24: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_24;

  -- rule:25
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_25(app_id_input in varchar2, v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_retel,'null') != 'null' and nvl(v_retelar,'null') != 'null'  then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_24', 'RULE','Z');
        elsif  v_retel || v_retelar = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_25', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_25: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_25;

  -- rule:26
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_remobil,'null') != 'null' then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_26', 'RULE','Z');
        elsif  v_remobil = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_26', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_26: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_26;

  -- rule:27
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_27(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_retel,'null') != 'null' and nvl(v_retelar,'null') != 'null' then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_27', 'RULE','Z');
        elsif  v_retel || v_retelar = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_27', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_27: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_27;

  -- rule:28
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_28(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_remobil,'null') != 'null' then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_28', 'RULE','Z');
        elsif  v_remobil = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_28', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_28: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_28;

  -- rule:29
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_29(app_id_input in varchar2,v_retel in af_request_applicantinfo.c1_retel%type,v_retelar in af_request_applicantinfo.cell_phone%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_retel,'null') != 'null' and  nvl(v_retelar,'null') != 'null' then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_29', 'RULE','Z');
        elsif  v_retel || v_retelar = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_29', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_29: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_29;

  -- rule:30
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_30(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_remobil,'null') != 'null' then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_30', 'RULE','Z');
        elsif  v_remobil = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_30', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_30: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_30;

  -- rule:31
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_31(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_xtel1,'null') != 'null' and nvl(v_xtelar1,'null') != 'null' then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_31', 'RULE','Z');
        elsif  v_xtel1 || v_xtelar1  = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_31', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_31: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_31;

  -- rule:32
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_xmobil1,'null') != 'null'  then
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_32', 'RULE','Z');
        elsif  v_xmobil1 = v_cell_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_32', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_32: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_32;

  -- rule:33
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_33(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_xtel1,'null') != 'null' and nvl(v_xtelar1,'null') != 'null' then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_33', 'RULE','Z');
        elsif  v_xtel1 || v_xtelar1 = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_33', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_33: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_33;

  -- rule:34
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_34(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_xmobil1,'null') != 'null'  then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_34', 'RULE','Z');
        elsif  v_xmobil1 = v_resi_tel then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_34', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_34: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_34;

  -- rule:35
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_35(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type, v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_xtel1,'null') != 'null'  and nvl(v_xtelar1,'null') != 'null' then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_35', 'RULE','Z');
        elsif  v_xtel1 || v_xtelar1 = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_35', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_35: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_35;

  -- rule:36
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_36(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type, v_comp_phone in af_request_applicantinfo.c_comp_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_xmobil1,'null') != 'null' then
        if nvl(v_comp_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', 'NULL', 'NULL', 'RULE_36', 'RULE','Z');
        elsif  v_xmobil1 = v_comp_phone then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_2', '', '', 'RULE_36', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_36: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_36;

  -- rule:37
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_37(app_id_input in varchar2,v_cumul_pay_months in af_request_applicantinfo.cumul_pay_months%type, v_pboc_yl_pay_status in af_request_applicantinfo.pboc_yl_pay_status%type) is
    v_error varchar(500);
    begin
      if v_pboc_yl_pay_status = '缴交状态' then
        if nvl(v_cumul_pay_months,'null') = 'null' then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_37', 'RULE','Z');
        elsif  v_cumul_pay_months >= 6 then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_37', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_37: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_37;

  -- rule:38
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_38(app_id_input in varchar2,v_pboc_gjj_pay_status in af_request_applicantinfo.pboc_gjj_pay_status%type,v_pay_ym in af_request_applicantinfo.pay_ym%type, v_first_deposit_ym in af_request_applicantinfo.first_deposit_ym%type) is
    b_date varchar2(10);
    v_error varchar(500);
    begin
      if v_pboc_gjj_pay_status = '缴交状态' then
        b_date := trunc(months_between(to_date(v_pay_ym,'yyyy-mm-dd'),to_date(v_first_deposit_ym,'yyyy-mm-dd')),2);
        if nvl(v_first_deposit_ym,'null') = 'null' and nvl(v_pay_ym,'null') = 'null'  then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', 'NULL', 'NULL', 'RULE_38', 'RULE','Z');
        elsif  b_date >= 6 then
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z03', 'Z03_1', '', '', 'RULE_38', 'RULE','Z');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_38: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_38;

  -- rule:80
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_80(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    flag1 number;
    flag2 number;
    v_error varchar2(500);
    begin
      if nvl(v_mobile, 'null') != 'null' then
        select count(1) into flag1
        from af_request_applicantinfo t
         where v_mobile = t.c1_mobile ;
        if flag1 > 1 then
          select count(distinct c1_idnbr) into flag2
          from af_request_applicantinfo t
           where v_mobile = t.c1_mobile ;
          if flag2 > 3 then
          -- update result data
            insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_80', 'RULE');
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_80: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_80;

-- rule:141
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_141(app_id_input in varchar2, v_no_pd_card_loan_corp_number in af_request_applicantinfo.no_pd_card_loan_corp_number%type) is
    v_error varchar2(500);
    begin
      --4为N 未知
      if nvl(v_no_pd_card_loan_corp_number, 'null') != 'null'and v_no_pd_card_loan_corp_number >= 4 then
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
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_142(app_id_input in varchar2, v_opposite_position in af_request_applicantinfo.opposite_position%type) is
    v_error varchar2(500);
    begin
      if nvl(v_opposite_position, 'null') != 'null' then
        -- 3  6 为X,Y未知
        if v_opposite_position > 3 and v_opposite_position < 6 then
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

  -- rule:146
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_146(app_id_input in varchar2, v_query_rec_2y_sum1 in af_request_applicantinfo.query_rec_2y_sum1%type) is
    v_error varchar2(500);
    begin
      -- 5为X 未知
      if nvl(to_char(v_query_rec_2y_sum1), 'null') != 'null' and v_query_rec_2y_sum1 >= 5 then
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_146', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_146: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_146;

  -- rule:147
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_147(app_id_input in varchar2, v_query_rec_2y_sum5 in af_request_applicantinfo.query_rec_2y_sum5%type) is
    v_error varchar2(500);
    begin
      -- 5为X 未知
      if nvl(to_char(v_query_rec_2y_sum5), 'null') != 'null' and v_query_rec_2y_sum5 >= 5 then
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_147', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_147: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_147;

  -- rule:148
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_148(app_id_input in varchar2, v_query_org_1m_sum1 in af_request_applicantinfo.query_org_1m_sum1%type) is
    v_error varchar2(500);
    begin
      -- 5为X 未知
      if nvl(to_char(v_query_org_1m_sum1), 'null') != 'null' and v_query_org_1m_sum1 >= 5 then
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_148', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_148: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_148;

  -- rule:149
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_149(app_id_input in varchar2, v_query_org_1m_sum5 in af_request_applicantinfo.query_org_1m_sum5%type) is
    v_error varchar2(500);
    begin
      -- 5为X 未知
      if nvl(to_char(v_query_org_1m_sum5), 'null') != 'null' and v_query_org_1m_sum5 >= 5 then
        insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type,class) values(app_id_input, 'Z2', 'Z01', 'Z01_4', 'D', '', 'RULE_149', 'RULE','Z');
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_149: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_149;

  -- rule:175
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_175(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_reship in af_request_applicantinfo.c1_reship%type) is
    flag1 number;
    N number;
    v_error varchar2(500);
    --N 未知
    begin
      if nvl(v_remobil, 'null') != 'null' and nvl(v_reship, 'null') != 'null' then
        select count(1) into flag1
        from af_request_applicantinfo t
         where v_remobil = t.c1_remobil and v_reship != t.c1_reship;
        if flag1 > N then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_175', 'RULE');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_175: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_175;

  -- rule:176
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_176(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type) is
    flag number;
    N number;
    v_error varchar2(500);
    --N 未知
    begin
      if nvl(v_remobil, 'null') != 'null' and nvl(v_rename, 'null') != 'null' then
        select count(1) into flag
        from af_request_applicantinfo t
         where v_rename = t.c1_xname1 and v_remobil = t.c1_xmobil1;
        if flag > N then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_2', '', '', 'RULE_176', 'RULE');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_176: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_176;

  -- rule:178
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_178(app_id_input in varchar2,v_xname1 in af_request_applicantinfo.c1_xname1%type,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type) is
    flag number;
    N number;
    v_error varchar2(500);
    --N 未知
    begin
      if nvl(v_xname1, 'null') != 'null' and nvl(v_xmobil1, 'null') != 'null' then
        select count(1) into flag
        from af_request_applicantinfo t
         where t.c1_remobil = v_xmobil1 and t.c1_rename = v_xname1 ;
        if flag > N then
          -- update result data
          insert into af_response_afriskwarning(app_id, riskno, risktype, riskcategory, riskcode, riskdesc, ruleno, type) values(app_id_input, 'Z2', 'Z01', 'Z01_1', '', '', 'RULE_178', 'RULE');
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_178: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_178;
end AF_HXBCB_RULE_PKG;
