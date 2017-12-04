create or replace package AF_HXBCB is

  -- Created : 2017/11/3 17:15:27
  -- Purpose : Package for Antifraud
  -- 全局变量声明


  v_errors varchar2(500);

  --申请人推广进件来源 v_apsour = c4_apsour
  v_apsour af_request_applicantinfo.c4_apsour%type;

  -- 申请次数
  v_app_num number;

  -- 推广员编号 c4_abuser
  v_abuser af_request_applicantinfo.c4_abuser%type;

  -- 推广员姓名 c4_abname
  v_abname af_request_applicantinfo.c4_abname%type;

  --申请人呆帐_笔数 v_bad_debt_num = bad_debt_num
  v_bad_debt_num af_request_applicantinfo.bad_debt_num%type;

  -- 申请人出生日期 v_birth = c2_birth
  v_birth af_request_applicantinfo.c2_birth%type;

  --累计缴费月数 v_cumul_pay_months = cumul_pay_months
  v_cumul_pay_months af_request_applicantinfo.cumul_pay_months%type;

  -- 单位电话 v_comp_phone = c_comp_phone
  v_comp_phone af_request_applicantinfo.c_comp_phone%type;

  --手机号码 v_cell_phone = cell_phone
  v_cell_phone af_request_applicantinfo.cell_phone%type;

  --申请人公司中文全称 v_coname = c1_coname
  v_coname af_request_applicantinfo.c1_coname%type;

  --主卡申请人账单邮寄地址 v_cycadd1 = c4_cycadd1
  v_cycadd1 af_request_applicantinfo.c4_cycadd1%type;

  --申请人姓名英文风险描述 v_codenameenglish = codenameenglish
  v_codenameenglish af_request_applicantinfo.codenameenglish%type;

  --申请人地址邮件英文风险描述 v_codeemailenglish = codeemailenglish
  v_codeemailenglish af_request_applicantinfo.codeemailenglish%type;

  --申请人地址英文风险描述 v_codeaddrenglish  = codeaddrenglish
  v_codeaddrenglish af_request_applicantinfo.codeaddrenglish%type;

  -- 申请人单位地址 v_coadd = c1_coadd1 + c1_coadd2 + c1_coadd3 + c1_coadd4
  v_coadd varchar2(120);

  -- 申请人单位号码 v_cotel = c1_cotel
  v_cotel af_request_applicantinfo.c1_cotel%type;

  --申请人贷记卡逾期_最长逾期月数/最长透支月数 v_debit_co_due_longest_over =debit_co_due_longest_over_due
  v_debit_co_due_longest_over af_request_applicantinfo.debit_co_due_longest_over_due%type;

  --申请人贷记卡逾期_月份数 v_debit_card_over_due_month = debit_card_over_due_month_num
  v_debit_card_over_due_month af_request_applicantinfo.debit_card_over_due_month_num%type;

  --申请人贷记卡逾期_笔数/账户数 v_debit_card_over_due_acct_num = debit_card_over_due_acct_num
  v_debit_card_over_due_acct_num af_request_applicantinfo.debit_card_over_due_acct_num%type;

  --申请人准贷记卡60天以上透支_最长逾期月数/最长透支月数 v_deb_c60overd_longest_over = deb_c60overd_longest_over_due
  v_deb_c60overd_longest_over af_request_applicantinfo.deb_c60overd_longest_over_due%type;

  --申请人准贷记卡60天以上透支_月份数 v_deb_c60overd_month_num = deb_c60overd_month_num
  v_deb_c60overd_month_num af_request_applicantinfo.deb_c60overd_month_num%type;

  --申请人教育程度 v_educationapproach = educationapproach
  v_educationapproach af_request_applicantinfo.educationapproach%type;

  --申请人教育程度 v_educls = c1_educls
  v_educls af_request_applicantinfo.c1_educls%type;

  --申请人学历 v_educationdegree = educationdegree
  v_educationdegree af_request_applicantinfo.educationdegree%type;

  --初缴月份 v_first_deposit_ym = first_deposit_ym
  v_first_deposit_ym af_request_applicantinfo.first_deposit_ym%type;

  --申请人首张贷记卡发卡月份 v_frs_cred_crd_issue_mon = frs_cred_crd_issue_mon
  v_frs_cred_crd_issue_mon af_request_applicantinfo.frs_cred_crd_issue_mon%type;

  --主卡申请人性别 v_gender = c1_gender
  v_gender af_request_applicantinfo.c1_gender%type;

  -- 主卡申请人家庭电话区号 v_hmare = c1_hmare
  v_hmare af_request_applicantinfo.c1_hmare%type;

  -- 申请人住宅号码 v_hmtel = c1_hmtel
  v_hmtel af_request_applicantinfo.c1_hmtel%type;

  --家庭房屋状况 v_hmst = c1_hmst
  v_hmst af_request_applicantinfo.c1_hmst%type;

  --申请人住宅地址 v_hmadd = c1_hmadd1 + c1_hmadd2 + c1_hmadd3 + c1_hmadd4
  v_hmadd varchar2(120);

  --主卡申请人证件号码 v_idnbr = c1_idnbr
  v_idnbr af_request_applicantinfo.c1_idnbr%type;

  --行业5 v_industry_type5 = industry_type5
  v_industry_type5 af_request_applicantinfo.industry_type5%type;

  --行业4 v_industry_type4 = industry_type4
  v_industry_type4 af_request_applicantinfo.industry_type4%type;

  --行业3 v_industry_type3 = industry_type3
  v_industry_type3 af_request_applicantinfo.industry_type3%type;

  --行业2 v_industry_type2 = industry_type2
  v_industry_type2 af_request_applicantinfo.industry_type2%type;

  --行业1 v_industry_type1 = industry_type1
  v_industry_type1 af_request_applicantinfo.industry_type1%type;

  --申请人ip地址 v_ipenenglish  = ipenenglish
  v_ipenenglish af_request_applicantinfo.ipenenglish%type;

  --申请人国际移动用户识别码 v_imsienenglish = imsienenglish
  v_imsienenglish af_request_applicantinfo.imsienenglish%type;

  --申请人国际移动设备标志 v_imeienenglish = imeienenglish
  v_imeienenglish af_request_applicantinfo.imeienenglish%type;

  -- 申请人证件有效日期 v_idte1 = c5_idte1
  v_idte1 af_request_applicantinfo.c5_idte1%type;

  -- 申请人证件起始日期 v_iddt1 = c2_iddt1
  v_iddt1 af_request_applicantinfo.c2_iddt1%type;

  -- 申请人证件类型 v_idtype = c1_idtype
  v_idtype af_request_applicantinfo.c1_idtype%type;

  --申请人贷款逾期_月份数 v_loan_overdue_month_num = loan_overdue_month_num
  v_loan_overdue_month_num af_request_applicantinfo.loan_overdue_month_num%type;

  --配偶_姓名 v_mate_name = mate_name
  v_mate_name af_request_applicantinfo.mate_name%type;

  --申请人配偶的联系电话 v_mate_contact_te = mate_contact_tel
  v_mate_contact_tel af_request_applicantinfo.mate_contact_tel%type;

  -- 申请人手机号码 v_mobile = c1_mobile
  v_mobile af_request_applicantinfo.c1_mobile%type;

  --申请人未销户贷记卡_贷款法人机构数/发卡法人机构数v_no_pd_card_loan_corp_number = no_pd_card_loan_corp_number
  v_no_pd_card_loan_corp_number af_request_applicantinfo.no_pd_card_loan_corp_number%type;

  --申请人未销户贷记卡_贷款机构数/发卡机构数v_no_pd_card_loan_org_number = no_pd_card_loan_org_number
  v_no_pd_card_loan_org_number af_request_applicantinfo.no_pd_card_loan_org_number%type;

  --申请人未销户贷记卡_笔数/账户数v_no_pin_debit_card_acct_num = no_pin_debit_card_acct_num
  v_no_pin_debit_card_acct_num af_request_applicantinfo.no_pin_debit_card_acct_num%type;

  -- 逾期天数 v_overdue_day = overdue_day
  v_overdue_day af_request_applicantinfo.overdue_day%type;

  --相对位置 v_opposite_position = opposite_position
  v_opposite_position af_request_applicantinfo.opposite_position%type;

  --缴费状态 v_pboc_gjj_pay_status = pboc_gjj_pay_status
  v_pboc_gjj_pay_status af_request_applicantinfo.pboc_gjj_pay_status%type;

  --缴至月份 v_pay_ym = pay_ym
  v_pay_ym af_request_applicantinfo.pay_ym%type;

  --缴费状态 v_pboc_yl_pay_status = pboc_yl_pay_status
  v_pboc_yl_pay_status af_request_applicantinfo.pboc_yl_pay_status%type;

  --最近30天内的查询机构数_担保资格审查 v_query_org_1m_sum5 = query_org_1m_sum5
  v_query_org_1m_sum5 af_request_applicantinfo.query_org_1m_sum5%type;

  --最近30天内的查询机构数_贷后管理 v_query_org_1m_sum1=query_org_1m_sum1
  v_query_org_1m_sum1 af_request_applicantinfo.query_org_1m_sum1%type;

  --最近两年内的查询次数_担保资格审查 v_query_rec_2y_sum5=query_rec_2y_sum5
  v_query_rec_2y_sum5 af_request_applicantinfo.query_rec_2y_sum5%type;

  --最近两年内的查询次数_贷后管理 v_query_rec_2y_sum1=query_rec_2y_sum1
  v_query_rec_2y_sum1 af_request_applicantinfo.query_rec_2y_sum1%type;

  --住宅电话 v_resi_tel = resi_tel
  v_resi_tel af_request_applicantinfo.resi_tel%type;

  --直系亲属姓名 v_rename = c1_rename
  v_rename af_request_applicantinfo.c1_rename%type;

  --直系亲属电话区号 v_retelar = c1_retelar
  v_retelar af_request_applicantinfo.c1_retelar%type;

  --直系亲属电话 v_retel = c1_retel
  v_retel af_request_applicantinfo.c1_retel%type;

  --直系亲属关系 v_reship = c1_reship
  v_reship af_request_applicantinfo.c1_reship%type;

  --申请人直系亲属手机 v_remobil = c1_remobil
  v_remobil af_request_applicantinfo.c1_remobil%type;

  --申请人公民身份号码核查结果 v_result_xm = result_xm
  v_result_xm af_request_applicantinfo.result_xm%type;

  -- 申请人wifi的物理地址 v_wifimacenenglish = wifimacenenglish
  v_wifimacenenglish af_request_applicantinfo.wifimacenenglish%type;

  --联系人1姓名 v_xname1 = c1_xname1
  v_xname1 af_request_applicantinfo.c1_xname1%type;

  --联系人1手机 v_xmobil1 = c1_xmobil1
  v_xmobil1 af_request_applicantinfo.c1_xmobil1%type;

  -- 联系人1电话区号 v_xtelar1 = c1_xtelar1
  v_xtelar1 af_request_applicantinfo.c1_xtelar1%type;

  -- 联系人1电话号码 v_xtel1 = c1_xtel1
  v_xtel1 af_request_applicantinfo.c1_xtel1%type;

  --主附卡标识 v1v2_flag = c1c2_flag
  v1v2_flag af_request_applicantinfo.c1c2_flag%type;

  --附卡申请人性别 v2_gender = c2_gender
  v2_gender af_request_applicantinfo.c2_gender%type;

  --附卡申请人证件号码 v2_idnbr = c2_idnbr
  v2_idnbr af_request_applicantinfo.c2_idnbr%type;

  --附卡申请人证件类型 v2_idtype = c2_idtype
  v2_idtype af_request_applicantinfo.c2_idtype%type;

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
        bad_debt_num,
        codeaddrenglish,
        codeemailenglish,
        codenameenglish,
        cell_phone,
        c_comp_phone,
        c1_coadd1 || c1_coadd2 || c1_coadd3 || c1_coadd4,
        c1_hmadd1 || c1_hmadd2 || c1_hmadd3 || c1_hmadd4,
        c1_mobile,
        c1_cotel,
        c1_idnbr,
        c1_idtype,
        c1_remobil,
        c1_hmare,
        c1_hmtel,
        c1_coname,
        c1_reship,
        c1_educls,
        c1_hmst,
        c1_retel,
        c1_retelar,
        c1_xtel1,
        c1_xtelar1,
        c1_rename,
        c1c2_flag,
        c2_iddt1,
        c2_birth,
        c2_gender,
        c2_idnbr,
        c2_idtype,
        c4_abuser,
        c4_abname,
        c4_cycadd1,
        c4_apsour,
        c5_idte1,
        deb_c60overd_month_num,
        deb_c60overd_longest_over_due,
        debit_card_over_due_acct_num,
        debit_co_due_longest_over_due,
        educationdegree,
        educationapproach,
        frs_cred_crd_issue_mon,
        first_deposit_ym,
        imeienenglish,
        imsienenglish,
        ipenenglish,
        loan_overdue_month_num,
        mate_contact_tel,
        mate_name,
        no_pd_card_loan_org_number,
        no_pd_card_loan_corp_number,
        no_pin_debit_card_acct_num,
        opposite_position,
        overdue_day,
        pboc_gjj_pay_status,
        pay_ym,
        query_rec_2y_sum1,
        query_rec_2y_sum5,
        query_org_1m_sum1,
        query_org_1m_sum5,
        result_xm,
        resi_tel,
        wifimacenenglish,
      into
        v_bad_debt_num,
        v_codeaddrenglish,
        v_codeemailenglish,
        v_codenameenglish,
        v_cell_phone,
        v_comp_phone,
        v_coadd,
        v_hmadd,
        v_mobile,
        v_cotel,
        v_idnbr,
        v_idtype,
        v_remobil,
        v_hmare,
        v_hmtel,
        v_coname,
        v_reship,
        v_educls,
        v_hmst,
        v_retel,
        v_retelar,
        v_xtel1,
        v_xtelar1,
        v_rename,
        v1v2_flag,
        v_iddt1,
        v_birth,
        v2_gender,
        v2_idnbr,
        v2_idtype,
        v_abuser,
        v_abname,
        v_cycadd1,
        v_apsour,
        v_idte1,
        v_deb_c60overd_month_num,
        v_deb_c60overd_longest_over,
        v_debit_card_over_due_acct_num,
        v_debit_co_due_longest_over,
        v_educationdegree,
        v_educationapproach,
        v_frs_cred_crd_issue_mon,
        v_first_deposit_ym,
        v_imeienenglish,
        v_imsienenglish,
        v_ipenenglish,
        v_loan_overdue_month_num,
        v_mate_contact_tel,
        v_mate_name,
        v_no_pd_card_loan_org_number,
        v_no_pd_card_loan_corp_number,
        v_no_pin_debit_card_acct_num,
        v_opposite_position,
        v_overdue_day,
        v_pboc_gjj_pay_status,
        v_pay_ym,
        v_query_rec_2y_sum1,
        v_query_rec_2y_sum5,
        v_query_org_1m_sum1,
        v_query_org_1m_sum5,
        v_result_xm,
        v_resi_tel,
        v_wifimacenenglish
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
      -- @author song
      -- @date 2017-12-2 10:30:00
      AF_HXBCB_RULE_PKG.RULE_1(app_id_input, v_mate_name,v_reship,v_rename);
      AF_HXBCB_RULE_PKG.RULE_2(app_id_input, v_mobile,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_18(app_id_input,v_mobile,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_19(app_id_input,v_cotel,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_20(app_id_input,v_cotel,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_21(app_id_input,v_cotel,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_22(app_id_input, v_hmtel,v_hmare,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_23(app_id_input, v_hmtel,v_hmare,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_24(app_id_input, v_hmtel,v_hmare,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_25(app_id_input, v_retel ,v_retelar ,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_26(app_id_input, v_remobil,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_27(app_id_input, v_retel ,v_retelar ,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_28(app_id_input, v_remobil,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_29(app_id_input, v_retel ,v_retelar ,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_30(app_id_input, v_remobil,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_31(app_id_input, v_xtel1,v_xtelar1,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_32(app_id_input, v_xmobil1,v_cell_phone);
      AF_HXBCB_RULE_PKG.RULE_33(app_id_input, v_xtel1,v_xtelar1,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_34(app_id_input, v_xmobil1,v_resi_tel);
      AF_HXBCB_RULE_PKG.RULE_35(app_id_input, v_xtel1,v_xtelar1,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_36(app_id_input, v_xmobil1,v_comp_phone);
      AF_HXBCB_RULE_PKG.RULE_37(app_id_input, v_cumul_pay_months,v_pboc_yl_pay_status);
      AF_HXBCB_RULE_PKG.RULE_38(app_id_input, v_pboc_gjj_pay_status ,v_pay_ym, v_first_deposit_ym);
      AF_HXBCB_RULE_PKG.RULE_80(app_id_input, v_mobile);
      AF_HXBCB_RULE_PKG.RULE_146(app_id_input, v_query_rec_2y_sum1);
      AF_HXBCB_RULE_PKG.RULE_147(app_id_input, v_query_rec_2y_sum5);
      AF_HXBCB_RULE_PKG.RULE_148(app_id_input, v_query_org_1m_sum1);
      AF_HXBCB_RULE_PKG.RULE_149(app_id_input, v_query_org_1m_sum5);
      AF_HXBCB_RULE_PKG.RULE_175(app_id_input, v_remobil, v_reship);
      AF_HXBCB_RULE_PKG.RULE_176(app_id_input, v_remobil, v_rename);
      AF_HXBCB_RULE_PKG.RULE_178(app_id_input, v_xname1, v_xmobil1);
      -----精确匹配的规则---------------------------
      AF_HXBCB_RULE_PKG.RULE_40(app_id_input,v_bad_debt_num);
      AF_HXBCB_RULE_PKG.RULE_42(app_id_input,v_loan_overdue_month_num);
      AF_HXBCB_RULE_PKG.RULE_44(app_id_input,v_debit_card_over_due_acct_num);
      AF_HXBCB_RULE_PKG.RULE_45(app_id_input,v_debit_card_over_due_month);
      AF_HXBCB_RULE_PKG.RULE_46(app_id_input,v_debit_co_due_longest_over);
      AF_HXBCB_RULE_PKG.RULE_48(app_id_input,v_deb_c60overd_month_num);
      AF_HXBCB_RULE_PKG.RULE_49(app_id_input,v_deb_c60overd_longest_over);
      AF_HXBCB_RULE_PKG.RULE_65(app_id_input,v_cotel,v_hmare,v_hmtel);
      AF_HXBCB_RULE_PKG.RULE_67(app_id_input,v_cycadd1);
      AF_HXBCB_RULE_PKG.RULE_68(app_id_input,v_cycadd1);
      AF_HXBCB_RULE_PKG.RULE_70(app_id_input,v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_71(app_id_input,v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_96(app_id_input,v_educationdegree);
      AF_HXBCB_RULE_PKG.RULE_98(app_id_input,v_result_xm);
      AF_HXBCB_RULE_PKG.RULE_118(app_id_input,v_remobil,v_mobile);
      AF_HXBCB_RULE_PKG.RULE_138(app_id_input,v_educls,v_educationapproach);
      AF_HXBCB_RULE_PKG.RULE_139(app_id_input,v_no_pin_debit_card_acct_num);
      AF_HXBCB_RULE_PKG.RULE_140(app_id_input,v_no_pd_card_loan_org_number);
      AF_HXBCB_RULE_PKG.RULE_141(app_id_input,v_no_pd_card_loan_corp_number);
      AF_HXBCB_RULE_PKG.RULE_143(app_id_input,v_frs_cred_crd_issue_mon);
      AF_HXBCB_RULE_PKG.RULE_145(app_id_input,v_reship,v_mate_contact_tel,v_remobil);
      AF_HXBCB_RULE_PKG.RULE_152_1(app_id_input,v_apsour);
      AF_HXBCB_RULE_PKG.RULE_152_2(app_id_input,v_apsour);
      AF_HXBCB_RULE_PKG.RULE_152_4(app_id_input,v_apsour);
      AF_HXBCB_RULE_PKG.RULE_153_2(app_id_input,v_apsour);
      AF_HXBCB_RULE_PKG.RULE_153_3(app_id_input,v_apsour);
      AF_HXBCB_RULE_PKG.RULE_179(app_id_input,v_remobil,v_rename);
      AF_HXBCB_RULE_PKG.RULE_182(app_id_input,v_coname);
      AF_HXBCB_RULE_PKG.RULE_198(app_id_input,v1v2_flag,v2_gender,v2_idnbr,v2_idtype,v_gender,v_idtype,v_idnbr);
      AF_HXBCB_RULE_PKG.RULE_236(app_id_input);
      AF_HXBCB_RULE_PKG.RULE_121(app_id_input,v_idtype, v_idnbr,v_iddt1,v_idte1,v_birth);
      AF_HXBCB_RULE_PKG.RULE_122(app_id_input,v_idte1,v_iddt1);
      AF_HXBCB_RULE_PKG.RULE_125(app_id_input,v_wifimacenenglish);
      AF_HXBCB_RULE_PKG.RULE_126(app_id_input,v_imeienenglish);
      AF_HXBCB_RULE_PKG.RULE_127(app_id_input,v_imsienenglish);
      AF_HXBCB_RULE_PKG.RULE_128(app_id_input,v_ipenenglish);
      AF_HXBCB_RULE_PKG.RULE_129(app_id_input,v_codeaddrenglish);
      AF_HXBCB_RULE_PKG.RULE_130(app_id_input,v_codeemailenglish);
      AF_HXBCB_RULE_PKG.RULE_131(app_id_input,v_codenameenglish);
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
      AF_HXBCB_RULE_PKG.RULE_142(app_id_input, v_opposite_position);
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
