create or replace package AF_HXBCB_RULE_PKG as
  -- Created     : 2017/11/3 17:22:15
  -- Purpose     : Rule
  -- Description : 规则列表

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

  -------------------------------------------------------------------------------------------------
  -- author: shawn
  -- 2017-12-15 17:00:00
  -- 非模糊匹配规则
  -------------------------------------------------------------------------------------------------

  procedure rule_78(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type);

  procedure rule_102(app_id_input in varchar2);

  procedure rule_122(app_id_input in varchar2, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type,v_idtype in af_request_applicantinfo.c1_idtype%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type, v_c5_idte1 in af_request_applicantinfo.c5_idte1%type, v_c5_idte2 in af_request_applicantinfo.c5_idte2%type, v_c2_iddt1 in af_request_applicantinfo.c2_iddt1%type, v_c2_iddt2 in af_request_applicantinfo.c2_iddt2%type, v_idnbr in af_request_applicantinfo.c1_idnbr%type, v_c2_idnbr in af_request_applicantinfo.c2_idnbr%type, v_app_time in af_request_applicantinfo.app_time%type);

  procedure rule_172(app_id_input in varchar2, v_exist_card_flag in af_request_applicantinfo.exist_card_flag%type, v_bk_acc_status in af_request_applicantinfo.remain_bk_acc_status%type, v_ydj_acc_status in af_request_applicantinfo.remian_ydj_acc_status%type);

  procedure rule_177(app_id_input in varchar2, v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type);

  procedure rule_224(app_id_input in varchar2, v_is_online  in varchar2);

  procedure rule_225_227(app_id_input in varchar2, v_is_online  in varchar2, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);

  procedure rule_238(app_id_input in varchar2, v_is_online  in varchar2, v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type, v_ivs_score in af_request_applicantinfo.ivs_score%type);
  -------------------------------------------------------------------------------------------------
  -- author: chen
  -- 2017-12-21 17:00:00
  -------------------------------------------------------------------------------------------------

  -- rule:3
  -- @author chen
  -- @date 2017-12-11 11:52:00
  procedure RULE_PBOC_CONAME_3(app_id_input in varchar2);

  -- rule:4
  -- @author chen
  -- @date 2017-12-14 11:52:00
  procedure RULE_PBOC_CONAME_4(app_id_input in varchar2);

  -- rule:40
  -- @author chen
  procedure RULE_40(app_id_input in varchar2,v_bad_debt_num in af_request_applicantinfo.bad_debt_num%type);

  -- rule:44
  -- @author chen
  procedure RULE_44(app_id_input in varchar2,v_debit_card_over_due_acct_num af_request_applicantinfo.debit_card_over_due_acct_num%type);

  -- rule:45
  -- @author chen
  procedure RULE_45(app_id_input in varchar2,v_debit_card_over_due_month in af_request_applicantinfo.debit_card_over_due_month_num%type);

  -- rule:46
  -- @author chen
  procedure RULE_46(app_id_input in varchar2, v_debit_co_due_longest_over af_request_applicantinfo.debit_co_due_longest_over_due%type);

  -- rule:67
  -- @author chen
  procedure RULE_67(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type);

  -- rule:70
  -- @author chen
  procedure RULE_70(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_mobile in af_request_applicantinfo.c1_mobile%type);

  -- rule:71
  -- @author chen
  procedure RULE_71(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_cotel in af_request_applicantinfo.c1_cotel%type);

  -- rule:73
  -- @author chen
  --procedure RULE_73(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type);

  -- rule:75
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_75(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type);

  -- rule:82
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_82(app_id_input in varchar2,v_cotel af_request_applicantinfo.c1_cotel%type);

  -- rule:83
  -- @author chen
  -- @date 2017-12-18 10:02:00
  --procedure RULE_83(app_id_input in varchar2,v_cotel af_request_applicantinfo.c1_cotel%type);

  -- rule:98
  -- @author chen
  procedure RULE_98(app_id_input in varchar2,v_result_xm in af_request_applicantinfo.result_xm%type,v_result_gmsfhm in af_request_applicantinfo.result_gmsfhm%type,v_idtype in af_request_applicantinfo.c1_idtype%type);

  -- rule:116
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_116(app_id_input in varchar2,v_is_online  in varchar2,v_c5_abcode  af_request_applicantinfo.c5_abcode%type);

  -- rule:117
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_117(app_id_input in varchar2,v_cotel af_request_applicantinfo.c1_cotel%type);

  -- rule:123
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_123(app_id_input in varchar2,v_mobile af_request_applicantinfo.c1_mobile%type);

  -- rule:135
  -- @author chen
  -- @date 2017-12-20 9:52:00
  procedure RULE_CRM_HMADD_135(app_id_input in varchar2);

  -- rule:137
  -- @author chen
  -- @date 2017-12-19 19:38:00
  procedure RULE_CRM_COADD_137(app_id_input in varchar2);

  -- rule:138
  -- @author chen
  procedure RULE_138(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_educationdegree in af_request_applicantinfo.educationdegree%type);

  -- rule:143
  -- @author chen
  procedure RULE_143(app_id_input in varchar2,v_frs_cred_crd_issue_mon in af_request_applicantinfo.frs_cred_crd_issue_mon%type);

  -- rule:145
  -- @author chen
  procedure RULE_145(app_id_input in varchar2,v_reship in af_request_applicantinfo.c1_reship%type,v_mate_contact_tel in af_request_applicantinfo.mate_contact_tel%type,v_remobil in af_request_applicantinfo.c1_remobil%type);

  -- rule:152
  -- @author chen
  procedure RULE_152(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type);

  -- rule:178
  -- @author chen
  procedure RULE_178(app_id_input in varchar2,v_xname1 in af_request_applicantinfo.c1_xname1%type,v_xmobil1 af_request_applicantinfo.c1_xmobil1%type);

  -- rule:179
  -- @author chen
  procedure RULE_179(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type);

  -- rule:182
  -- @author chen
  procedure RULE_182(app_id_input in varchar2,v_coname in af_request_applicantinfo.c1_coname%type);

  -- rule:198
  -- @author chen
  procedure RULE_198(app_id_input in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type,v_c2_gender  in af_request_applicantinfo.c2_gender%type,v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type,v_gender in af_request_applicantinfo.c1_gender%type,v_idtype in  af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type);

  -- rule:234
  -- @author chen
  procedure RULE_234(app_id_input in varchar2);

  -------------------------------------------------------------------------------------------------
  -- author: song
  -- 2017-12-15 19:50:00
  -------------------------------------------------------------------------------------------------
  -- rule:1
  procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type);
  -- rule:2
  procedure RULE_2(app_id_input in varchar2,v_mobile in af_request_applicantinfo.c1_mobile%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:6
  procedure RULE_PBOC_CONAME_6(app_id_input in varchar2);
  -- rule:7
  procedure RULE_PBOC_HMADD_7(app_id_input in varchar2);
  -- rule:8
  procedure RULE_PBOC_HMADD_8(app_id_input in varchar2);
  -- rule:13
  procedure RULE_PBOC_COADD_13(app_id_input in varchar2);
  -- rule:14
  procedure RULE_PBOC_COADD_14(app_id_input in varchar2);
  -- rule:15
  procedure RULE_PBOC_COADD_15(app_id_input in varchar2);
  -- rule:20
  procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:21
  procedure RULE_21(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:23
  procedure RULE_23(app_id_input in varchar2,v_hmtel in af_request_applicantinfo.c1_hmtel%type,v_hmare in af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type);
  -- rule:24
  procedure RULE_24(app_id_input in varchar2,v_hmtel in af_request_applicantinfo.c1_hmtel%type,v_hmare in af_request_applicantinfo.c1_hmare%type, v_comp_phone in af_request_applicantinfo.c_comp_phone%type);
  -- rule:26
  procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:32
  procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type);
  -- rule:38
  procedure RULE_38(app_id_input in varchar2,v_pboc_gjj_pay_status in af_request_applicantinfo.pboc_gjj_pay_status%type,v_pay_ym in af_request_applicantinfo.pay_ym%type, v_first_deposit_ym in af_request_applicantinfo.first_deposit_ym%type);
  -- rule:39
  procedure RULE_39(app_id_input in varchar2,v_industry_type1 in af_request_applicantinfo.industry_type1%type,v_industry_type2 in af_request_applicantinfo.industry_type2%type,v_industry_type3 in af_request_applicantinfo.industry_type3%type,
                    v_industry_type4 in af_request_applicantinfo.industry_type4%type,v_industry_type5 in af_request_applicantinfo.industry_type5%type);
  -- rule:42
  procedure RULE_42(app_id_input in varchar2, v_loan_overdue_month_num in af_request_applicantinfo.loan_overdue_month_num%type);
  -- rule:53
  procedure RULE_53(app_id_input in varchar2, v_query_org_1m_sum2 in af_request_applicantinfo.query_org_1m_sum2%type);
  -- rule:54
  procedure RULE_54(app_id_input in varchar2, v_query_org_1m_sum3 in af_request_applicantinfo.query_org_1m_sum3%type);
  -- rule:80
  procedure RULE_80(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type);
  -- rule:84
  procedure RULE_84(app_id_input in varchar2 , v_hmare in af_request_applicantinfo.c1_hmare%type, v_hmtel in af_request_applicantinfo.c1_hmtel%type);
  --rule:136
  procedure RULE_CRM_COADD_136(app_id_input in varchar2);
  -- rule:170
  procedure RULE_170(app_id_input in varchar2, v_idtype in af_request_applicantinfo.c1_idtype%type);
  -- rule:175
  procedure RULE_175(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_reship in af_request_applicantinfo.c1_reship%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type);
  -- rule:176
  procedure RULE_176(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in af_request_applicantinfo.c1_rename%type);
  -- rule:195
  procedure RULE_195(app_id_input in varchar2, v_cname in af_request_applicantinfo.c1_cname%type, v_c2_cname in af_request_applicantinfo.c2_cname%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:196
  procedure RULE_196(app_id_input in varchar2, v_ename in af_request_applicantinfo.c1_ename%type, v_c2_ename in  af_request_applicantinfo.c2_ename%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:197
  procedure RULE_197(app_id_input in varchar2, v_idnbr in af_request_applicantinfo.c1_idnbr%type, v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:199
  procedure RULE_199(app_id_input in varchar2,v_c2_birth in af_request_applicantinfo.c2_birth%type,v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type,v_birth in af_request_applicantinfo.c1_birth%type,v_idtype in  af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:200
  procedure RULE_200(app_id_input in varchar2, v_nation in af_request_applicantinfo.c1_nation%type,v_c2_nation in af_request_applicantinfo.c2_nation%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:201
  procedure RULE_201(app_id_input in varchar2, v_idtype in af_request_applicantinfo.c1_idtype%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:202
  procedure RULE_202(app_id_input in varchar2, v_c2_iddt1 in af_request_applicantinfo.c2_iddt1%type,v_c2_iddt2 in af_request_applicantinfo.c2_iddt2%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:203
  procedure RULE_203(app_id_input in varchar2, v_c5_idte1 in af_request_applicantinfo.c5_idte1%type,v_c5_idte2 in af_request_applicantinfo.c5_idte2%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:204
  procedure RULE_204(app_id_input in varchar2, v_marst in af_request_applicantinfo.c1_marst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:205
  procedure RULE_205(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:206
  procedure RULE_206(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type, v_c2_mobile in af_request_applicantinfo.c2_mobile%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:207
  procedure RULE_207(app_id_input in varchar2, v_cotel in af_request_applicantinfo.c1_cotel%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:208
  procedure RULE_208(app_id_input in varchar2,v_coadd in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:209
  procedure RULE_209(app_id_input in varchar2,v_hmadd in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:210
  procedure RULE_210(app_id_input in varchar2, v_email in af_request_applicantinfo.c1_email%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:211
  procedure RULE_211(app_id_input in varchar2, v_copost in af_request_applicantinfo.c1_copost%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:212
  procedure RULE_212(app_id_input in varchar2, v_rename in af_request_applicantinfo.c1_rename%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:213
  procedure RULE_213(app_id_input in varchar2,v_retelar in af_request_applicantinfo.c1_retelar%type,v_retel in af_request_applicantinfo.c1_retel%type, v_remobil in af_request_applicantinfo.c1_remobil%type);
  -- rule:214
  procedure RULE_214(app_id_input in varchar2, v_xname1 in af_request_applicantinfo.c1_xname1%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:215
  procedure RULE_215(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type, v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:216
  procedure RULE_216(app_id_input in varchar2, v_hmst in af_request_applicantinfo.c1_hmst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:217
  procedure RULE_217(app_id_input in varchar2, v_carst in af_request_applicantinfo.c1_carst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:218
  procedure RULE_218(app_id_input in varchar2, v_coname in af_request_applicantinfo.c1_coname%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:219
  procedure RULE_219(app_id_input in varchar2, v_cokind in af_request_applicantinfo.c1_cokind%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:220
  procedure RULE_220(app_id_input in varchar2, v_coyr in af_request_applicantinfo.c1_coyr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:221
  procedure RULE_221(app_id_input in varchar2, v_earn in af_request_applicantinfo.c1_earn%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:222
  procedure RULE_222(app_id_input in varchar2, v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:223
  procedure RULE_223(app_id_input in varchar2, v_cardnbr in af_request_applicantinfo.c1_cardnbr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:228
  procedure RULE_228(app_id_input in varchar2, v_is_online in varchar2,v_c4_abtype in af_request_applicantinfo.c4_abtype%type);
  -- rule:233
  procedure RULE_233(app_id_input in varchar2, v_credpct in af_request_applicantinfo.c1_credpct%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);
  -- rule:237
  procedure RULE_237(app_id_input in varchar2, v_aml_flag in af_request_applicantinfo.aml_flag%type);
  -- rule:239
  procedure RULE_239(app_id_input in varchar2, v_is_special_cust in af_request_applicantinfo.is_special_cust%type);
  -- rule:226
  procedure RULE_226(app_id_input in varchar2, v_c2_relship in af_request_applicantinfo.c2_relship%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type);

end AF_HXBCB_RULE_PKG;

/

create or replace package body AF_HXBCB_RULE_PKG as

  -------------------------------------------------------------------------------------------------
  -- author: song
  -- 2017-12-15 19:50:00
  -- 非模糊匹配规则
  -------------------------------------------------------------------------------------------------

  -- rule:1
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_1(app_id_input in varchar2,v_mate_name in af_request_applicantinfo.mate_name%type,v_reship in af_request_applicantinfo.c1_reship%type,v_rename in af_request_applicantinfo.c1_rename%type) is
    v_error varchar(500);
    begin
      if v_reship = 'D'  then
        if nvl(v_mate_name,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_1' and result_type = 'EMPTY';
        elsif v_rename = v_mate_name then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_1' and result_type = 'UNHIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_1' and result_type = 'HIT';
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
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_2' and result_type = 'EMPTY';
        elsif v_mobile != v_cell_phone then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_2' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_2' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_2: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_2;

  -- rule:6
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_CONAME_6(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coname_cid varchar2(30);
    v_gjj_pay_comp_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_coname_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coname';

      select MAX(t.cid)
      into v_gjj_pay_comp_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'pboc_gjj_pay_comp';

      if nvl(v_coname_cid,'null') != 'null' then
        if nvl(v_gjj_pay_comp_cid,'null') = 'null' then
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_6' and result_type = 'EMPTY';
          commit;
        elsif v_coname_cid = v_gjj_pay_comp_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_6' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_6' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_CONAME_6: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_CONAME_6;

  -- rule:7
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_HMADD_7(app_id_input in varchar2) is
    v_error varchar2(500);
    v_hmadd_cid varchar2(30);
    v_resident_addr1_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_hmadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_hmadd';

      if nvl(v_hmadd_cid,'null') != 'null' then

        select MAX(t.cid)
        into v_resident_addr1_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr1';

        if nvl(v_resident_addr1_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_7' and result_type = 'EMPTY';
          commit;
        elsif v_hmadd_cid = v_resident_addr1_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_7' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_7' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_HMADD_7: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_HMADD_7;

  -- rule:8
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_HMADD_8(app_id_input in varchar2) is
    v_error varchar2(500);
    v_hmadd_cid varchar2(30);
    v_resident_addr1_cid varchar2(30);
    v_resident_addr2_cid varchar2(30);
    v_resident_addr3_cid varchar2(30);
    v_resident_addr4_cid varchar2(30);
    v_resident_addr5_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_hmadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_hmadd';

      if nvl(v_hmadd_cid,'null') != 'null' then

        select MAX(t.cid)
        into v_resident_addr1_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr1';

        select MAX(t.cid)
        into v_resident_addr2_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr2';

        select MAX(t.cid)
        into v_resident_addr3_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr3';

        select MAX(t.cid)
        into v_resident_addr4_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr4';

        select MAX(t.cid)
        into v_resident_addr5_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr5';

        if nvl(v_resident_addr1_cid,'null') = 'null' and nvl(v_resident_addr2_cid,'null') = 'null' and nvl(v_resident_addr3_cid,'null') = 'null' and nvl(v_resident_addr4_cid,'null') = 'null' and nvl(v_resident_addr5_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_8' and result_type = 'EMPTY';
          commit;
        elsif v_hmadd_cid = v_resident_addr1_cid or v_hmadd_cid = v_resident_addr2_cid or v_hmadd_cid = v_resident_addr3_cid or v_hmadd_cid = v_resident_addr4_cid or v_hmadd_cid = v_resident_addr5_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_8' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_HMADD_8' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_HMADD_8: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_HMADD_8;

  -- rule:13
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_COADD_13(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coadd_cid varchar2(30);
    v_comp_addr1_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_coadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coadd';

      if nvl(v_coadd_cid,'null') != 'null' then

        select MAX(t.cid)
        into v_comp_addr1_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr1';
        if nvl(v_comp_addr1_cid , 'null') = 'null' then
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_13' and result_type = 'EMPTY';
        elsif v_coadd_cid != v_comp_addr1_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_13' and result_type = 'HIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_13' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_COADD_13: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_COADD_13;

  -- rule:14
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_COADD_14(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coadd_cid varchar2(30);
    v_comp_addr1_cid varchar2(30);
    v_comp_addr2_cid varchar2(30);
    v_comp_addr3_cid varchar2(30);
    v_comp_addr4_cid varchar2(30);
    v_comp_addr5_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_coadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coadd';

      if nvl(v_coadd_cid,'null') != 'null' then

        select MAX(t.cid)
        into v_comp_addr1_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr1';

        select MAX(t.cid)
        into v_comp_addr2_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr2';

        select MAX(t.cid)
        into v_comp_addr3_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr3';

        select MAX(t.cid)
        into v_comp_addr4_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr4';

        select MAX(t.cid)
        into v_comp_addr5_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_comp_addr5';
        if nvl(v_comp_addr1_cid,'null') = 'null' and nvl(v_comp_addr2_cid,'null') = 'null' and nvl(v_comp_addr3_cid,'null') = 'null' and nvl(v_comp_addr4_cid,'null') = 'null' and nvl(v_comp_addr5_cid,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_14' and result_type = 'EMPTY';
          commit;
        elsif v_coadd_cid = v_comp_addr1_cid or v_coadd_cid = v_comp_addr2_cid or v_coadd_cid = v_comp_addr3_cid or v_coadd_cid = v_comp_addr4_cid or v_coadd_cid = v_comp_addr5_cid then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_14' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_14' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_COADD_14: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_COADD_14;

  -- rule:15
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_PBOC_COADD_15(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coadd_cid varchar2(30);
    v_resident_addr1_cid varchar2(30);
    v_resident_addr2_cid varchar2(30);
    v_resident_addr3_cid varchar2(30);
    v_resident_addr4_cid varchar2(30);
    v_resident_addr5_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_coadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coadd';

      if nvl(v_coadd_cid,'null') != 'null' then

        select MAX(t.cid)
        into v_resident_addr1_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr1';

        select MAX(t.cid)
        into v_resident_addr2_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr2';

        select MAX(t.cid)
        into v_resident_addr3_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr3';

        select MAX(t.cid)
        into v_resident_addr4_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr4';

        select MAX(t.cid)
        into v_resident_addr5_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_resident_addr5';
        if nvl(v_resident_addr1_cid,'null') = 'null' and nvl(v_resident_addr2_cid,'null') = 'null' and nvl(v_resident_addr3_cid,'null') = 'null' and nvl(v_resident_addr4_cid,'null') = 'null' and nvl(v_resident_addr5_cid,'null') = 'null' then
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_14' and result_type = 'EMPTY';
        elsif v_coadd_cid = v_resident_addr1_cid or v_coadd_cid = v_resident_addr2_cid or v_coadd_cid = v_resident_addr3_cid or v_coadd_cid = v_resident_addr4_cid or v_coadd_cid = v_resident_addr5_cid then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_15' and result_type = 'HIT';
          commit;
        else
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_PBOC_COADD_15' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_COADD_15: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_COADD_15;

  -- rule:20
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_20(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_cotel,'null') != 'null'  then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_20' and result_type = 'EMPTY';
        elsif v_cotel = v_resi_tel then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_20' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_20' and result_type = 'UNHIT';
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
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_21' and result_type = 'EMPTY';
        elsif v_cotel != v_comp_phone then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_21' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_21' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_21: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_21;

  -- rule:23
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_23(app_id_input in varchar2,v_hmtel af_request_applicantinfo.c1_hmtel%type,v_hmare af_request_applicantinfo.c1_hmare%type, v_resi_tel in af_request_applicantinfo.resi_tel%type) is
    v_error varchar(500);
    begin
      if nvl(v_hmtel,'null') != 'null' and nvl(v_hmare,'null') != 'null' then
        if nvl(v_resi_tel,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_23' and result_type = 'EMPTY';
        elsif  v_hmare || v_hmtel  != v_resi_tel then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_23' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_23' and result_type = 'UNHIT';
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
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_24' and result_type = 'EMPTY';
        elsif  v_hmare || v_hmtel = v_comp_phone then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_24' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_24' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_24: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_24;

  -- rule:26
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_26(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_remobil,'null') = 'null' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_26' and result_type = 'EMPTY';
      else
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_26' and result_type = 'EMPTY';
        elsif v_remobil != v_cell_phone then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_26' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_26' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_26: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_26;

  -- rule:32
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_32(app_id_input in varchar2,v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type,v_cell_phone in af_request_applicantinfo.cell_phone%type) is
    v_error varchar(500);
    begin
      if nvl(v_xmobil1,'null') != 'null'  then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_32' and result_type = 'EMPTY';
        if nvl(v_cell_phone,'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_32' and result_type = 'EMPTY';
        elsif v_xmobil1 = v_cell_phone then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_32' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_32' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_32: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_32;

  -- rule:38
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_38(app_id_input in varchar2,v_pboc_gjj_pay_status in af_request_applicantinfo.pboc_gjj_pay_status%type,v_pay_ym in af_request_applicantinfo.pay_ym%type, v_first_deposit_ym in af_request_applicantinfo.first_deposit_ym%type) is
    v_error varchar(500);
    begin
      if v_pboc_gjj_pay_status = '001|缴交' then
        if nvl(v_first_deposit_ym,'null') = 'null' or nvl(v_pay_ym,'null') = 'null'  then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_38' and result_type = 'EMPTY';
        elsif months_between(to_date(v_pay_ym,'yyyy.mm'),to_date(v_first_deposit_ym,'yyyy.mm')) < 6 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_38' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_38' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_38: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_38;

  -- rule:39
  -- @author song
  -- @date 2017-12-6 18:15:00
  procedure RULE_39(app_id_input in varchar2,v_industry_type1 in af_request_applicantinfo.industry_type1%type,v_industry_type2 in af_request_applicantinfo.industry_type2%type,v_industry_type3 in af_request_applicantinfo.industry_type3%type,
                    v_industry_type4 in af_request_applicantinfo.industry_type4%type,v_industry_type5 in af_request_applicantinfo.industry_type5%type) is
    flag number;
    v_error varchar2(500);
    begin
      if nvl(v_industry_type1,'null') = 'null' and nvl(v_industry_type2,'null') = 'null' and nvl(v_industry_type3,'null') = 'null' and nvl(v_industry_type4,'null') = 'null' and nvl(v_industry_type5,'null') = 'null' then
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_39' and result_type = 'EMPTY';
      else  select count(n) into flag from
        (select t.industry_type1 as n from af_request_applicantinfo t
         union
         select t.industry_type2 as n from af_request_applicantinfo t
         union
         select t.industry_type3 as n from af_request_applicantinfo t
         union
         select t.industry_type4 as n from af_request_applicantinfo t
         union
         select t.industry_type5 as n from af_request_applicantinfo t
        );
        if flag >= 3 then
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum,type,class  from af_risk_level_settings  where ruleno = 'RULE_39' and result_type = 'HIT';
        else
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum,type,class  from af_risk_level_settings  where ruleno = 'RULE_39' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_39: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_39;

  -- rule:42
  -- @author song
  -- @date 2017-12-22 10:300:00
  procedure RULE_42(app_id_input in varchar2, v_loan_overdue_month_num in af_request_applicantinfo.loan_overdue_month_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_loan_overdue_month_num,'null') = 'null' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_42' and result_type = 'EMPTY';
        commit;
      elsif v_loan_overdue_month_num >= 2 then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_42' and result_type = 'HIT';
        commit;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_42' and result_type = 'UNHIT';
        commit;
      end if;
      exception when others then v_error := 'RULE_42: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_42;

  -- rule:53
  -- @author song
  -- @date 2017-12-15 14:50:00
  procedure RULE_53(app_id_input in varchar2, v_query_org_1m_sum2 in af_request_applicantinfo.query_org_1m_sum2%type) is
    v_error varchar2(500);
    begin
      if nvl(to_char(v_query_org_1m_sum2), 'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_53' and result_type = 'EMPTY';
        commit;
      else
        if v_query_org_1m_sum2 >= 3 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_53' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_53' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_53: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_53;

  -- rule:54
  -- @author song
  -- @date 2017-12-15 14:50:00
  procedure RULE_54(app_id_input in varchar2, v_query_org_1m_sum3 in af_request_applicantinfo.query_org_1m_sum3%type) is
    v_error varchar2(500);
    begin
      if nvl(to_char(v_query_org_1m_sum3), 'null') = 'null' then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_54' and result_type = 'EMPTY';
        commit;
      else
        if v_query_org_1m_sum3 >= 3 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_54' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_54' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_54: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_54;


  -- rule:80
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_80(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type) is
    flag1 number;
    flag2 number;
    v_error varchar2(500);
    begin
      if nvl(v_mobile, 'null') != 'null' then
        select count(t.app_id), count(distinct(t.c1_idnbr))
        into flag1, flag2
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and v_mobile = t.c1_mobile;
        if flag1 > 1 then
          if flag2 >= 3 then
            -- update result data
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag2 as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_80' and result_type = 'HIT';
          else
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag2 as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_80' and result_type = 'UNHIT';
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

  -- rule:84
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_84(app_id_input in varchar2 , v_hmare in af_request_applicantinfo.c1_hmare%type, v_hmtel in af_request_applicantinfo.c1_hmtel%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    v_hmadd_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_hmadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and data_type = 'app_c1_hmadd';
      if nvl(v_hmadd_cid,'null') != 'null' and nvl(v_hmare,'null') != 'null' and nvl(v_hmtel,'null') != 'null' then

        select count(t.app_id) ,count(distinct(h.cid))
        into flag1 ,flag
        from af_app_add_his h,v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and h.app_id = t.app_id
              and h.data_type = 'app_c1_hmadd'
              and t.c1_hmare = v_hmare
              and t.c1_hmtel = v_hmtel;

        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings  where ruleno = 'RULE_84' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_84' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_84: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_84;

  -- rule:136
  -- @author song
  -- @date 2017-12-20 11:20:00
  procedure RULE_CRM_COADD_136(app_id_input in varchar2) is
    v_error varchar2(500);
    app_coadd_cid varchar2(30);
    crm_busaddr_cid varchar2(30);
    begin
      select MAX(t.cid)
      into app_coadd_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coadd';
      if nvl(app_coadd_cid,'null') != 'null' then
        select MAX(t.cid)
        into crm_busaddr_cid
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'crm_busaddr';
        if nvl(crm_busaddr_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_136' and result_type = 'EMPTY';
          commit;
        elsif app_coadd_cid = crm_busaddr_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_136' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_136' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_CRM_COADD_136: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_CRM_COADD_136;

  -- rule:170
  -- @author song
  -- @date 2017-12-15 10:30:00
  procedure RULE_170(app_id_input in varchar2, v_idtype in af_request_applicantinfo.c1_idtype%type) is
    v_error varchar2(500);
    begin
      if nvl(v_idtype, 'null') = 'null' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_170' and result_type = 'EMPTY';
        commit;
      else
        if v_idtype = '01' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_170' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_170' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_170: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_170;

  -- rule:175
  -- @author song
  -- @date 2017-12-2 10:30:00
  procedure RULE_175(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type,v_reship in af_request_applicantinfo.c1_reship%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    flag number;
    v_error varchar2(500);
    begin
      if nvl(v_remobil, 'null') = 'null' or nvl(v_reship, 'null') = 'null' then
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_175' and result_type = 'EMPTY';
      else
        select count(t.app_id) into flag
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and v_reship != t.c1_reship
              and v_remobil = t.c1_remobil
              and v_idnbr = t.c1_idnbr;
        if flag >= 2 then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_175' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_175' and result_type = 'UNHIT';
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
    v_error varchar2(500);
    begin
      if nvl(v_remobil, 'null') = 'null' or nvl(v_rename, 'null') = 'null' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_176' and result_type = 'EMPTY';
      else
        select count(t.app_id) into flag
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and t.c1_xname1 != v_rename
              and t.c1_xmobil1 = v_remobil;
        if flag >= 2 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_176' and result_type = 'HIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,calculatenum,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,flag as calculatenum ,type,class  from af_risk_level_settings  where ruleno = 'RULE_176' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_176: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_176;

  -- rule:195
  -- @author song
  -- @date 2017-12-19 16:25:00
  procedure RULE_195(app_id_input in varchar2,v_cname in af_request_applicantinfo.c1_cname%type,v_c2_cname in af_request_applicantinfo.c2_cname%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if (nvl(v_cname, 'null') != 'null' and length(regexp_replace(v_cname,'[?$#@&*!~_+-,A-Za-z]')) = length(v_cname)) and (nvl(v_c2_cname, 'null') != 'null' and length(regexp_replace(v_c2_cname,'[?$#@&*!~_+-,A-Za-z]')) = length(v_c2_cname)) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '2' then
        if nvl(v_c2_cname, 'null') != 'null' and length(regexp_replace(v_c2_cname,'[?$#@&*!~_+-,A-Za-z]')) = length(v_c2_cname) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_cname, 'null') != 'null' and length(regexp_replace(v_cname,'[?$#@&*!~_+-,A-Za-z]')) = length(v_cname) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_195' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_195: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_195;

  -- rule:196
  -- @author song
  -- @date 2017-12-19 16:25:00
  procedure RULE_196(app_id_input in varchar2,v_ename in af_request_applicantinfo.c1_ename%type,v_c2_ename in  af_request_applicantinfo.c2_ename%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if (nvl(v_ename, 'null') != 'null' and length(regexp_replace(v_ename,'[?$#@&*!~_+-]')) = length(v_ename)) and (nvl(v_c2_ename, 'null') != 'null' and length(regexp_replace(v_c2_ename,'[?$#@&*!~_+-]')) = length(v_c2_ename)) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '2' then
        if nvl(v_c2_ename, 'null') != 'null' and length(regexp_replace(v_c2_ename,'[?$#@&*!~_+-]')) = length(v_c2_ename) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_ename, 'null') != 'null' and length(regexp_replace(v_ename,'[?$#@&*!~_+-]')) = length(v_ename) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_196' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_196: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_196;

  -- rule:197
  -- @author song
  -- @date 2017-12-19 16:25:00
  procedure RULE_197(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if (nvl(v_idnbr, 'null') != 'null' and length(regexp_replace(v_idnbr,'[?$#@&*!~_+-]')) = length(v_idnbr)) and (nvl(v_c2_idnbr, 'null') != 'null' and length(regexp_replace(v_c2_idnbr,'[?$#@&*!~_+-]')) = length(v_c2_idnbr)) then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '2' then
        if nvl(v_c2_idnbr, 'null') != 'null' and length(regexp_replace(v_c2_idnbr,'[?$#@&*!~_+-]')) = length(v_c2_idnbr) then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_idnbr, 'null') != 'null' and length(regexp_replace(v_idnbr,'[?$#@&*!~_+-]')) = length(v_idnbr) then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_197' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_197: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_197;

  -- rule:199
  -- @author song
  -- @date 2017-12-14 18:50:00
  procedure RULE_199(app_id_input in varchar2,v_c2_birth in af_request_applicantinfo.c2_birth%type,v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type,v_birth in af_request_applicantinfo.c1_birth%type,v_idtype in  af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_birth,'null') != 'null' and v_idtype = '01' and nvl(v_c2_birth,'null') != 'null' and v_c2_idtype = '01' then
          if substr(v_idnbr,7,8) = v_birth and substr(v_c2_birth,7,8) = v_c2_birth then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'UNHIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'HIT';
            commit;
          end if;
        end if;
      elsif v_c1c2_flag = '2' then
        if nvl(v_c2_birth,'null') != 'null' and v_c2_idtype = '01' then
          if substr(v_c2_idnbr,7,8) = v_c2_birth then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_birth,'null') != 'null' and v_idtype = '01' then
          if substr(v_idnbr,7,8) = v_birth then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_199' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_199: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_199;


  -- rule:200
  -- @author song
  -- @date 2017-12-10 14:25:00
  procedure RULE_200(app_id_input in varchar2, v_nation in af_request_applicantinfo.c1_nation%type,v_c2_nation in af_request_applicantinfo.c2_nation%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_nation, 'null') != 'null' and nvl(v_c2_nation, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'UNHIT';
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'HIT';
          commit;
        end if;
      elsif  v_c1c2_flag = '2' then
        if nvl(v_c2_nation, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_nation, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_200' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_200: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_200;

  -- rule:201
  -- @author song
  -- @date 2017-12-10 14:25:00
  procedure RULE_201(app_id_input in varchar2, v_idtype in af_request_applicantinfo.c1_idtype%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_idtype, 'null') != 'null' and nvl(v_c2_idtype, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'HIT';
          commit;
        end if;
      elsif  v_c1c2_flag = '2' then
        if nvl(v_c2_idtype, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_idtype, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_201' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_201: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_201;


  -- rule:202
  -- @author song
  -- @date 2017-12-14 10:00:00
  procedure RULE_202(app_id_input in varchar2, v_c2_iddt1 in af_request_applicantinfo.c2_iddt1%type,v_c2_iddt2 in af_request_applicantinfo.c2_iddt2%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_c2_iddt1, 'null') != 'null' and nvl(v_c2_iddt2, 'null') = 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'HIT';
          commit;
        end if;
      elsif  v_c1c2_flag = '2' then
        if nvl(v_c2_iddt2, 'null') = 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_c2_iddt1, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_202' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_202: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_202;


  -- rule:203
  -- @author song
  -- @date 2017-12-14 10:00:00
  procedure RULE_203(app_id_input in varchar2, v_c5_idte1 in af_request_applicantinfo.c5_idte1%type,v_c5_idte2 in af_request_applicantinfo.c5_idte2%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_c5_idte1, 'null') != 'null' and nvl(v_c5_idte2, 'null') = 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'HIT';
          commit;
        end if;
      elsif  v_c1c2_flag = '2' then
        if nvl(v_c5_idte2, 'null') = 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_c5_idte1, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_203' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_203: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_203;

  -- rule:204
  -- @author song
  -- @date 2017-12-14 10:10:00
  procedure RULE_204(app_id_input in varchar2, v_marst in af_request_applicantinfo.c1_marst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_marst, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_204' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_204' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_204: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_204;

  -- rule:205
  -- @author song
  -- @date 2017-12-14 10:10:00
  procedure RULE_205(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_educls, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_205' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_205' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_205: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_205;

  -- rule:206
  -- @author song
  -- @date 2017-12-19 17:30:00
  procedure RULE_206(app_id_input in varchar2, v_mobile in af_request_applicantinfo.c1_mobile%type,v_c2_mobile in af_request_applicantinfo.c2_mobile%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_mobile, 'null') != 'null' and length(regexp_replace(v_mobile,'[?$#@&*!~_+-]')) >= 11 and nvl(v_c2_mobile, 'null') != 'null' and length(regexp_replace(v_c2_mobile,'[?$#@&*!~_+-,A-Za-z]')) >= 11 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'HIT';
          commit;
        end if;
      elsif  v_c1c2_flag = '2' then
        if nvl(v_c2_mobile, 'null') != 'null' and length(regexp_replace(v_c2_mobile,'[?$#@&*!~_+-]')) >= 11 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '3' then
        if nvl(v_mobile, 'null') != 'null' and length(regexp_replace(v_mobile,'[?$#@&*!~_+-]')) >= 11 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_206' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_206: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_206;

  -- rule:207
  -- @author song
  -- @date 2017-12-19 17:30:00
  procedure RULE_207(app_id_input in varchar2,v_cotel in af_request_applicantinfo.c1_cotel%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_cotel, 'null') != 'null' and length(regexp_replace(v_cotel,'[?$#@&*!~_+-]')) >= 7 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_207' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_207' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_207: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_207;

  -- rule:208
  -- @author song
  -- @date 2017-12-10 10:30:00
  procedure RULE_208(app_id_input in varchar2, v_coadd in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_coadd, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_208' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_208' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_208: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_208;

  -- rule:209
  -- @author song
  -- @date 2017-12-14 11:00:00
  procedure RULE_209(app_id_input in varchar2, v_hmadd in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_hmadd, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_209' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_209' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_209: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_209;

  -- rule:210
  -- @author song
  -- @date 2017-12-14 11:10:00
  procedure RULE_210(app_id_input in varchar2, v_email in af_request_applicantinfo.c1_email%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_email, 'null') != 'null' and instr(v_email,'@') != 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_210' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_210' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_210: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_210;

  -- rule:211
  -- @author song
  -- @date 2017-12-14 11:10:00
  procedure RULE_211(app_id_input in varchar2, v_copost in af_request_applicantinfo.c1_copost%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_copost, 'null') != 'null' and length(regexp_replace(v_copost,'[?$#@&*!~_+-]')) = 6 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_211' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_211' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_211: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_211;

  -- rule:212
  -- @author song
  -- @date 2017-12-10 11:00:00
  procedure RULE_212(app_id_input in varchar2, v_rename in af_request_applicantinfo.c1_rename%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_rename, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_212' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_212' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_212: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_212;

  -- rule:213
  -- @author song
  -- @date 2017-12-15 10:00:00
  procedure RULE_213(app_id_input in varchar2,v_retelar in af_request_applicantinfo.c1_retelar%type,v_retel in af_request_applicantinfo.c1_retel%type, v_remobil in af_request_applicantinfo.c1_remobil%type) is
    v_error varchar2(500);
    begin
      if ((nvl(v_retelar,'null') != 'null' and nvl(v_retel,'null') != 'null' and length(v_retelar||v_retel) >= '7')) or ((nvl(v_remobil,'null') != 'null' and length(v_remobil) >= '11' )) then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_213' and result_type = 'UNHIT';
        commit;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_213' and result_type = 'HIT';
        commit;
      end if;
      exception when others then v_error := 'RULE_213: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_213;

  -- rule:214
  -- @author song
  -- @date 2017-12-14 11:20:00
  procedure RULE_214(app_id_input in varchar2, v_xname1 in af_request_applicantinfo.c1_xname1%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_xname1, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_214' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_214' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_214: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_214;

  -- rule:215
  -- @author song
  -- @date 2017-12-15 10:10:00
  procedure RULE_215(app_id_input in varchar2,v_xtel1 in af_request_applicantinfo.c1_xtel1%type,v_xtelar1 in af_request_applicantinfo.c1_xtelar1%type, v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if (nvl(v_xtel1,'null') != 'null' and nvl(v_xtelar1,'null') != 'null' and length(v_xtelar1||v_xtel1) >= '7') or (nvl(v_xmobil1,'null') != 'null' and length(v_xmobil1) >= '11' ) then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_215' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_215' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_215: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_215;

  -- rule:216
  -- @author song
  -- @date 2017-12-14 14:30:00
  procedure RULE_216(app_id_input in varchar2, v_hmst in af_request_applicantinfo.c1_hmst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_hmst, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_216' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_216' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_216: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_216;

  -- rule:217
  -- @author song
  -- @date 2017-12-14 14:30:00
  procedure RULE_217(app_id_input in varchar2, v_carst in af_request_applicantinfo.c1_carst%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_carst, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_217' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_217' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_217: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_217;

  -- rule:218
  -- @author song
  -- @date 2017-12-14 14:30:00
  procedure RULE_218(app_id_input in varchar2, v_coname in af_request_applicantinfo.c1_coname%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_coname, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_218' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_218' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_218: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_218;

  -- rule:219
  -- @author song
  -- @date 2017-12-14 14:40:00
  procedure RULE_219(app_id_input in varchar2, v_cokind in af_request_applicantinfo.c1_cokind%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_cokind, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_219' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_219' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_219: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_219;

  -- rule:220
  -- @author song
  -- @date 2017-12-14 15:10:00
  procedure RULE_220(app_id_input in varchar2, v_coyr in af_request_applicantinfo.c1_coyr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(to_char(v_coyr), 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_220' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_220' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_220: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_220;

  -- rule:221
  -- @author song
  -- @date 2017-12-14 15:20:00
  procedure RULE_221(app_id_input in varchar2, v_earn in af_request_applicantinfo.c1_earn%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(to_char(v_earn), 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_221' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_221' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_221: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_221;

  -- rule:222
  -- @author song
  -- @date 2017-12-14 15:40:00
  procedure RULE_222(app_id_input in varchar2, v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag != '2' then
        if nvl(v_cycadd1, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_222' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_222' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_222: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_222;

  -- rule:228
  -- @author song
  -- @date 2017-12-21 16:40:00
  procedure RULE_228(app_id_input in varchar2, v_is_online in varchar2,v_c4_abtype in af_request_applicantinfo.c4_abtype%type) is
    v_error varchar2(500);
    begin
      if v_is_online != 'B' then
        if v_c4_abtype = '1' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_228' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_228' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_228: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_228;

  -- rule:223
  -- @author song
  -- @date 2017-12-14 15:40:00
  procedure RULE_223(app_id_input in varchar2, v_cardnbr in af_request_applicantinfo.c1_cardnbr%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '2' then
        if nvl(v_cardnbr, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_223' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_223' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_223: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_223;

  -- rule:226
  -- @author song
  -- @date 2017-12-14 15:40:00
  procedure RULE_226(app_id_input in varchar2, v_c2_relship in af_request_applicantinfo.c2_relship%type,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '2' then
        if nvl(v_c2_relship, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_226' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_226' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_226: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_226;

  -- rule:233
  -- @author song
  -- @date 2017-12-14 15:50:00
  procedure RULE_233(app_id_input in varchar2, v_credpct in af_request_applicantinfo.c1_credpct%type, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_c1c2_flag = '1' then
        if nvl(v_credpct, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_233' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_233' and result_type = 'HIT';
          commit;
        end if;
      elsif v_c1c2_flag = '2' then
        if nvl(v_credpct, 'null') != 'null' then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_233' and result_type = 'UNHIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_233' and result_type = 'HIT';
          commit;
        end if;
      end if;
      exception when others then v_error := 'RULE_233: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_233;

  -- rule:237
  -- @author song
  -- @date 2017-12-14 16:10:00
  procedure RULE_237(app_id_input in varchar2, v_aml_flag in af_request_applicantinfo.aml_flag%type) is
    v_error varchar2(500);
    begin
      if v_aml_flag = '1' then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_237' and result_type = 'HIT';
        commit;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_237' and result_type = 'UNHIT';
        commit;
      end if;
      exception when others then v_error := 'RULE_237: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_237;

  -- rule:239
  -- @author song
  -- @date 2017-12-14 16:10:00
  procedure RULE_239(app_id_input in varchar2, v_is_special_cust in af_request_applicantinfo.is_special_cust%type) is
    v_error varchar2(500);
    begin
      if v_is_special_cust = 'S03' then
        -- update result data
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_239' and result_type = 'HIT';
        commit;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_239' and result_type = 'UNHIT';
        commit;
      end if;
      exception when others then v_error := 'RULE_239: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_239;



  -------------------------------------------------------------------------------------------------
  -- author: chen
  -- 2017-12-15 19:40:00
  -- 非模糊匹配规则
  -------------------------------------------------------------------------------------------------

  -- rule:3
  -- @author chen
  -- @date 2017-12-11 11:52:00
  procedure RULE_PBOC_CONAME_3(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coname_cid varchar2(10);
    v_company1_cid varchar2(10);
    begin
      select MAX(t.cid)
      into v_coname_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coname';
      if nvl(v_coname_cid,'null') != 'null' then
        select MAX(t.cid)
        into v_company1_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_company1';
        if nvl(v_company1_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_3' and result_type = 'EMPTY';
          commit;
        elsif v_coname_cid = v_company1_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_3' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_3' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_CONAME_3: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_CONAME_3;

  -- rule:4
  -- @author chen
  -- @date 2017-12-14 11:52:00
  procedure RULE_PBOC_CONAME_4(app_id_input in varchar2) is
    v_error varchar2(500);
    v_coname_cid varchar2(30);
    v_company1_cid varchar2(30);
    v_company2_cid varchar2(30);
    v_company3_cid varchar2(30);
    v_company4_cid varchar2(30);
    v_company5_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_coname_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coname';
      if nvl(v_coname_cid,'null') != 'null' then
        select MAX(t.cid)
        into v_company1_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type in ('pboc_company1');

        select MAX(t.cid)
        into v_company2_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_company2';

        select MAX(t.cid)
        into v_company3_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_company3';

        select MAX(t.cid)
        into v_company4_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_company4';

        select MAX(t.cid)
        into v_company5_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'pboc_company5';

        if nvl(v_company1_cid,'null') = 'null' and nvl(v_company2_cid,'null') = 'null' and nvl(v_company3_cid,'null') = 'null' and nvl(  v_company4_cid,'null') = 'null' and nvl(v_company5_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_4' and result_type = 'EMPTY';
          commit;
        elsif v_coname_cid = v_company1_cid or v_coname_cid = v_company2_cid or v_coname_cid = v_company3_cid or v_coname_cid =   v_company4_cid or v_coname_cid = v_company5_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_4' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_PBOC_CONAME_4' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_PBOC_CONAME_4: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_PBOC_CONAME_4;

  -- rule:40
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_40(app_id_input in varchar2,v_bad_debt_num in af_request_applicantinfo.bad_debt_num%type) is
    v_error varchar2(500);
    begin
      if nvl(v_bad_debt_num,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_40' and result_type = 'EMPTY';
        commit;
      elsif v_bad_debt_num >= 2 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_40' and result_type = 'HIT';
        commit;
      else
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_40' and result_type = 'UNHIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_40: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_40;

  -- rule:44
  -- @author chen
  -- @date 2017-12-14 20:52:00
  procedure RULE_44(app_id_input in varchar2,v_debit_card_over_due_acct_num af_request_applicantinfo.debit_card_over_due_acct_num%type)   is
    v_error varchar2(500);
    begin
      if nvl(v_debit_card_over_due_acct_num,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_44' and result_type = 'EMPTY';
        commit;
      elsif v_debit_card_over_due_acct_num >= 2 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_44' and result_type = 'HIT';
        commit;
      else
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_44' and result_type = 'UNHIT';
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
  -- @date 2017-12-14 20:52:00
  procedure RULE_45(app_id_input in varchar2,v_debit_card_over_due_month in af_request_applicantinfo.debit_card_over_due_month_num%type)   is
    v_error varchar2(500);
    begin
      if nvl(v_debit_card_over_due_month,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_45' and result_type = 'EMPTY';
        commit;
      elsif v_debit_card_over_due_month >= 2 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_45' and result_type = 'HIT';
        commit;
      else
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_45' and result_type = 'UNHIT';
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
  -- @date 2017-12-14 20:52:00
  procedure RULE_46(app_id_input in varchar2, v_debit_co_due_longest_over af_request_applicantinfo.debit_co_due_longest_over_due%type) is
    v_error varchar2(500);
    begin
      if nvl(v_debit_co_due_longest_over,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_46' and result_type = 'EMPTY';
        commit;
      elsif v_debit_co_due_longest_over >= 2 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_46' and result_type = 'HIT';
        commit;
      else
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings    where ruleno = 'RULE_46' and result_type = 'UNHIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_46: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_46;

  -- rule:67
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_67(app_id_input in varchar2,v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type) is
    v_error varchar2(500);
    begin
      if nvl(v_cycadd1,'null') != 'null' then
        if v_cycadd1 != 'B' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_67' and result_type = 'HIT';
          commit;
        else
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_67' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_67: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_67;

  -- rule:70
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_70(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_mobile in   af_request_applicantinfo.c1_mobile%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    begin
      if nvl(v_mobile,'null') != 'null' then
        select count(t.app_id),count(distinct(t.c1_mobile))
        into flag1,flag
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and t.c1_idnbr = v_idnbr;
        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_70' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_70' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
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
  procedure RULE_71(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type,v_cotel in   af_request_applicantinfo.c1_cotel%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    begin
      if nvl(v_cotel,'null') != 'null' then
        select count(t.app_id),count(distinct(t.c1_cotel))
        into flag1,flag
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and t.c1_idnbr = v_idnbr;
        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_71' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_71' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_71: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_71;

  -- rule:75
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_75(app_id_input in varchar2,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    v_c1_coname_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_c1_coname_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and data_type = 'app_c1_coname';
      if nvl(v_c1_coname_cid,'null') != 'null' then
        select count(h.app_id) ,count(distinct(t.cid))
        into flag1 ,flag
        from af_app_add_his t,v_appinfo_year_his h
        where h.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and h.c1_idnbr = v_idnbr
              and t.app_id = h.app_id
              and t.data_type = 'app_c1_coname';
        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from   af_risk_level_settings  where ruleno = 'RULE_75' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_75' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_75: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_75;

  -- rule:82
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_82(app_id_input in varchar2,v_cotel af_request_applicantinfo.c1_cotel%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    v_c1_coname_cid varchar2(30);
    begin
      select MAX(t.cid)
      into v_c1_coname_cid
      from af_app_add_today t
      where t.app_id = app_id_input
            and data_type = 'app_c1_coname';
      if nvl(v_c1_coname_cid,'null') != 'null' then
        select count(h.app_id) ,count(distinct(t.cid))
        into flag1 ,flag
        from af_app_add_his t,v_appinfo_year_his h
        where h.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and h.c1_cotel = v_cotel
              and t.app_id = h.app_id
              and t.data_type = 'app_c1_coname';
        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select   app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue ,type,class from   af_risk_level_settings  where ruleno = 'RULE_82' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_82' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_82: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_82;

  -- rule:98
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_98(app_id_input in varchar2,v_result_xm in af_request_applicantinfo.result_xm%type,v_result_gmsfhm in   af_request_applicantinfo.result_gmsfhm%type,v_idtype in af_request_applicantinfo.c1_idtype%type) is
    v_error varchar2(500);
    begin
      if v_idtype = '01' then
        if v_result_xm = '一致' and v_result_gmsfhm = '一致' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_98' and   result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where ruleno = 'RULE_98' and   result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_98: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_98;

  -- rule:116
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_116(app_id_input in varchar2,v_is_online  in varchar2,v_c5_abcode  af_request_applicantinfo.c5_abcode%type) is
    v_error varchar2(500);
    city_A varchar2(100);
    city_B varchar2(100);
    begin
      select MAX(city)
      into city_A
      from af_app_add_today t
      where t.app_id = app_id_input
            and data_type = 'app_c1_coadd';
      if nvl(city_A,'null') != 'null' then
        if v_is_online = 'B' then
          select MAX(t.city)
          into city_B
          from app_area_code_city t
          where t.area_code = substr(app_id_input, 9, 2);
        else
          select MAX(t.city)
          into city_B
          from c5_abcode_city t
          where t.abcode = v_c5_abcode;
        end if;
        if city_B = city_A then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_116' and   result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_116' and   result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_116: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_116;

  -- rule:117
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_117(app_id_input in varchar2,v_cotel af_request_applicantinfo.c1_cotel%type) is
    v_error varchar2(500);
    city_A varchar2(100);
    city_B varchar2(100);
    begin
      select MAX(city)
      into city_A
      from af_app_add_today t
      where t.app_id = app_id_input
            and data_type = 'app_c1_coadd';
      if nvl(city_A,'null') != 'null' then
        select MAX(t.city)
        into city_B
        from c1_cotel_areacode_city t
        where t.area_code = substr(v_cotel, 1, 3)
              or t.area_code = substr(v_cotel, 1, 4);
        if city_B = city_A then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_117' and   result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_117' and   result_type = 'HIT';
          commit;
        end if;

      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_117: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_117;

  -- rule:123
  -- @author chen
  -- @date 2017-12-18 10:02:00
  procedure RULE_123(app_id_input in varchar2,v_mobile af_request_applicantinfo.c1_mobile%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    begin
      if nvl(v_mobile,'null') != 'null' then
        select count(h.app_id) ,count(distinct(t.cid))
        into flag1 ,flag
        from af_app_add_his t,v_appinfo_year_his h
        where h.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and t.app_id = h.app_id
              and t.data_type = 'app_c1_coadd'
              and h.c1_mobile = v_mobile;
        if flag1 > 1 then
          if flag >= 2 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select   app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings    where ruleno = 'RULE_123' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as     app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_123' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_123: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_123;

  -- rule:135
  -- @author chen
  -- @date 2017-12-20 9:52:00
  procedure RULE_CRM_HMADD_135(app_id_input in varchar2) is
    v_error varchar2(500);
    app_cid varchar2(30);
    crm_cid varchar2(30);
    begin
      select MAX(t.cid)
      into app_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_hmadd';
      if nvl(app_cid,'null') != 'null' then
        select MAX(t.cid)
        into crm_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'crm_homeaddr';
        if nvl(crm_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_HMADD_135' and result_type = 'EMPTY';
          commit;
        elsif app_cid = crm_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_HMADD_135' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_HMADD_135' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_CRM_HMADD_135: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_CRM_HMADD_135;

  -- rule:137
  -- @author chen
  -- @date 2017-12-19 19:38:00
  procedure RULE_CRM_COADD_137(app_id_input in varchar2) is
    v_error varchar2(500);
    app_cid varchar2(30);
    crm_cid varchar2(30);
    begin
      select MAX(t.cid)
      into app_cid
      from af_app_cmp_today t
      where t.app_id = app_id_input
            and t.data_type = 'app_c1_coname';
      if nvl(app_cid,'null') != 'null' then
        select MAX(t.cid)
        into crm_cid
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'crm_company';
        if nvl(crm_cid,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_137' and result_type = 'EMPTY';
          commit;
        elsif app_cid = crm_cid then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_137' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_CRM_COADD_137' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_CRM_COADD_137: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_CRM_COADD_137;

  -- rule:138
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_138(app_id_input in varchar2, v_educls in af_request_applicantinfo.c1_educls%type,v_educationdegree in   af_request_applicantinfo.educationdegree%type) is
    v_error varchar2(500);
    begin
      if nvl(v_educls,'null') != 'null' then
        if nvl(v_educationdegree,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_138' and result_type = 'EMPTY';
          commit;
        elsif v_educls = v_educationdegree then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_138' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_138' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_138: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_138;

  -- rule:143
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_143(app_id_input in varchar2,v_frs_cred_crd_issue_mon in af_request_applicantinfo.frs_cred_crd_issue_mon%type) is
    v_error varchar2(500);
    begin
      if nvl(v_frs_cred_crd_issue_mon,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_143' and result_type = 'EMPTY';
        commit;
      elsif trunc(months_between(to_date('20'||substr(app_id_input,1,6),'yyyymmdd'),to_date(v_frs_cred_crd_issue_mon,'yyyy.mm')),2) <= 6 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_143' and result_type = 'HIT';
        commit;
      else
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_143' and result_type = 'UNHIT';
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
  procedure RULE_145(app_id_input in varchar2,v_reship in af_request_applicantinfo.c1_reship%type,v_mate_contact_tel in   af_request_applicantinfo.mate_contact_tel%type,v_remobil in af_request_applicantinfo.c1_remobil%type) is
    v_error varchar2(500);
    begin
      if v_reship = 'D' then
        if nvl(v_remobil,'null') = 'null' and nvl(v_mate_contact_tel,'null') = 'null' then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_145' and result_type = 'EMPTY';
          commit;
        elsif v_remobil = v_mate_contact_tel then
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_145' and result_type = 'UNHIT';
          commit;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_145' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_145: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_145;

  -- rule:152
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_152(app_id_input in varchar2,v_apsour in af_request_applicantinfo.c4_apsour%type) is
    v_error varchar2(500);
    begin
      if nvl(v_apsour,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_152' and result_type = 'EMPTY';
        commit;
      elsif v_apsour = '2' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_152' and result_type = 'UNHIT';
        commit;
      else
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_152' and result_type = 'HIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_152: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_152;

  -- rule:178
  -- @author chen
  -- @date 2017-12-14 18:52:00
  procedure RULE_178(app_id_input in varchar2,v_xname1 in af_request_applicantinfo.c1_xname1%type,v_xmobil1   af_request_applicantinfo.c1_xmobil1%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    begin
      select count(t.app_id),count(distinct(t.c1_rename))
      into flag1,flag
      from v_appinfo_year_his t
      where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
            and t.c1_xmobil1 = v_xmobil1;
      if nvl(v_xname1,'null') = 'null' or nvl(v_xmobil1,'null') = 'null' or flag1 <= 1 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_178' and result_type = 'EMPTY';
        commit;
      elsif flag >=2 then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_178' and result_type = 'HIT';
        commit;
      else
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_178' and result_type = 'UNHIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_178: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_178;

  -- rule:179
  -- @author chen
  -- @date 2017-12-1 18:52:00
  procedure RULE_179(app_id_input in varchar2,v_remobil in af_request_applicantinfo.c1_remobil%type,v_rename in   af_request_applicantinfo.c1_rename%type) is
    flag number;
    flag1 number;
    v_error varchar2(500);
    begin
      if nvl(v_remobil,'null') != 'null' and nvl(v_rename,'null') != 'null' then
        select count(t.app_id),count(distinct(t.c1_rename))
        into flag1,flag
        from v_appinfo_year_his t
        where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd')
              and t.c1_remobil = v_remobil;
        if flag1 > 1 then
          if flag >= '2' then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_179' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_179'  and result_type = 'UNHIT';
            commit;
          end if;
        else
          -- update result data
          insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_179' and result_type = 'EMPTY';
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
  procedure RULE_182(app_id_input in varchar2, v_coname in af_request_applicantinfo.c1_coname%type) is
    v_error varchar2(500);
    begin
      if nvl(v_coname,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_182' and result_type = 'EMPTY';
        commit;
      elsif instr(v_coname,'投资') != '0' or instr(v_coname,'担保有限公司') != '0' or instr(v_coname,'风险担保') != '0' or instr(  v_coname,'投资顾问') != '0' or instr(v_coname,'贷款代理') != '0' or instr(v_coname,'传媒') != '0' or instr(v_coname,'传播') !=   '0' or instr(v_coname,'科贸') != '0' or instr(v_coname,'商贸') != '0' or instr(v_coname,'咨询有限公司') != '0' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_182' and result_type = 'HIT';
        commit;
      else
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_182' and result_type = 'UNHIT';
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
  procedure RULE_198(app_id_input in varchar2,v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type,v_c2_gender  in   af_request_applicantinfo.c2_gender%type,v_c2_idnbr in  af_request_applicantinfo.c2_idnbr%type,v_c2_idtype in   af_request_applicantinfo.c2_idtype%type,v_gender in af_request_applicantinfo.c1_gender%type,v_idtype in    af_request_applicantinfo.c1_idtype%type,v_idnbr in af_request_applicantinfo.c1_idnbr%type) is
    v_error varchar2(500);
    begin
      --单独主卡申请时
      if v_c1c2_flag = '3' then
        if nvl(v_gender,'null') != 'null' and v_idtype = '01' then
          if (mod(substr(v_idnbr,-2,1),2) = 0 and v_gender = 'F') or (mod(substr(v_idnbr,-2,1),2) = 1 and  v_gender = 'M')  then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'UNHIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'HIT';
            commit;
          end if;
        end if;
      end if;
      --单独附属卡申请时
      if v_c1c2_flag = '2' then
        if nvl(v_c2_gender,'null') != 'null' and v_c2_idtype = '01' then
          if (mod(substr(v_c2_idnbr,-2,1),2) = 0 and v_c2_gender = 'F') or (mod(substr(v_c2_idnbr,-2,1),2) = 1 and  v_c2_gender =   'M')  then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'UNHIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'HIT';
            commit;
          end if;
        end if;
      end if;
      --主附卡同时申请
      if v_c1c2_flag = '1' then
        if nvl(v_gender,'null') != 'null' and v_idtype = '01' and nvl(v_c2_gender,'null') != 'null' and v_c2_idtype = '01' then
          if ((mod(substr(v_idnbr,-2,1),2) = 0 and v_gender = 'F') or (mod(substr(v_idnbr,-2,1),2) = 1 and  v_gender = 'M')) and ((mod(  substr(v_c2_idnbr,-2,1),2) = 0 and v_c2_gender = 'F') or (mod(substr(v_c2_idnbr,-2,1),2) = 1 and  v_c2_gender = 'M')) then
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'UNHIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_198' and result_type = 'HIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_198: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_198;

  -- rule:234
  -- @author chen
  -- @date 2017-12-10 11:35:00
  procedure RULE_234(app_id_input in varchar2) is
    v_error varchar2(500);
    v_risk_type VARCHAR2(10);
    begin
      select t.risk_type
      into v_risk_type
      from (select MAX(t.risk_type) as risk_type
            from af_request_appinfo_zmivsinfo t
            where t.app_id = app_id_input
            order by update_time desc) t
      where rownum = '1';
      if nvl(v_risk_type,'null') = 'null' then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_234' and result_type = 'EMPTY';
        commit;
      elsif v_risk_type in ('R010','R011','R012','R013','R014','R015','R019','R021') then
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue, type,class  from   af_risk_level_settings  where ruleno = 'RULE_234' and result_type = 'HIT';
        commit;
      else
        -- update result data
        insert  into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class)   select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from   af_risk_level_settings  where ruleno = 'RULE_234' and result_type = 'UNHIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_234: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_234;



  -------------------------------------------------------------------------------------------------
  -- author: shawn
  -- 2017-11-30 17:00:00
  -- 黑名单规则
  -------------------------------------------------------------------------------------------------

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
    flag1 number;
    v_error varchar2(500);
    begin
      if nvl(v_idnbr, 'null') != 'null' then
        select count(1) into flag1
        from opas_sameindustry_risklist t
        where t.certifi_no = v_idnbr
              and t.curr_status = '1'
              and t.star_levle in ('3','4','5');

        select count(1) into flag
        from opas_sameindustry_risklist t
        where t.certifi_no = v_idnbr
              and t.curr_status = '1'
              and t.star_levle in ('n','N','0','1','2');
        if flag1 > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as       app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_156' and result_type = 'HIT';
          commit;
        elsif flag > 0 then
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as       app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_156' and result_type = 'EMPTY';
          commit;
        else
          -- update result data
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as       app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_156' and result_type = 'UNHIT';
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
    --TODO 当data_value改成datavaluemc时255需要改成32
    app_data_value varchar(255);
    app_namemc varchar(255);
    app_legalformmc varchar(255);
    app_sitemc varchar(255);
    app_addmc varchar(255);
    begin
      if nvl(v_coname, 'null') != 'null' then
        select data_value, namemc, legalformmc, sitemc, addmc
        into app_data_value, app_namemc, app_legalformmc, app_sitemc, app_addmc
        from af_app_cmp_today t
        where t.app_id = app_id_input
              and t.data_type = 'app_c1_coname';
        if app_data_value != '-1' then
          select count(1)
          into flag
          from black_cmp t
          where curr_status = '1'
                and t.datavalue = app_data_value;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_namemc != '-1' and app_legalformmc != '-1' and app_sitemc != '-1' then
          select count(1)
          into flag
          from black_cmp t
          where curr_status = '1'
                and t.namemc = app_namemc
                and t.legalformmc = app_legalformmc
                and t.sitemc = app_sitemc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_namemc != '-1' and app_addmc != '-1' and app_sitemc != '-1' then
          select count(1)
          into flag
          from black_cmp t
          where curr_status = '1'
                and t.namemc = app_namemc
                and t.addmc = app_addmc
                and t.sitemc = app_sitemc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_158' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_158: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_158;

  -- rule:160
  procedure RULE_160(app_id_input in varchar2,v_coadd in varchar2) is
    flag number;
    v_error varchar2(500);
    --TODO 当data_value改成datavaluemc时255需要改成32
    app_data_value varchar(255);
    app_districtmc varchar(255);
    app_townmc varchar(255);
    app_streetmc varchar(255);
    app_blockmc varchar(255);
    app_buildingmc varchar(255);
    app_unitmc varchar(255);
    app_floormc varchar(255);
    app_roommc varchar(255);
    app_addinfomc varchar(255);
    begin
      if nvl(v_coadd, 'null') != 'null' then
        select t.data_value,
          t.districtmc,
          t.townmc,
          t.streetmc,
          t.blockmc,
          t.buildingmc,
          t.unitmc,
          t.floormc,
          t.roommc,
          t.addinfomc
        into app_data_value,
          app_districtmc,
          app_townmc,
          app_streetmc,
          app_blockmc,
          app_buildingmc,
          app_unitmc,
          app_floormc,
          app_roommc,
          app_addinfomc
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'app_c1_coadd';
        if  app_data_value != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.datavalue = app_data_value;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_unitmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_buildingmc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_streetmc = '-1' and app_unitmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_roommc != '-1' and app_streetmc != '-1' and  app_unitmc != '-1'
          then
            select count(1)
            into flag
            from black_add t
            where t.curr_status = '1'
                  and t.blockmc = app_blockmc
                  and t.buildingmc = app_buildingmc
                  and t.roommc = app_roommc
                  and t.streetmc = app_streetmc
                  and t.unitmc = app_unitmc;
            if flag > 0 then
              -- update result data
              insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
              commit;
            else
              -- update result data
              insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
              commit;
            end if;
        elsif app_addinfomc != '-1' and app_blockmc != '-1' and app_districtmc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.blockmc = app_blockmc
                and t.districtmc = app_districtmc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_roommc != '-1' and app_townmc != '-1' and app_unitmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.roommc = app_roommc
                and t.townmc = app_townmc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_roommc != '-1' and app_streetmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_streetmc  !=   '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_160' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_160: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
      -- don't anything
    end RULE_160;

  -- rule:162
  procedure RULE_162(app_id_input in varchar2,v_hmadd in varchar2) is
    flag number;
    v_error varchar2(500);
    --TODO 当data_value改成datavaluemc时255需要改成32
    app_data_value varchar(255);
    app_districtmc varchar(255);
    app_townmc varchar(255);
    app_streetmc varchar(255);
    app_blockmc varchar(255);
    app_buildingmc varchar(255);
    app_unitmc varchar(255);
    app_floormc varchar(255);
    app_roommc varchar(255);
    app_addinfomc varchar(255);
    begin
      if nvl(v_hmadd, 'null') != 'null' then
        select t.data_value,
          t.districtmc,
          t.townmc,
          t.streetmc,
          t.blockmc,
          t.buildingmc,
          t.unitmc,
          t.floormc,
          t.roommc,
          t.addinfomc
        into app_data_value,
          app_districtmc,
          app_townmc,
          app_streetmc,
          app_blockmc,
          app_buildingmc,
          app_unitmc,
          app_floormc,
          app_roommc,
          app_addinfomc
        from af_app_add_today t
        where t.app_id = app_id_input
              and t.data_type = 'app_c1_coadd';
        if  app_data_value != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.datavalue = app_data_value;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_unitmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_buildingmc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_streetmc = '-1' and app_unitmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_roommc != '-1' and app_streetmc != '-1' and  app_unitmc != '-1'
          then
            select count(1)
            into flag
            from black_add t
            where t.curr_status = '1'
                  and t.blockmc = app_blockmc
                  and t.buildingmc = app_buildingmc
                  and t.roommc = app_roommc
                  and t.streetmc = app_streetmc
                  and t.unitmc = app_unitmc;
            if flag > 0 then
              -- update result data
              insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
              commit;
            else
              -- update result data
              insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
              commit;
            end if;
        elsif app_addinfomc != '-1' and app_blockmc != '-1' and app_districtmc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.blockmc = app_blockmc
                and t.districtmc = app_districtmc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_roommc != '-1' and app_townmc != '-1' and app_unitmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.roommc = app_roommc
                and t.townmc = app_townmc
                and t.unitmc = app_unitmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_districtmc != '-1' and app_roommc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.districtmc = app_districtmc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_addinfomc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_streetmc != '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.addinfomc = app_addinfomc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_roommc != '-1' and app_streetmc != '-1'   then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.roommc = app_roommc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        elsif app_blockmc != '-1' and app_buildingmc != '-1' and app_districtmc != '-1' and app_floormc != '-1' and app_streetmc  !=   '-1' then
          select count(1)
          into flag
          from black_add t
          where t.curr_status = '1'
                and t.blockmc = app_blockmc
                and t.buildingmc = app_buildingmc
                and t.districtmc = app_districtmc
                and t.floormc = app_floormc
                and t.streetmc = app_streetmc;
          if flag > 0 then
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'HIT';
            commit;
          else
            -- update result data
            insert  into af_response_afriskwarning(  app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as   app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class  from af_risk_level_settings  where   ruleno = 'RULE_162' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
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

  -------------------------------------------------------------------------------------------------
  -- author: shawn
  -- 2017-12-15 17:00:00
  -- 非模糊匹配规则
  -------------------------------------------------------------------------------------------------

  --rule:78
  --@author shawn
  --@date 2017-12-14 10:52:00
  procedure rule_78(app_id_input in varchar2, v_remobil in af_request_applicantinfo.c1_remobil%type) is
    v_error varchar2(500);
    v_count number(10);
    v_id_count number(10);
    begin
      if nvl(v_remobil, 'null') != 'null' then
        select count(t.app_id), count(distinct(t.c1_idnbr)) into v_count, v_id_count from v_appinfo_year_his t where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd') and t.c1_remobil = v_remobil;
        if v_count > 1 then
          if v_id_count >= 3 then
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_78' and result_type = 'HIT';
            commit;
          else
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_78' and result_type = 'UNHIT';
            commit;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_78: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_78;

  --rule:102
  --@author shawn
  --@date 2017-12-16 10:52:00
  procedure rule_102(app_id_input in varchar2) is
    v_error varchar2(500);
    v_sl_cell_bank_bad af_request_applicantinfo.sl_cell_bank_bad%type;
    v_sl_cell_bank_fraud af_request_applicantinfo.sl_cell_bank_fraud%type;
    v_sl_cell_bank_lost af_request_applicantinfo.sl_cell_bank_lost%type;
    v_sl_id_abnormal af_request_applicantinfo.sl_id_abnormal%type;
    v_sl_id_bank_bad af_request_applicantinfo.sl_id_bank_bad%type;
    v_sl_id_bank_fraud af_request_applicantinfo.sl_id_bank_fraud%type;
    v_sl_id_bank_lost af_request_applicantinfo.sl_id_bank_lost%type;
    v_sl_id_court_bad af_request_applicantinfo.sl_id_court_bad%type;
    v_sl_id_court_executed af_request_applicantinfo.sl_id_court_executed%type;
    v_sl_id_nbank_ca_bad af_request_applicantinfo.sl_id_nbank_ca_bad%type;
    v_sl_id_nbank_ca_fraud af_request_applicantinfo.sl_id_nbank_ca_fraud%type;
    v_sl_id_nbank_ca_lost af_request_applicantinfo.sl_id_nbank_ca_lost%type;
    v_sl_id_nbank_cf_bad af_request_applicantinfo.sl_id_nbank_cf_bad%type;
    v_sl_id_nbank_cf_fraud af_request_applicantinfo.sl_id_nbank_cf_fraud%type;
    v_sl_id_nbank_cf_lost af_request_applicantinfo.sl_id_nbank_cf_lost%type;
    v_sl_id_nbank_com_bad af_request_applicantinfo.sl_id_nbank_com_bad%type;
    v_sl_id_nbank_com_fraud af_request_applicantinfo.sl_id_nbank_com_fraud%type;
    v_sl_id_nbank_com_lost af_request_applicantinfo.sl_id_nbank_com_lost%type;
    v_sl_id_nbank_mc_bad af_request_applicantinfo.sl_id_nbank_mc_bad%type;
    v_sl_id_nbank_mc_fraud af_request_applicantinfo.sl_id_nbank_mc_fraud%type;
    v_sl_id_nbank_mc_lost af_request_applicantinfo.sl_id_nbank_mc_lost%type;
    v_sl_id_nbank_other_bad af_request_applicantinfo.sl_id_nbank_other_bad%type;
    v_sl_id_nbank_other_fraud af_request_applicantinfo.sl_id_nbank_other_fraud%type;
    v_sl_id_nbank_other_lost af_request_applicantinfo.sl_id_nbank_other_lost%type;
    v_sl_id_nbank_p2p_bad af_request_applicantinfo.sl_id_nbank_p2p_bad%type;
    v_sl_id_nbank_p2p_fraud af_request_applicantinfo.sl_id_nbank_p2p_fraud%type;
    v_sl_id_nbank_p2p_lost af_request_applicantinfo.sl_id_nbank_p2p_lost%type;
    v_sl_id_p2p_bad af_request_applicantinfo.sl_id_p2p_bad%type;
    v_sl_id_p2p_fraud af_request_applicantinfo.sl_id_p2p_fraud%type;
    v_sl_id_p2p_lost af_request_applicantinfo.sl_id_p2p_lost%type;
    begin
      select
        sl_cell_bank_bad,
        sl_cell_bank_fraud,
        sl_cell_bank_lost,
        sl_id_abnormal,
        sl_id_bank_bad,
        sl_id_bank_fraud,
        sl_id_bank_lost,
        sl_id_court_bad,
        sl_id_court_executed,
        sl_id_nbank_ca_bad,
        sl_id_nbank_ca_fraud,
        sl_id_nbank_ca_lost,
        sl_id_nbank_cf_bad,
        sl_id_nbank_cf_fraud,
        sl_id_nbank_cf_lost,
        sl_id_nbank_com_bad,
        sl_id_nbank_com_fraud,
        sl_id_nbank_com_lost,
        sl_id_nbank_mc_bad,
        sl_id_nbank_mc_fraud,
        sl_id_nbank_mc_lost,
        sl_id_nbank_other_bad,
        sl_id_nbank_other_fraud,
        sl_id_nbank_other_lost,
        sl_id_nbank_p2p_bad,
        sl_id_nbank_p2p_fraud,
        sl_id_nbank_p2p_lost,
        sl_id_p2p_bad,
        sl_id_p2p_fraud,
        sl_id_p2p_lost
      into
        v_sl_cell_bank_bad,
        v_sl_cell_bank_fraud,
        v_sl_cell_bank_lost,
        v_sl_id_abnormal,
        v_sl_id_bank_bad,
        v_sl_id_bank_fraud,
        v_sl_id_bank_lost,
        v_sl_id_court_bad,
        v_sl_id_court_executed,
        v_sl_id_nbank_ca_bad,
        v_sl_id_nbank_ca_fraud,
        v_sl_id_nbank_ca_lost,
        v_sl_id_nbank_cf_bad,
        v_sl_id_nbank_cf_fraud,
        v_sl_id_nbank_cf_lost,
        v_sl_id_nbank_com_bad,
        v_sl_id_nbank_com_fraud,
        v_sl_id_nbank_com_lost,
        v_sl_id_nbank_mc_bad,
        v_sl_id_nbank_mc_fraud,
        v_sl_id_nbank_mc_lost,
        v_sl_id_nbank_other_bad,
        v_sl_id_nbank_other_fraud,
        v_sl_id_nbank_other_lost,
        v_sl_id_nbank_p2p_bad,
        v_sl_id_nbank_p2p_fraud,
        v_sl_id_nbank_p2p_lost,
        v_sl_id_p2p_bad,
        v_sl_id_p2p_fraud,
        v_sl_id_p2p_lost
      from af_request_applicantinfo
      where app_id = app_id_input;

      if nvl(v_sl_cell_bank_bad, 'null') = 'null' and nvl(v_sl_cell_bank_fraud, 'null') = 'null' and nvl(v_sl_cell_bank_lost, 'null') = 'null' and nvl(v_sl_id_abnormal, 'null') = 'null' and nvl(v_sl_id_bank_bad, 'null') = 'null' and nvl(v_sl_id_bank_fraud, 'null') = 'null' and nvl(v_sl_id_bank_lost, 'null') = 'null' and nvl(v_sl_id_court_bad, 'null') = 'null' and nvl(v_sl_id_court_executed, 'null') = 'null' and nvl(v_sl_id_nbank_ca_bad, 'null') = 'null' and nvl(v_sl_id_nbank_ca_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_ca_lost, 'null') = 'null' and nvl(v_sl_id_nbank_cf_bad, 'null') = 'null' and nvl(v_sl_id_nbank_cf_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_cf_lost, 'null') = 'null' and nvl(v_sl_id_nbank_com_bad, 'null') = 'null' and nvl(v_sl_id_nbank_com_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_com_lost, 'null') = 'null' and nvl(v_sl_id_nbank_mc_bad, 'null') = 'null' and nvl(v_sl_id_nbank_mc_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_mc_lost, 'null') = 'null' and nvl(v_sl_id_nbank_other_bad, 'null') = 'null' and nvl(v_sl_id_nbank_other_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_other_lost, 'null') = 'null' and nvl(v_sl_id_nbank_p2p_bad, 'null') = 'null' and nvl(v_sl_id_nbank_p2p_fraud, 'null') = 'null' and nvl(v_sl_id_nbank_p2p_lost, 'null') = 'null' and nvl(v_sl_id_p2p_bad, 'null') = 'null' and nvl(v_sl_id_p2p_fraud, 'null') = 'null' and nvl(v_sl_id_p2p_lost, 'null') = 'null' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_102' and result_type = 'EMPTY';
        commit;
      else
        if v_sl_cell_bank_bad = '1' or v_sl_cell_bank_bad = '0' or v_sl_cell_bank_fraud = '1' or v_sl_cell_bank_fraud = '0' or v_sl_cell_bank_lost = '1' or v_sl_cell_bank_lost = '0' or v_sl_id_abnormal = '1' or v_sl_id_abnormal = '0' or v_sl_id_bank_bad = '1' or v_sl_id_bank_bad = '0' or v_sl_id_bank_fraud = '1' or v_sl_id_bank_fraud = '0' or v_sl_id_bank_lost = '1' or v_sl_id_bank_lost = '0' or v_sl_id_court_bad = '1' or v_sl_id_court_bad = '0' or v_sl_id_court_executed = '1' or v_sl_id_court_executed = '0' or v_sl_id_nbank_ca_bad = '1' or v_sl_id_nbank_ca_bad = '0' or v_sl_id_nbank_ca_fraud = '1' or v_sl_id_nbank_ca_fraud = '0' or v_sl_id_nbank_ca_lost = '1' or v_sl_id_nbank_ca_lost = '0' or v_sl_id_nbank_cf_bad = '1' or v_sl_id_nbank_cf_bad = '0' or v_sl_id_nbank_cf_fraud = '1' or v_sl_id_nbank_cf_fraud = '0' or v_sl_id_nbank_cf_lost = '1' or v_sl_id_nbank_cf_lost = '0' or v_sl_id_nbank_com_bad = '1' or v_sl_id_nbank_com_bad = '0' or v_sl_id_nbank_com_fraud = '1' or v_sl_id_nbank_com_fraud = '0' or v_sl_id_nbank_com_lost = '1' or v_sl_id_nbank_com_lost = '0' or v_sl_id_nbank_mc_bad = '1' or v_sl_id_nbank_mc_bad = '0' or v_sl_id_nbank_mc_fraud = '1' or v_sl_id_nbank_mc_fraud = '0' or v_sl_id_nbank_mc_lost = '1' or v_sl_id_nbank_mc_lost = '0' or v_sl_id_nbank_other_bad = '1' or v_sl_id_nbank_other_bad = '0' or v_sl_id_nbank_other_fraud = '1' or v_sl_id_nbank_other_fraud = '0' or v_sl_id_nbank_other_lost = '1' or v_sl_id_nbank_other_lost = '0' or v_sl_id_nbank_p2p_bad = '1' or v_sl_id_nbank_p2p_bad = '0' or v_sl_id_nbank_p2p_fraud = '1' or v_sl_id_nbank_p2p_fraud = '0' or v_sl_id_nbank_p2p_lost = '1' or v_sl_id_nbank_p2p_lost = '0' or v_sl_id_p2p_bad = '1' or v_sl_id_p2p_bad = '0' or v_sl_id_p2p_fraud = '1' or v_sl_id_p2p_fraud = '0' or v_sl_id_p2p_lost = '1' or v_sl_id_p2p_lost = '0' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_102' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_102' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_102: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_102;

  --rule:122
  --@author shawn
  --@date 2017-12-19 10:52:00
  procedure rule_122(app_id_input in varchar2, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type,v_idtype in af_request_applicantinfo.c1_idtype%type,v_c2_idtype in af_request_applicantinfo.c2_idtype%type, v_c5_idte1 in af_request_applicantinfo.c5_idte1%type, v_c5_idte2 in af_request_applicantinfo.c5_idte2%type, v_c2_iddt1 in af_request_applicantinfo.c2_iddt1%type, v_c2_iddt2 in af_request_applicantinfo.c2_iddt2%type, v_idnbr in af_request_applicantinfo.c1_idnbr%type, v_c2_idnbr in af_request_applicantinfo.c2_idnbr%type, v_app_time in af_request_applicantinfo.app_time%type) is
    v_error varchar2(500);
    v_id1_birth varchar2(25);
    v_id2_birth varchar2(25);
    v_id1_age number(10);
    v_id2_age number(10);
    v_days number(10);
    v_flag number(1);
    begin
      if v_c1c2_flag = '1' then
        if v_idtype = '01' and v_c2_idtype = '01' then
          if nvl(v_c5_idte1, 'null') != 'null' and nvl(v_c5_idte2, 'null') != 'null' and nvl(v_c2_iddt1, 'null') != 'null' and nvl(v_c2_iddt2, 'null') != 'null' then
            if v_c5_idte1 = '1900-01-01' then
              v_id1_birth := substr(v_idnbr, 7, 8);
              v_id1_age := trunc(months_between(to_date(v_c2_iddt1, 'yyyy-mm-dd'), to_date(v_id1_birth, 'yyyymmdd')) / 12, 2);
              if v_id1_age < 46 then
                v_flag := 1;
              end if;
            end if;
            if v_c5_idte1 != '1900-01-01' then
              v_days := to_date(v_c5_idte1, 'yyyy-mm-dd') - to_date(v_app_time, 'yyyymmdd');
              if v_days <= 90 then
                v_flag := 1;
              end if;
            end if;
            if v_c5_idte2 = '1900-01-01' then
              v_id2_birth := substr(v_c2_idnbr, 7, 8);
              v_id2_age := trunc(months_between(to_date(v_c2_iddt2, 'yyyy-mm-dd'), to_date(v_id2_birth, 'yyyymmdd')) / 12, 2);
              if v_id2_age < 46 then
                v_flag := 1;
              end if;
            end if;
            if v_c5_idte2 != '1900-01-01' then
              v_days := to_date(v_c5_idte2, 'yyyy-mm-dd') - to_date(v_app_time, 'yyyymmdd');
              if v_days <= 90 then
                v_flag := 1;
              end if;
            end if;
            -- check final status
            if v_flag = 1 then
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'HIT';
              commit;
            else
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'UNHIT';
              commit;
            end if;
          end if;
        end if;
      elsif v_c1c2_flag = '2' and v_c2_idtype = '01' then
        if nvl(v_c5_idte2, 'null') != 'null' and nvl(v_c2_iddt2, 'null') != 'null' then
          if v_c5_idte2 = '1900-01-01' then
            v_id2_birth := substr(v_c2_idnbr, 7, 8);
            v_id2_age := trunc(months_between(to_date(v_c2_iddt2, 'yyyy-mm-dd'), to_date(v_id2_birth, 'yyyymmdd')) / 12, 2);
            if v_id2_age < 46 then
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'HIT';
              commit;
            else
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'UNHIT';
              commit;
            end if;
          else
            v_days := to_date(v_c5_idte2, 'yyyy-mm-dd') - to_date(v_app_time, 'yyyymmdd');
            if v_days <= 90 then
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'HIT';
              commit;
            else
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'UNHIT';
              commit;
            end if;
          end if;
        end if;
      elsif v_c1c2_flag = '3' and v_idtype = '01' then
        if nvl(v_c5_idte1, 'null') != 'null' and nvl(v_c2_iddt1, 'null') != 'null' then
          if v_c5_idte1 = '1900-01-01' then
            v_id1_birth := substr(v_idnbr, 7, 8);
            v_id1_age := trunc(months_between(to_date(v_c2_iddt1, 'yyyy-mm-dd'), to_date(v_id1_birth, 'yyyymmdd')) / 12, 2);
            if v_id1_age < 46 then
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'HIT';
              commit;
            else
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'UNHIT';
              commit;
            end if;
          else
            v_days := to_date(v_c5_idte1, 'yyyy-mm-dd') - to_date(v_app_time, 'yyyymmdd');
            if v_days <= 90 then
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'HIT';
              commit;
            else
              insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_122' and result_type = 'UNHIT';
              commit;
            end if;
          end if;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_122: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_122;

  --rule:172
  --@author shawn
  --@date 2017-12-15 10:52:00
  procedure rule_172(app_id_input in varchar2, v_exist_card_flag in af_request_applicantinfo.exist_card_flag%type, v_bk_acc_status in af_request_applicantinfo.remain_bk_acc_status%type, v_ydj_acc_status in af_request_applicantinfo.remian_ydj_acc_status%type) is
    v_error varchar2(500);
    begin
      if v_exist_card_flag = '1' then
        if nvl(v_bk_acc_status, 'null') = 'null' and nvl(v_ydj_acc_status, 'null') = 'null' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_172' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_172' and result_type = 'UNHIT';
          commit;
        end if;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_172' and result_type = 'EMPTY';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_172: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_172;

  --rule:177
  --@author shawn
  --@date 2017-12-14 10:52:00
  procedure rule_177(app_id_input in varchar2, v_xmobil1 in af_request_applicantinfo.c1_xmobil1%type) is
    v_error varchar2(500);
    v_count number(10);
    v_name_count number(10);
    begin
      if nvl(v_xmobil1, 'null') != 'null' then
        select count(t.app_id), count(distinct(t.c1_xname1)) into v_count, v_name_count from v_appinfo_year_his t where t.app_time > to_char(add_months(sysdate, -12), 'yyyymmdd') and t.c1_xmobil1 = v_xmobil1;
        if v_count > 1 then
          if v_name_count >= 2 then
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_177' and result_type = 'HIT';
            commit;
          else
            insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_177' and result_type = 'UNHIT';
            commit;
          end if;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_177' and result_type = 'EMPTY';
          commit;
        end if;
      else
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_177' and result_type = 'EMPTY';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_177: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_177;

  --rule:224
  --@author shawn
  --@date 2017-12-15 10:52:00
  procedure rule_224(app_id_input in varchar2, v_is_online  in varchar2) is
    v_error varchar2(500);
    begin
      if v_is_online != 'B' then
        insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_224' and result_type = 'HIT';
        commit;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_224: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_224;

  --rule:225&227
  --@author shawn
  --@date 2017-12-15 10:52:00
  procedure rule_225_227(app_id_input in varchar2, v_is_online  in varchar2, v_c1c2_flag in af_request_applicantinfo.c1c2_flag%type) is
    v_error varchar2(500);
    begin
      if v_is_online != 'B' then
        if v_c1c2_flag = '3' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_225' and result_type = 'HIT';
          commit;
        end if;
        if v_c1c2_flag = '1' or v_c1c2_flag = '2' then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_227' and result_type = 'HIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_225_227: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_225_227;

  --rule:238
  --@author shawn
  --@date 2017-12-14 10:52:00
  procedure rule_238(app_id_input in varchar2, v_is_online  in varchar2, v_cycadd1 in af_request_applicantinfo.c4_cycadd1%type, v_ivs_score in af_request_applicantinfo.ivs_score%type) is
    v_error varchar2(500);
    begin
      if v_is_online = 'B' and v_cycadd1 = 'H' then
        if nvl(v_ivs_score, 'null') = 'null' or v_ivs_score < 70 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'UNHIT';
          commit;
        end if;
      elsif v_is_online = 'B' and v_cycadd1 = 'B' then
        if nvl(v_ivs_score, 'null') = 'null' or v_ivs_score < 80 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'UNHIT';
          commit;
        end if;
      elsif v_is_online != 'B' then
        if nvl(v_ivs_score, 'null') = 'null' or v_ivs_score < 40 then
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'HIT';
          commit;
        else
          insert into af_response_afriskwarning(app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class) select app_id_input as app_id,riskno,risktype,riskcategory,riskcode,riskdesc,ruleno,riskvalue,type,class from af_risk_level_settings where ruleno = 'RULE_238' and result_type = 'UNHIT';
          commit;
        end if;
      end if;
      -- handle exceptions
      exception when others then v_error := 'RULE_238: ' || sqlerrm;
      insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
      commit;
    end rule_238;

end AF_HXBCB_RULE_PKG;