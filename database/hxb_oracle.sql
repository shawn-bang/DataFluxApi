--if exist table AF_APP_MODEL_RESULT
DROP TABLE AF_APP_MODEL_RESULT cascade constraints;
create table AF_APP_MODEL_RESULT
(
  APP_ID        VARCHAR2(40 CHAR) not null,
  MODEL_RESSULT VARCHAR2(30 CHAR),
  UPDATE_DATE   DATE default sysdate
);
-- Add comments to the table
comment on table AF_APP_MODEL_RESULT is '模型结果';
-- Add comments to the columns
comment on column AF_APP_MODEL_RESULT.APP_ID is '申请进件号码';
comment on column AF_APP_MODEL_RESULT.MODEL_RESSULT is '模型结果';
comment on column AF_APP_MODEL_RESULT.UPDATE_DATE is '更新日期';

--if exist table AF_APP_RISK_CONF_PARMS
DROP TABLE AF_APP_RISK_CONF_PARMS cascade constraints;
create table AF_APP_RISK_CONF_PARMS
(
  PARM_TYPE        VARCHAR2(20),
  PARM_LEVEL       VARCHAR2(6),
  PARM_VALUE_UP    NUMBER,
  PARM_VALUE_LOWER NUMBER
);
-- Add comments to the table
comment on table AF_APP_RISK_CONF_PARMS is '模型及SNA高中低配置表';
-- Add comments to the columns
comment on column AF_APP_RISK_CONF_PARMS.PARM_LEVEL is '风险等级';
comment on column AF_APP_RISK_CONF_PARMS.PARM_VALUE_UP is '分值上限';

--if exist table AF_APP_SNA_INPUT
DROP TABLE AF_APP_SNA_INPUT cascade constraints;
create table AF_APP_SNA_INPUT
(
  CLUSTERID VARCHAR2(100),
  TO_NODE   VARCHAR2(100),
  TO_TYPE   VARCHAR2(30),
  NET_SCORE NUMBER
);
-- Add comments to the table
comment on table AF_APP_SNA_INPUT is 'Sna输入表';
-- Add comments to the columns
comment on column AF_APP_SNA_INPUT.CLUSTERID is '网络编号';
comment on column AF_APP_SNA_INPUT.TO_NODE is '实体值';
comment on column AF_APP_SNA_INPUT.TO_TYPE is '实体类型';
comment on column AF_APP_SNA_INPUT.NET_SCORE is '网络分值';

--if exist table AF_APP_SNA_RESULT
DROP TABLE AF_APP_SNA_RESULT cascade constraints;
create table AF_APP_SNA_RESULT
(
  APP_ID      VARCHAR2(40 CHAR) not null,
  SNA_RESULT  VARCHAR2(500 CHAR),
  UPDATE_DATE DATE default sysdate
);
-- Add comments to the table
comment on table AF_APP_SNA_RESULT is 'Sna结果表';
-- Add comments to the columns
comment on column AF_APP_SNA_RESULT.APP_ID is '申请进件号码';
comment on column AF_APP_SNA_RESULT.SNA_RESULT is 'Sna结果';
comment on column AF_APP_SNA_RESULT.UPDATE_DATE is '更新日期';

-- create sna conf inputs dependence seq
create sequence af_sna_conf_input_seq
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;

--if exist table af_app_snainput
DROP TABLE af_app_snainput cascade constraints;
create table af_app_snainput
(
  idseq       NUMBER not null,
  from_node   VARCHAR2(50),
  to_node     VARCHAR2(100),
  src_type    VARCHAR2(50),
  from_type   VARCHAR2(30),
  to_type     VARCHAR2(30),
  link_type   VARCHAR2(2),
  ifcluster   VARCHAR2(2),
  update_date DATE
);
comment on table af_app_snainput is '源数据映射结果表';
comment on column af_app_snainput.from_node is '起始节点-app_id_value';
comment on column af_app_snainput.to_node is '终止节点-column_value';
comment on column af_app_snainput.src_type is '源数据字段类型-column_name';
comment on column af_app_snainput.from_type is '起始数据类型-app_id_name';
comment on column af_app_snainput.to_type is '终止数据类型-AF_APP_SNAINPUT_CONF.TO_TYPE';
comment on column af_app_snainput.link_type is '视图链接类型(1实线,4虚线)-AF_APP_SNAINPUT_CONF.LINK_TYPE';
comment on column af_app_snainput.ifcluster is '是否参与网络构建(1参与0不参与)-AF_APP_SNAINPUT_CONF.IFCLUSTER';
comment on column af_app_snainput.update_date is '更新日期-系统默认时间';

--if exist table af_app_snainput_conf
DROP TABLE af_app_snainput_conf cascade constraints;
create table af_app_snainput_conf
(
  src_type  VARCHAR2(100),
  to_type   VARCHAR2(50),
  link_type VARCHAR2(2),
  ifcluster VARCHAR2(2)
);
comment on table af_app_snainput_conf is '源数据映射表';
comment on column af_app_snainput_conf.src_type is '元数据字段列名-我方column_name';
comment on column af_app_snainput_conf.to_type is 'SNA元素列名-SNA方column_name';
comment on column af_app_snainput_conf.link_type is '视图链接类型(1实线,4虚线)- 统一給1';
comment on column af_app_snainput_conf.ifcluster is '是否参与网络构建(1参与0不参与)-统一給1';

--if exist table af_app_model_var_input
DROP TABLE af_app_model_var_input cascade constraints;
create table af_app_model_var_input
(
      APP_ID      VARCHAR2(30),
      VAR_NAME    VARCHAR2(100),
      VAR_VALUE   VARCHAR2(30),
      UPDATE_DATE DATE default sysdate
);
-- Add comments to the table
comment on table af_app_model_var_input is '模型变量输入表';
-- Add comments to the columns
comment on column af_app_model_var_input.APP_ID is '申请进件号码';
comment on column af_app_model_var_input.VAR_NAME is '变量名称';
comment on column af_app_model_var_input.VAR_VALUE is '变量值';

--if exist table af_app_model_input_parms
DROP TABLE af_app_model_input_parms cascade constraints;
create table af_app_model_input_parms
(
      MODEL_VAR       VARCHAR2(30),
      MODEL_VAR_VALUE NUMBER
);
-- Add comments to the table
comment on table af_app_model_input_parms is '模型结果参数表';
-- Add comments to the columns
comment on column af_app_model_input_parms.MODEL_VAR is '模型变量名';
comment on column af_app_model_input_parms.MODEL_VAR_VALUE is '模型变量权重';

--if exist table af_app_prc_logs
DROP TABLE af_app_prc_logs cascade constraints;
create table af_app_prc_logs
(
      app_Id VARCHAR2(30) NOT NUll,
      error_logs VARCHAR2(500),
      update_date DATE default sysdate not null
);

comment on table af_app_prc_logs is '存储过程相关日志';
comment on column af_app_prc_logs.app_Id is '申请进件号码';
comment on column af_app_prc_logs.error_logs is '日志信息';

insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('SEMI_CRED_ACCT_NUM', -.1126);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('C1_EARN', .504);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('C1_HMYR', .101);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('PERSON_HOU_LOAN_NO', -.661);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('OHTER_LOAN_NUM', .888);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('intercept', .2694);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('NO_PIN_DEBIT_CARD_ACCT_NUM', -1.189);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('DEBIT_CARD_OVER_DUE_MONTH_NUM', .421);
insert into AF_APP_MODEL_INPUT_PARMS (model_var, model_var_value) values ('C1_COYR', -1.7);
commit;

insert into af_app_snainput_conf(src_type, to_type, link_type, ifcluster) values('c1_idnbr','c1_idnbr','1','1');
commit;

insert into af_app_sna_input(clusterid,to_node,to_type,net_score)values('1','2','mob',300);
insert into af_app_sna_input(clusterid,to_node,to_type,net_score)values('2','3','idcard',400);
commit;

insert into af_app_model_input_parms(model_var,model_var_value)values('intercept',600);
insert into af_app_model_input_parms(model_var,model_var_value)values('c1_credpct',20);
insert into af_app_model_input_parms(model_var,model_var_value) values ('c6_rel_flag1',-30);
insert into af_app_model_input_parms(model_var,model_var_value) values('paymt_yn',70);
commit;

insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('SNA','D',9999,600);
insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('SNA','C',600,300);
insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('SNA','B',300,0);
insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('MODEL','D',100,80);
insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('MODEL','C',80,60);
insert into af_app_risk_conf_parms(parm_type,parm_level,parm_value_up,parm_value_lower) values ('MODEL','B',60,0);
commit;

-----------------------------------------------------------------------------------------

--if exist table af_request_appinfo_zmivsinfo
DROP TABLE af_request_appinfo_zmivsinfo cascade constraints;
--create table af_request_appinfo_zmivsinfo
create table af_request_appinfo_zmivsinfo(
      app_id VARCHAR2(25) NOT NUll,
      zm2_crt_time VARCHAR2(20),
      isrisk VARCHAR2(2),
      risk_code VARCHAR2(10),
      risk_type VARCHAR2(10),
      statement VARCHAR2(50),
      zm2_status VARCHAR2(225),
      steelement VARCHAR2(2),
      type VARCHAR2(10),
      update_time VARCHAR2(25),  
      modify_time date default sysdate not null
 
);

comment on table af_request_appinfo_zmivsinfo is '请求报文zm2信息表';
comment on column  af_request_appinfo_zmivsinfo.app_id is '申请件编号';
comment on column  af_request_appinfo_zmivsinfo.zm2_crt_time is '创建时间';
comment on column  af_request_appinfo_zmivsinfo.isrisk is '是否有风险，有风险为“T”，无风险为“F”';
comment on column  af_request_appinfo_zmivsinfo.risk_code is '风险代码';
comment on column  af_request_appinfo_zmivsinfo.risk_type is '风险类型';
comment on column  af_request_appinfo_zmivsinfo.statement is '当用户进行异议处理，并核查完毕之后，仍有异议时，给出声明。';
comment on column  af_request_appinfo_zmivsinfo.zm2_status is '当用户本人对该条负面记录有异议时，表示该异议处理流程的状态';
comment on column  af_request_appinfo_zmivsinfo.steelement is '对于逾期类风险信息，此字段表示是否结清。T（结清）/F（未结清）';
comment on column  af_request_appinfo_zmivsinfo.type is '行业类型';
comment on column  af_request_appinfo_zmivsinfo.update_time is '数据更新时间';
comment on column  af_request_appinfo_zmivsinfo.modify_time is '更新时间';

--if exist table af_response_afsummary
DROP TABLE af_response_afsummary cascade constraints;
--create table af_response_afsummary
create table af_response_afsummary(
      app_id VARCHAR2(25) NOT NUll,
      type VARCHAR2(20),
      value VARCHAR2(6),
      remarks VARCHAR2(200)
);

comment on table af_response_afsummary is '响应报文中风险概要信息表';
comment on column  af_response_afsummary.app_id is '申请件编号';
comment on column  af_response_afsummary.type is 'AF_ALL,RULE,MODEL,SNA';
comment on column  af_response_afsummary.value is '反欺诈决策结果';
comment on column  af_response_afsummary.remarks is '反欺诈决策结果描述';

--if exist table af_response_afriskwarning
DROP TABLE af_response_afriskwarning cascade constraints;
--create table af_response_afriskwarning
create table af_response_afriskwarning(
      app_id VARCHAR2(25) NOT NUll,
      riskno VARCHAR2(20),
      risktype VARCHAR2(20),
      riskcategory VARCHAR2(200),
      riskdesc VARCHAR2(200),
      riskcode VARCHAR2(6),
      ruleno VARCHAR2(20),
      type VARCHAR2(10),
      class VARCHAR2(6)
);

comment on table af_response_afriskwarning is '响应报文中风险提示信息表';
comment on column  af_response_afriskwarning.app_id is '申请件编号';
comment on column  af_response_afriskwarning.riskno is '校验规则一级分类编号';
comment on column  af_response_afriskwarning.risktype is '校验规则二级分类编号';
comment on column  af_response_afriskwarning.riskcategory is '校验规则三级分类编号';
comment on column  af_response_afriskwarning.riskdesc is '校验结果详情描述';
comment on column  af_response_afriskwarning.riskcode is '校验结果A,B,C,D,E';
comment on column  af_response_afriskwarning.ruleno is '校验规则编号';
comment on column af_response_afriskwarning.type is '反欺诈结果类型(AF_ALL,RULE,MODEL,SNA)';
comment on column af_response_afriskwarning.class is 'TYPE 二级分类';

--if exist table af_request_applicantinfo
DROP TABLE af_request_applicantinfo cascade constraints;
--create table af_request_applicantinfo
create table af_request_applicantinfo(
      app_id VARCHAR2(16) NOT NULL CONSTRAINT indx_on_app_id PRIMARY KEY,
      app_code NUMBER(10),
      app_flag NUMBER(1),
      app_prod VARCHAR2(4),
      c1_carbrnd VARCHAR2(16),
      c1_cardate VARCHAR2(10),
      c1_cardnbr VARCHAR2(19),
      c1_carnbr VARCHAR2(20),
      c1_carst VARCHAR2(1),
      c1_class VARCHAR2(3),
      c1_cname VARCHAR2(30),
      c1_coadd1 VARCHAR2(30),
      c1_coadd2 VARCHAR2(60),
      c1_coadd3 VARCHAR2(60),
      c1_coadd4 VARCHAR2(60),
      c1_cobuscd VARCHAR2(20),
      c1_cocode VARCHAR2(4),
      c1_codept VARCHAR2(20),
      c1_coduty VARCHAR2(20),
      c1_coext VARCHAR2(6),
      c1_cokind VARCHAR2(2),
      c1_colevl VARCHAR2(1),
      c1_coname VARCHAR2(60),
      c1_copost VARCHAR2(6),
      c1_cotel VARCHAR2(17),
      c1_coyr NUMBER(2),
      c1_earn NUMBER(5,1),
      c1_educls VARCHAR2(1),
      c1_email VARCHAR2(40),
      c1_ename VARCHAR2(30),
      c1_gender VARCHAR2(1),
      c1_birth VARCHAR2(10),
      c1_hloan NUMBER(12),
      c1_hmadd1 VARCHAR2(60),
      c1_hmadd2 VARCHAR2(60),
      c1_hmadd3 VARCHAR2(60),
      c1_hmadd4 VARCHAR2(60),
      c1_hmare VARCHAR2(4),
      c1_hmpost VARCHAR2(6),
      c1_hmst VARCHAR2(1),
      c1_hmtel VARCHAR2(17),
      c1_hmyr NUMBER(2),
      c1_idadd1 VARCHAR2(60),
      c1_idadd2 VARCHAR2(60),
      c1_idadd3 VARCHAR2(60),
      c1_idadd4 VARCHAR2(60),
      c1_idnbr VARCHAR2(19),
      c1_idpost VARCHAR2(6),
      c1_idtype VARCHAR2(2),
      c1_marst VARCHAR2(1),
      c1_mobile VARCHAR2(12),
      c1_nation VARCHAR2(1),
      c1_remobil VARCHAR2(12),
      c1_rename VARCHAR2(30),
      c1_reship VARCHAR2(4),
      c1_retel VARCHAR2(17),
      c1_retelar VARCHAR2(4),
      c1_telvl VARCHAR2(1),
      c1_title VARCHAR2(2),
      c1_xmobil1 VARCHAR2(12),
      c1_xname1 VARCHAR2(30),
      c1_xship1 VARCHAR2(4),
      c1_xtel1 VARCHAR2(17),
      c1_xtelar1 VARCHAR2(4),
      c1c2_flag CHAR(1),
      c2_iddt1 VARCHAR2(10),
      c2_isdp1 VARCHAR2(6),
      c2_signck VARCHAR2(8),
      c2_sign1_check VARCHAR2(1),
      c5_sgndte1 VARCHAR2(10),
      c2_signck2_check VARCHAR2(1),
      c5_sgndte2 VARCHAR2(10),
      c1_statemen_check VARCHAR2(1),
      c4_abacces VARCHAR2(2),
      c4_abbrnch VARCHAR2(4),
      c4_abname VARCHAR2(30),
      c4_abphon VARCHAR2(12),
      c4_abtype VARCHAR2(1),
      c4_abuser VARCHAR2(12),
      c4_apbatch VARCHAR2(10),
      c4_apsour VARCHAR2(1),
      c4_clyn1 VARCHAR2(1),
      c4_cycadd1 VARCHAR2(1),
      c4_cycadd2 VARCHAR2(1),
      c4_fcodat VARCHAR2(10),
      c4_othcard VARCHAR2(19),
      c4_othcred NUMBER(10),
      c4_othtype VARCHAR2(1),
      c4_reccard VARCHAR2(19),
      c4_recemp VARCHAR2(12),
      c4_recname VARCHAR2(30),
      c4_relmod VARCHAR2(1),
      c4_relship VARCHAR2(1),
      c4_rushflg NUMBER(1),
      c4_sign_flag VARCHAR2(1),
      c5_abarea NUMBER(1),
      c5_abcode CHAR(6),
      c5_abteam NUMBER(3),
      c5_abtype CHAR(3),
      c5_cardto1 CHAR(1),
      c5_comnm2p CHAR(100),
      c5_idte1 VARCHAR2(10),
      c5_qq_nbr1 CHAR(20),
      c5_regdte1 VARCHAR2(10),
      c5_weixin_nbr1 CHAR(30),
      crt_date VARCHAR2(25),
      primary_crt_time VARCHAR2(25),
      czfq_match CHAR(1),
      epay_match CHAR(1),
      exist_card_flag CHAR(1),
      hd_info_matching CHAR(1),
      input_channel CHAR(1),
      is_special_cust VARCHAR2(50),
      kq VARCHAR2(10),
      lst_upd_date VARCHAR2(25),
      lst_upd_time VARCHAR2(25),
      lst_upd_user VARCHAR2(32),
      main_card_sts VARCHAR2(20),
      matching_card_flag CHAR(1),
      aml_flag CHAR(1),
      aml_risk_level CHAR(1),
      remain_bk_acc_status VARCHAR2(2),
      remian_ydj_acc_status VARCHAR2(2),
      paymt_yn NUMBER(8),
      quick_card_flag CHAR(1),
      ydj_flag CHAR(1),
      info_flag VARCHAR2(3),
      credit_score NUMBER(4,1),
      buy_cycle VARCHAR2(2),
      use_active VARCHAR2(2),
      buy_levle VARCHAR2(2),
      is_usename_whtname VARCHAR2(2),
      is_usetel_whttel VARCHAR2(2),
      is_useidno_whtidno VARCHAR2(2),
      is_usetel_malltel VARCHAR2(2),
      is_black_idno VARCHAR2(2),
      wht_limit VARCHAR2(2),
      wht_usetype VARCHAR2(2),
      wht_refusetype VARCHAR2(2),
      isdue_currwht VARCHAR2(2),
      wht_maxhis_duedays VARCHAR2(2),
      promote_company VARCHAR2(50),
      module VARCHAR2(50),
      ip VARCHAR2(30),
      device_id VARCHAR2(30),
      educationapproach VARCHAR2(25),
      educationdegree VARCHAR2(25),
      enroldate VARCHAR2(25),
      graduate VARCHAR2(128),
      graduatetime VARCHAR2(25),
      query_result VARCHAR2(256),
      query_status CHAR(1),
      rec_status CHAR(1),
      schooltrade VARCHAR2(25),
      schooltype VARCHAR2(25),
      specialityname VARCHAR2(128),
      studyresult VARCHAR2(25),
      studystyle VARCHAR2(25),
      username VARCHAR2(20),
      c2_birth VARCHAR2(10),
      c2_cname VARCHAR2(30),
      c2_cocode VARCHAR2(4),
      c2_codept VARCHAR2(20),
      c2_coduty VARCHAR2(20),
      c2_coext VARCHAR2(6),
      c2_cokind VARCHAR2(2),
      c2_coname VARCHAR2(30),
      c2_cotel VARCHAR2(17),
      c2_coyr NUMBER(2),
      c2_earn NUMBER(5,1),
      c2_email VARCHAR2(40),
      c2_ename VARCHAR2(30),
      c2_gender VARCHAR2(1),
      c2_hmare VARCHAR2(4),
      c2_hmtel VARCHAR2(17),
      c2_iddt2 VARCHAR2(10),
      c2_idnbr VARCHAR2(19),
      c2_idtype VARCHAR2(2),
      c2_marst VARCHAR2(1),
      c2_mobile VARCHAR2(12),
      c2_nation VARCHAR2(1),
      c2_relship VARCHAR2(1),
      c2_title VARCHAR2(2),
      c5_idte2 VARCHAR2(10),
      c1_credpct NUMBER(2),
      c5_qq_nbr2 CHAR(20),
      c5_weixin_nbr2 CHAR(30),
      c6_rel_flag1 NUMBER(1),
      c6_rel_flag2 NUMBER(1),
      second_crt_time VARCHAR2(25),
      series_id2 VARCHAR2(19),
      brcreditpoint VARCHAR2(10),
      br_crt_time VARCHAR2(25),
      sl_cell_bank_bad VARCHAR2(10),
      sl_cell_bank_fraud VARCHAR2(10),
      sl_cell_bank_lost VARCHAR2(10),
      sl_cell_bank_overdue VARCHAR2(10),
      sl_cell_bank_refuse VARCHAR2(10),
      sl_cell_nbank_p2p_fraud VARCHAR2(10),
      sl_cell_nbank_p2p_overdue VARCHAR2(10),
      sl_id_abnormal VARCHAR2(10),
      sl_id_bank_bad VARCHAR2(10),
      sl_id_bank_fraud VARCHAR2(10),
      sl_id_bank_lost VARCHAR2(10),
      sl_id_bank_overdue VARCHAR2(10),
      sl_id_bank_refuse VARCHAR2(10),
      sl_id_court_bad VARCHAR2(10),
      sl_id_court_executed VARCHAR2(10),
      sl_id_nbank_ca_bad VARCHAR2(10),
      sl_id_nbank_ca_fraud VARCHAR2(10),
      sl_id_nbank_ca_lost VARCHAR2(10),
      sl_id_nbank_ca_overdue VARCHAR2(10),
      sl_id_nbank_ca_refuse VARCHAR2(10),
      sl_id_nbank_cf_bad VARCHAR2(10),
      sl_id_nbank_cf_fraud VARCHAR2(10),
      sl_id_nbank_cf_lost VARCHAR2(10),
      sl_id_nbank_cf_overdue VARCHAR2(10),
      sl_id_nbank_cf_refuse VARCHAR2(10),
      sl_id_nbank_com_bad VARCHAR2(10),
      sl_id_nbank_com_fraud VARCHAR2(10),
      sl_id_nbank_com_lost VARCHAR2(10),
      sl_id_nbank_com_overdue VARCHAR2(10),
      sl_id_nbank_com_refuse VARCHAR2(10),
      sl_id_nbank_mc_bad VARCHAR2(10),
      sl_id_nbank_mc_fraud VARCHAR2(10),
      sl_id_nbank_mc_lost VARCHAR2(10),
      sl_id_nbank_mc_overdue VARCHAR2(10),
      sl_id_nbank_mc_refuse VARCHAR2(10),
      sl_id_nbank_other_bad VARCHAR2(10),
      sl_id_nbank_other_fraud VARCHAR2(10),
      sl_id_nbank_other_lost VARCHAR2(10),
      sl_id_nbank_other_overdue VARCHAR2(10),
      sl_id_nbank_other_refuse VARCHAR2(10),
      sl_id_nbank_p2p_bad VARCHAR2(10),
      sl_id_nbank_p2p_fraud VARCHAR2(10),
      sl_id_nbank_p2p_lost VARCHAR2(10),
      sl_id_nbank_p2p_overdue VARCHAR2(10),
      sl_id_nbank_p2p_refuse VARCHAR2(10),
      sl_id_p2p_bad VARCHAR2(10),
      sl_id_p2p_fraud VARCHAR2(10),
      sl_id_p2p_lost VARCHAR2(10),
      sl_id_p2p_overdue VARCHAR2(10),
      sl_id_p2p_refuse VARCHAR2(10),
      sl_id_phone_overdue VARCHAR2(10),
      lm_abnormal VARCHAR2(10),
      lm_bank_bad VARCHAR2(10),
      lm_bank_fraud VARCHAR2(10),
      lm_bank_lost VARCHAR2(10),
      lm_bank_overdue VARCHAR2(10),
      lm_bank_refuse VARCHAR2(10),
      lm_nbank_ca_bad VARCHAR2(10),
      lm_nbank_ca_fraud VARCHAR2(10),
      lm_nbank_ca_lost VARCHAR2(10),
      lm_nbank_ca_overdue VARCHAR2(10),
      lm_nbank_ca_refuse VARCHAR2(10),
      lm_nbank_cf_bad VARCHAR2(10),
      lm_nbank_cf_fraud VARCHAR2(10),
      lm_nbank_cf_lost VARCHAR2(10),
      lm_nbank_cf_overdue VARCHAR2(10),
      lm_nbank_cf_refuse VARCHAR2(10),
      lm_nbank_com_bad VARCHAR2(10),
      lm_nbank_com_fraud VARCHAR2(10),
      lm_nbank_com_lost VARCHAR2(10),
      lm_nbank_com_overdue VARCHAR2(10),
      lm_nbank_com_refuse VARCHAR2(10),
      lm_nbank_mc_bad VARCHAR2(10),
      lm_nbank_mc_fraud VARCHAR2(10),
      lm_nbank_mc_lost VARCHAR2(10),
      lm_nbank_mc_overdue VARCHAR2(10),
      lm_nbank_mc_refuse VARCHAR2(10),
      lm_nbank_other_bad VARCHAR2(10),
      lm_nbank_other_fraud VARCHAR2(10),
      lm_nbank_other_lost VARCHAR2(10),
      lm_nbank_other_overdue VARCHAR2(10),
      lm_nbank_other_refuse VARCHAR2(10),
      lm_nbank_p2p_bad VARCHAR2(10),
      lm_nbank_p2p_fraud VARCHAR2(10),
      lm_nbank_p2p_lost VARCHAR2(10),
      lm_nbank_p2p_overdue VARCHAR2(10),
      lm_nbank_p2p_refuse VARCHAR2(10),
      lm_phone_overdue VARCHAR2(10),
      zm_score VARCHAR2(10),
      ivs_score VARCHAR2(10),
      codeaddrenglish VARCHAR2(80),
      codecertnoenglish VARCHAR2(80),
      codeemailenglish VARCHAR2(80),
      codenameenglish VARCHAR2(80),
      codephoenenglish VARCHAR2(80),
      zm1_crt_time VARCHAR2(25),
      imeienenglish VARCHAR2(80),
      imsienenglish VARCHAR2(80),
      ipenenglish VARCHAR2(80),
      macenenglish VARCHAR2(80),
      wifimacenenglish VARCHAR2(80),
      result_gmsfhm VARCHAR2(200),
      result_xm VARCHAR2(200),
      error_code VARCHAR2(50),
      error_message VARCHAR2(400),
      error_message_col VARCHAR2(400),
      addr VARCHAR2(1000),
      busaddr VARCHAR2(1000),
      busphone VARCHAR2(50),
      certno VARCHAR2(50),
      certnonew VARCHAR2(50),
      certtype VARCHAR2(6),
      company VARCHAR2(50),
      conttime VARCHAR2(50),
      custname VARCHAR2(200),
      crm_cust_d_date VARCHAR2(25),
      homeaddr VARCHAR2(1000),
      homephone VARCHAR2(50),
      is_credit_card VARCHAR2(2),
      mobilephone VARCHAR2(32),
      opendate VARCHAR2(10),
      phone VARCHAR2(50),
      crm_cust_status VARCHAR2(6),
      workage VARCHAR2(10),
      acc_status VARCHAR2(6),
      custid VARCHAR2(18),
      crm_acct_d_date VARCHAR2(25),
      five_class VARCHAR2(6),
      is_due VARCHAR2(6),
      overdue_day VARCHAR2(6),
      overdue_num VARCHAR2(6),
      t_overdue_num VARCHAR2(6),
      com_name VARCHAR2(50),
      crm_slry_d_date VARCHAR2(25),
      dkdjnum NUMBER(10),
      dkdjnum_m NUMBER(10),
      dkdjnum_y NUMBER(10),
      l_date VARCHAR2(25),
      sign_date VARCHAR2(25),
      innetworkmonth VARCHAR2(100),
      arrearage_flag VARCHAR2(100),
      avg_consumption VARCHAR2(100),
      phonemoney VARCHAR2(100),
      realname_auth VARCHAR2(100),
      mobile_querytime VARCHAR2(100),
      credit_card_acct_num VARCHAR2(10),
      frs_cred_crd_issue_mon VARCHAR2(7),
      number_read VARCHAR2(100),
      opposite_position VARCHAR2(100),
      other_loan_num VARCHAR2(10),
      person_com_hou_loan_no VARCHAR2(10),
      person_hou_loan_no VARCHAR2(10),
      semi_cred_acct_num VARCHAR2(10),
      ass_dis_balance VARCHAR2(10),
      ass_dis_num VARCHAR2(10),
      bad_debt_balance VARCHAR2(10),
      bad_debt_num VARCHAR2(10),
      deb_c60overd_acct_num VARCHAR2(10),
      deb_c60overd_longest_over_due VARCHAR2(10),
      deb_c60overd_month_num VARCHAR2(10),
      deb_c60overd_over_due_amt VARCHAR2(10),
      debit_card_over_due_acct_num VARCHAR2(10),
      debit_card_over_due_month_num VARCHAR2(10),
      debit_co_due_longest_over_due VARCHAR2(10),
      debit_co_due_over_due_amt VARCHAR2(10),
      gua_compen_balance VARCHAR2(10),
      gua_compen_num VARCHAR2(10),
      loan_overdue_acct_num VARCHAR2(10),
      loan_overdue_longest_over_due VARCHAR2(10),
      loan_overdue_month_num VARCHAR2(10),
      loan_overdue_over_due_amt VARCHAR2(10),
      birth_day VARCHAR2(20),
      c_comp_phone VARCHAR2(70),
      cell_phone VARCHAR2(25),
      communication_addr VARCHAR2(100),
      domicile_addr VARCHAR2(100),
      marital_status VARCHAR2(45),
      mate_cert_no VARCHAR2(30),
      mate_cert_type VARCHAR2(40),
      mate_contact_tel VARCHAR2(25),
      mate_name VARCHAR2(30),
      queryed_cert_no VARCHAR2(20),
      queryed_cert_type VARCHAR2(40),
      queryed_name VARCHAR2(65),
      report_time VARCHAR2(50),
      resi_tel VARCHAR2(25),
      comp_addr1 VARCHAR2(200),
      comp_addr2 VARCHAR2(200),
      comp_addr3 VARCHAR2(200),
      comp_addr4 VARCHAR2(200),
      comp_addr5 VARCHAR2(200),
      company1 VARCHAR2(100),
      company2 VARCHAR2(100),
      company3 VARCHAR2(100),
      company4 VARCHAR2(100),
      company5 VARCHAR2(100),
      cur_comp_work_stat_y1 CHAR(4),
      cur_comp_work_stat_y2 CHAR(4),
      cur_comp_work_stat_y3 CHAR(4),
      cur_comp_work_stat_y4 CHAR(4),
      cur_comp_work_stat_y5 CHAR(4),
      industry_type1 VARCHAR2(50),
      industry_type2 VARCHAR2(50),
      industry_type3 VARCHAR2(50),
      industry_type4 VARCHAR2(50),
      industry_type5 VARCHAR2(50),
      work_info_upd_time1 VARCHAR2(25),
      work_info_upd_time2 VARCHAR2(25),
      work_info_upd_time3 VARCHAR2(25),
      work_info_upd_time4 VARCHAR2(25),
      work_info_upd_time5 VARCHAR2(25),
      job1 VARCHAR2(70),
      job2 VARCHAR2(70),
      job3 VARCHAR2(70),
      job4 VARCHAR2(70),
      job5 VARCHAR2(70),
      first_deposit_ym VARCHAR2(7),
      pboc_gjj_info_upd_time VARCHAR2(25),
      join_socl_insu_dt VARCHAR2(10),
      pboc_gjj_join_socl_insu_pl VARCHAR2(100),
      monthly_deposit VARCHAR2(5),
      pboc_gjj_pay_comp VARCHAR2(100),
      pboc_gjj_pay_status VARCHAR2(50),
      pay_ym VARCHAR2(7),
      cumul_pay_months VARCHAR2(10),
      cur_mpay_amt VARCHAR2(20),
      pboc_yl_info_upd_time VARCHAR2(25),
      pboc_yl_join_socl_insu_pl VARCHAR2(100),
      join_socl_insu_ym VARCHAR2(10),
      pause_pay_reason VARCHAR2(100),
      pboc_yl_pay_comp VARCHAR2(100),
      pboc_yl_pay_status VARCHAR2(50),
      person_pay_base VARCHAR2(20),
      work_months VARCHAR2(7),
      query_org_crt_time VARCHAR2(25),
      query_org_1m_sum1 NUMBER(10),
      query_org_1m_sum2 NUMBER(10),
      query_org_1m_sum3 NUMBER(10),
      query_org_1m_sum4 NUMBER(10),
      query_org_1m_sum5 NUMBER(10),
      query_rec_2y_sum1 NUMBER(10),
      query_rec_2y_sum2 NUMBER(10),
      query_rec_2y_sum3 NUMBER(10),
      query_rec_2y_sum4 NUMBER(10),
      query_rec_2y_sum5 NUMBER(10),
      in_6m_case_create_num NUMBER(10),
      in_6m_case_open_num NUMBER(10),
      in_12m_case_create_num NUMBER(10),
      in_12m_case_open_num NUMBER(10),
      in_36m_case_create_num NUMBER(10),
      in_36m_case_open_num NUMBER(10),
      in_6m_vehicle_mortgage_num NUMBER(10),
      in_12m_vehicle_mortgage_num NUMBER(10),
      in_36m_vehicle_mortgage_num NUMBER(10),
      reside_info_upd_time1 VARCHAR2(25),
      reside_info_upd_time2 VARCHAR2(25),
      reside_info_upd_time3 VARCHAR2(25),
      reside_info_upd_time4 VARCHAR2(25),
      reside_info_upd_time5 VARCHAR2(25),
      reside_state1 VARCHAR2(20),
      reside_state2 VARCHAR2(20),
      reside_state3 VARCHAR2(20),
      reside_state4 VARCHAR2(20),
      reside_state5 VARCHAR2(20),
      resident_addr1 VARCHAR2(100),
      resident_addr2 VARCHAR2(100),
      resident_addr3 VARCHAR2(100),
      resident_addr4 VARCHAR2(100),
      resident_addr5 VARCHAR2(100),
      no_pd_card_loan_corp_number VARCHAR2(10),
      no_pd_card_loan_org_number VARCHAR2(10),
      no_pin_debit_card_acct_num VARCHAR2(10),
      outs_loans_loan_corp_number VARCHAR2(10),
      outstand_loans_acct_num VARCHAR2(10),
      outstand_loans_loan_org_number VARCHAR2(10),
      outstand_loans_6month_ave_pay VARCHAR2(10),
      outstand_loans_contract_amt VARCHAR2(10),
      no_padc_6month_ave_pay VARCHAR2(10),
      no_padc_contract_amt VARCHAR2(10),
      no_pin_debit_card_contract_amt VARCHAR2(10),
      no_pd_card_6month_ave_pay VARCHAR2(10),
      vehicle_query_result VARCHAR2(2),
      vehicle_value VARCHAR2(8),
      vehicle_age VARCHAR2(4),
      req_app_num NUMBER(10) default 1,
      modify_time date default sysdate not null
);

comment on table af_request_applicantinfo is '请求报文applicants信息表';
comment on column  af_request_applicantinfo.app_id is '申请件编号';
comment on column  af_request_applicantinfo.app_code is '申请书编号';
comment on column  af_request_applicantinfo.app_flag is '主卡/副卡标志';
comment on column  af_request_applicantinfo.app_prod is '申请卡产品';
comment on column  af_request_applicantinfo.c1_carbrnd is '自购车辆品牌';
comment on column  af_request_applicantinfo.c1_cardate is '自购车辆购买时间';
comment on column  af_request_applicantinfo.c1_cardnbr is '主卡卡号';
comment on column  af_request_applicantinfo.c1_carnbr is '自购车辆车牌号';
comment on column  af_request_applicantinfo.c1_carst is '自购车辆情况';
comment on column  af_request_applicantinfo.c1_class is '主卡申请人客户类别';
comment on column  af_request_applicantinfo.c1_cname is '主卡申请人中文姓名*';
comment on column  af_request_applicantinfo.c1_coadd1 is '类型4（公司）地址区段1';
comment on column  af_request_applicantinfo.c1_coadd2 is '类型4（公司）地址区段2';
comment on column  af_request_applicantinfo.c1_coadd3 is '类型4（公司）地址区段3';
comment on column  af_request_applicantinfo.c1_coadd4 is '类型4（公司）地址区段4';
comment on column  af_request_applicantinfo.c1_cobuscd is '公司企业代码';
comment on column  af_request_applicantinfo.c1_cocode is '公司行业类别码';
comment on column  af_request_applicantinfo.c1_codept is '公司部门';
comment on column  af_request_applicantinfo.c1_coduty is '公司职务';
comment on column  af_request_applicantinfo.c1_coext is '公司电话分机';
comment on column  af_request_applicantinfo.c1_cokind is '公司性质';
comment on column  af_request_applicantinfo.c1_colevl is '公司规模';
comment on column  af_request_applicantinfo.c1_coname is '公司中文全称';
comment on column  af_request_applicantinfo.c1_copost is '类型4（公司）邮政编码';
comment on column  af_request_applicantinfo.c1_cotel is '公司电话';
comment on column  af_request_applicantinfo.c1_coyr is '公司服务年数';
comment on column  af_request_applicantinfo.c1_earn is '主卡申请人年收入';
comment on column  af_request_applicantinfo.c1_educls is '主卡申请人教育程度';
comment on column  af_request_applicantinfo.c1_email is '主卡申请人E-mail地址';
comment on column  af_request_applicantinfo.c1_ename is '主卡申请人英文姓名';
comment on column  af_request_applicantinfo.c1_gender is '主卡申请人性别*';
comment on column  af_request_applicantinfo.c1_birth is '主卡申请人出生日期*';
comment on column  af_request_applicantinfo.c1_hloan is '月还款额/月租金额';
comment on column  af_request_applicantinfo.c1_hmadd1 is '类型1（家庭）地址区段1';
comment on column  af_request_applicantinfo.c1_hmadd2 is '类型1（家庭）地址区段2';
comment on column  af_request_applicantinfo.c1_hmadd3 is '类型1（家庭）地址区段3';
comment on column  af_request_applicantinfo.c1_hmadd4 is '类型1（家庭）地址区段4';
comment on column  af_request_applicantinfo.c1_hmare is '主卡申请人家庭电话区号*';
comment on column  af_request_applicantinfo.c1_hmpost is '类型1（家庭）邮政编码';
comment on column  af_request_applicantinfo.c1_hmst is '家庭房屋状况';
comment on column  af_request_applicantinfo.c1_hmtel is '主卡申请人家庭电话*';
comment on column  af_request_applicantinfo.c1_hmyr is '居住年数';
comment on column  af_request_applicantinfo.c1_idadd1 is '类型2（户籍）地址区段1';
comment on column  af_request_applicantinfo.c1_idadd2 is '类型2（户籍）地址区段2';
comment on column  af_request_applicantinfo.c1_idadd3 is '类型2（户籍）地址区段3';
comment on column  af_request_applicantinfo.c1_idadd4 is '类型2（户籍）地址区段4';
comment on column  af_request_applicantinfo.c1_idnbr is '主卡申请人证件号码*';
comment on column  af_request_applicantinfo.c1_idpost is '类型2（户籍）邮政编码';
comment on column  af_request_applicantinfo.c1_idtype is '主卡申请人证件类型';
comment on column  af_request_applicantinfo.c1_marst is '主卡申请人婚姻状况';
comment on column  af_request_applicantinfo.c1_mobile is '主卡申请人手机号码*';
comment on column  af_request_applicantinfo.c1_nation is '主卡申请人国籍';
comment on column  af_request_applicantinfo.c1_remobil is '直系亲属手机';
comment on column  af_request_applicantinfo.c1_rename is '直系亲属姓名';
comment on column  af_request_applicantinfo.c1_reship is '直系亲属关系';
comment on column  af_request_applicantinfo.c1_retel is '直系亲属电话';
comment on column  af_request_applicantinfo.c1_retelar is '直系亲属电话区号';
comment on column  af_request_applicantinfo.c1_telvl is '主卡申请人职称';
comment on column  af_request_applicantinfo.c1_title is '主卡申请人岗位';
comment on column  af_request_applicantinfo.c1_xmobil1 is '联系人1手机';
comment on column  af_request_applicantinfo.c1_xname1 is '联系人1姓名';
comment on column  af_request_applicantinfo.c1_xship1 is '联系人1关系';
comment on column  af_request_applicantinfo.c1_xtel1 is '联系人1电话';
comment on column  af_request_applicantinfo.c1_xtelar1 is '联系人1电话区号';
comment on column  af_request_applicantinfo.c1c2_flag is '主附卡标识';
comment on column  af_request_applicantinfo.c2_iddt1 is '主卡证件起始日期';
comment on column  af_request_applicantinfo.c2_isdp1 is '主卡发证机关代码';
comment on column  af_request_applicantinfo.c2_signck is '申请人签名确认';
comment on column  af_request_applicantinfo.c2_sign1_check is '主卡申请人签名准确性校验';
comment on column  af_request_applicantinfo.c5_sgndte1 is '客户签字日期（主卡）';
comment on column  af_request_applicantinfo.c2_signck2_check is '附属卡申请人（代理人）签名准确性校验';
comment on column  af_request_applicantinfo.c5_sgndte2 is '客户签字日期（附卡）';
comment on column  af_request_applicantinfo.c1_statemen_check is '申请人个人声明抄录文字准确性校验';
comment on column  af_request_applicantinfo.c4_abacces is '渠道代码';
comment on column  af_request_applicantinfo.c4_abbrnch is '省市代码';
comment on column  af_request_applicantinfo.c4_abname is '推广人姓名';
comment on column  af_request_applicantinfo.c4_abphon is '推广人联系电话';
comment on column  af_request_applicantinfo.c4_abtype is '推广人方式';
comment on column  af_request_applicantinfo.c4_abuser is '推广人编号';
comment on column  af_request_applicantinfo.c4_apbatch is '申请书团办编号';
comment on column  af_request_applicantinfo.c4_apsour is '推广进件来源';
comment on column  af_request_applicantinfo.c4_clyn1 is '主卡存在车辆行驶证信息';
comment on column  af_request_applicantinfo.c4_cycadd1 is '账单邮寄地址1*';
comment on column  af_request_applicantinfo.c4_cycadd2 is '账单邮寄地址2';
comment on column  af_request_applicantinfo.c4_fcodat is '主卡申请人首次参加工作时间';
comment on column  af_request_applicantinfo.c4_othcard is '主卡申请人其他信用卡卡号';
comment on column  af_request_applicantinfo.c4_othcred is '主卡申请人其他信用卡信用额度';
comment on column  af_request_applicantinfo.c4_othtype is '主卡申请人其他信用卡类型';
comment on column  af_request_applicantinfo.c4_reccard is '推荐人卡号';
comment on column  af_request_applicantinfo.c4_recemp is '推荐人工号';
comment on column  af_request_applicantinfo.c4_recname is '推荐人姓名';
comment on column  af_request_applicantinfo.c4_relmod is '推荐方式';
comment on column  af_request_applicantinfo.c4_relship is '推荐人与申请人关系';
comment on column  af_request_applicantinfo.c4_rushflg is '快速发卡标志';
comment on column  af_request_applicantinfo.c4_sign_flag is '主卡申请人亲见亲签标志';
comment on column  af_request_applicantinfo.c5_abarea is '区域代码';
comment on column  af_request_applicantinfo.c5_abcode is '推广机构号';
comment on column  af_request_applicantinfo.c5_abteam is '团队代码';
comment on column  af_request_applicantinfo.c5_abtype is '推广人方式2';
comment on column  af_request_applicantinfo.c5_cardto1 is '主卡卡片寄送地址类型';
comment on column  af_request_applicantinfo.c5_comnm2p is '单位名称行2(主卡)';
comment on column  af_request_applicantinfo.c5_idte1 is '主卡证件有效期';
comment on column  af_request_applicantinfo.c5_qq_nbr1 is '主卡申请人QQ号码';
comment on column  af_request_applicantinfo.c5_regdte1 is '车辆行驶证信注册日期（主卡）';
comment on column  af_request_applicantinfo.c5_weixin_nbr1 is '主卡申请人微信号码';
comment on column  af_request_applicantinfo.crt_date is '创建日期';
comment on column  af_request_applicantinfo.primary_crt_time is '创建时间';
comment on column  af_request_applicantinfo.czfq_match is '配发财智分期标志';
comment on column  af_request_applicantinfo.epay_match is '配发epay卡标志';
comment on column  af_request_applicantinfo.exist_card_flag is '是否存量客户';
comment on column  af_request_applicantinfo.hd_info_matching is '手机实名验证项均不一致(华道)';
comment on column  af_request_applicantinfo.input_channel is '进件渠道';
comment on column  af_request_applicantinfo.is_special_cust is '是否特殊客户';
comment on column  af_request_applicantinfo.kq is '费率_客群类别';
comment on column  af_request_applicantinfo.lst_upd_date is '最后一次修改日期';
comment on column  af_request_applicantinfo.lst_upd_time is '最后一次修改时间';
comment on column  af_request_applicantinfo.lst_upd_user is '最后修改人';
comment on column  af_request_applicantinfo.main_card_sts is '主卡状态';
comment on column  af_request_applicantinfo.matching_card_flag is '双进件套卡标志';
comment on column  af_request_applicantinfo.aml_flag is '是否命中反洗钱名单';
comment on column  af_request_applicantinfo.aml_risk_level is '反洗钱风险等级';
comment on column  af_request_applicantinfo.remain_bk_acc_status is '存量标准卡账户状态';
comment on column  af_request_applicantinfo.remian_ydj_acc_status is '存量易达金卡账户状态';
comment on column  af_request_applicantinfo.paymt_yn is '是否关联还款';
comment on column  af_request_applicantinfo.quick_card_flag is '审批系统快速发卡标志';
comment on column  af_request_applicantinfo.ydj_flag is '易达金标识，1为易达金，2为非易达金';
comment on column  af_request_applicantinfo.info_flag is '京东卡-信息验证标识';
comment on column  af_request_applicantinfo.credit_score is '小白信用分';
comment on column  af_request_applicantinfo.buy_cycle is '网购账龄';
comment on column  af_request_applicantinfo.use_active is '用户活跃度';
comment on column  af_request_applicantinfo.buy_levle is '购买力等级';
comment on column  af_request_applicantinfo.is_usename_whtname is '用户填写姓名与白条激活姓名是否一致';
comment on column  af_request_applicantinfo.is_usetel_whttel is '用户填写手机号与白条激活手机是否一致';
comment on column  af_request_applicantinfo.is_useidno_whtidno is '用户填写身份证号与白条激活身份证号是否一致';
comment on column  af_request_applicantinfo.is_usetel_malltel is '用户填写手机号与商城注册手机是否一致';
comment on column  af_request_applicantinfo.is_black_idno is '身份证号是否黑名单';
comment on column  af_request_applicantinfo.wht_limit is '白条额度';
comment on column  af_request_applicantinfo.wht_usetype is '白条用户类别';
comment on column  af_request_applicantinfo.wht_refusetype is '白条拒绝原因类别';
comment on column  af_request_applicantinfo.isdue_currwht is '白条当前是否逾期';
comment on column  af_request_applicantinfo.wht_maxhis_duedays is '白条历史最高逾期天数';
comment on column  af_request_applicantinfo.promote_company is '第三方公司名称';
comment on column  af_request_applicantinfo.module is '模块名称';
comment on column  af_request_applicantinfo.ip is '客户端IP';
comment on column  af_request_applicantinfo.device_id is '设备识别码';
comment on column  af_request_applicantinfo.educationapproach is '办学形式(全日制、函授等)';
comment on column  af_request_applicantinfo.educationdegree is '学历';
comment on column  af_request_applicantinfo.enroldate is '入学年份';
comment on column  af_request_applicantinfo.graduate is '毕业院校';
comment on column  af_request_applicantinfo.graduatetime is '毕业时间';
comment on column  af_request_applicantinfo.query_result is '查询结果';
comment on column  af_request_applicantinfo.query_status is '查询状态';
comment on column  af_request_applicantinfo.rec_status is '记录状态';
comment on column  af_request_applicantinfo.schooltrade is '学校性质(公办、民办等)';
comment on column  af_request_applicantinfo.schooltype is '毕业院校类型';
comment on column  af_request_applicantinfo.specialityname is '专业';
comment on column  af_request_applicantinfo.studyresult is '毕业结论';
comment on column  af_request_applicantinfo.studystyle is '学历类型';
comment on column  af_request_applicantinfo.username is '姓名';
comment on column  af_request_applicantinfo.c2_birth is '附卡申请人出生日期*';
comment on column  af_request_applicantinfo.c2_cname is '附卡申请人中文姓名*';
comment on column  af_request_applicantinfo.c2_cocode is '附卡申请人公司行业类别码';
comment on column  af_request_applicantinfo.c2_codept is '附卡申请人公司部门';
comment on column  af_request_applicantinfo.c2_coduty is '附卡申请人公司部门';
comment on column  af_request_applicantinfo.c2_coext is '附卡申请人公司电话分机';
comment on column  af_request_applicantinfo.c2_cokind is '附卡申请人公司性质';
comment on column  af_request_applicantinfo.c2_coname is '附卡申请人公司全称';
comment on column  af_request_applicantinfo.c2_cotel is '附卡申请人公司电话';
comment on column  af_request_applicantinfo.c2_coyr is '附卡申请人公司服务年数';
comment on column  af_request_applicantinfo.c2_earn is '附卡申请人年收入';
comment on column  af_request_applicantinfo.c2_email is '附卡申请人E-mail地址';
comment on column  af_request_applicantinfo.c2_ename is '附卡申请人英文姓名';
comment on column  af_request_applicantinfo.c2_gender is '附卡申请人性别*';
comment on column  af_request_applicantinfo.c2_hmare is '附卡申请人家庭电话区号*';
comment on column  af_request_applicantinfo.c2_hmtel is '附卡申请人家庭电话*';
comment on column  af_request_applicantinfo.c2_iddt2 is '附卡证件起始日期';
comment on column  af_request_applicantinfo.c2_idnbr is '附卡申请人证件号码*';
comment on column  af_request_applicantinfo.c2_idtype is '附卡申请人证件类型*';
comment on column  af_request_applicantinfo.c2_marst is '附卡申请人婚姻状况';
comment on column  af_request_applicantinfo.c2_mobile is '附卡申请人手机号码*';
comment on column  af_request_applicantinfo.c2_nation is '附卡申请人国籍';
comment on column  af_request_applicantinfo.c2_relship is '附卡与主卡关系';
comment on column  af_request_applicantinfo.c2_title is '附卡申请人岗位';
comment on column  af_request_applicantinfo.c5_idte2 is '附卡证件有效期';
comment on column  af_request_applicantinfo.c1_credpct is '附卡额度占主卡额度百分比';
comment on column  af_request_applicantinfo.c5_qq_nbr2 is '附卡申请人QQ号码';
comment on column  af_request_applicantinfo.c5_weixin_nbr2 is '附卡申请人微信号码';
comment on column  af_request_applicantinfo.c6_rel_flag1 is '主卡申请人关联方声明';
comment on column  af_request_applicantinfo.c6_rel_flag2 is '附卡申请人关联方声明';
comment on column  af_request_applicantinfo.second_crt_time is '创建时间';
comment on column  af_request_applicantinfo.series_id2 is '附卡套卡标识';
comment on column  af_request_applicantinfo.brcreditpoint is '百融征信局评分';
comment on column  af_request_applicantinfo.br_crt_time is '创建时间';
comment on column  af_request_applicantinfo.sl_cell_bank_bad is '通过手机号查询银行(含信用卡)不良 ';
comment on column  af_request_applicantinfo.sl_cell_bank_fraud is '通过手机号查询银行(含信用卡)资信不佳 ';
comment on column  af_request_applicantinfo.sl_cell_bank_lost is '通过手机号查询银行(含信用卡)失联 ';
comment on column  af_request_applicantinfo.sl_cell_bank_overdue is '通过手机号查询银行(含信用卡)短时逾期 ';
comment on column  af_request_applicantinfo.sl_cell_bank_refuse is '通过手机号查询银行(含信用卡)拒绝 ';
comment on column  af_request_applicantinfo.sl_cell_nbank_p2p_fraud is '通过手机号查询非银-P2P资信不佳 ';
comment on column  af_request_applicantinfo.sl_cell_nbank_p2p_overdue is '通过手机号查询非银-P2P短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_abnormal is '通过身份证号查询高危行为';
comment on column  af_request_applicantinfo.sl_id_bank_bad is '通过身份证号查询银行(含信用卡)不良 ';
comment on column  af_request_applicantinfo.sl_id_bank_fraud is '通过身份证号查询银行(含信用卡)资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_bank_lost is '通过身份证号查询银行(含信用卡)失联 ';
comment on column  af_request_applicantinfo.sl_id_bank_overdue is '通过身份证号查询银行(含信用卡)短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_bank_refuse is '通过身份证号查询银行(含信用卡)拒绝 ';
comment on column  af_request_applicantinfo.sl_id_court_bad is '通过身份证号查询法院失信人';
comment on column  af_request_applicantinfo.sl_id_court_executed is '通过身份证号查询法院被执行人';
comment on column  af_request_applicantinfo.sl_id_nbank_ca_bad is '通过身份证号查询非银-现金类分期不良 ';
comment on column  af_request_applicantinfo.sl_id_nbank_ca_fraud is '通过身份证号查询非银-现金类分期资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_ca_lost is '通过身份证号查询非银-现金类分期失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_ca_overdue is '通过身份证号查询非银-现金类分期短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_ca_refuse is '通过身份证号查询非银-现金类分期拒绝 ';
comment on column  af_request_applicantinfo.sl_id_nbank_cf_bad is '通过身份证号查询非银-消费类分期不良 ';
comment on column  af_request_applicantinfo.sl_id_nbank_cf_fraud is '通过身份证号查询非银-消费类分期资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_cf_lost is '通过身份证号查询非银-消费类分期失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_cf_overdue is '通过身份证号查询非银-消费类分期短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_cf_refuse is '通过身份证号查询非银-消费类分期拒绝 ';
comment on column  af_request_applicantinfo.sl_id_nbank_com_bad is '通过身份证号查询非银-代偿类分期不良';
comment on column  af_request_applicantinfo.sl_id_nbank_com_fraud is '通过身份证号查询非银-代偿类分期资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_com_lost is '通过身份证号查询非银-代偿类分期失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_com_overdue is '通过身份证号查询非银-代偿类分期短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_com_refuse is '通过身份证号查询非银-代偿类分期拒绝 ';
comment on column  af_request_applicantinfo.sl_id_nbank_mc_bad is '通过身份证号查询非银-小贷不良';
comment on column  af_request_applicantinfo.sl_id_nbank_mc_fraud is '通过身份证号查询非银-小贷资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_mc_lost is '通过身份证号查询非银-小贷失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_mc_overdue is '通过身份证号查询非银-小贷短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_mc_refuse is '通过身份证号查询非银-小贷拒绝 ';
comment on column  af_request_applicantinfo.sl_id_nbank_other_bad is '通过身份证号查询非银-其他不良 ';
comment on column  af_request_applicantinfo.sl_id_nbank_other_fraud is '通过身份证号查询非银-其他资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_other_lost is '通过身份证号查询非银-其他失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_other_overdue is '通过身份证号查询非银-其他短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_other_refuse is '通过身份证号查询非银-其他拒绝 ';
comment on column  af_request_applicantinfo.sl_id_nbank_p2p_bad is '通过身份证号查询非银-P2P不良 ';
comment on column  af_request_applicantinfo.sl_id_nbank_p2p_fraud is '通过身份证号查询非银-P2P资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_nbank_p2p_lost is '通过身份证号查询非银-P2P失联 ';
comment on column  af_request_applicantinfo.sl_id_nbank_p2p_overdue is '通过身份证号查询非银-P2P短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_nbank_p2p_refuse is '通过身份证号查询非银-P2P拒绝 ';
comment on column  af_request_applicantinfo.sl_id_p2p_bad is '通过身份证号查询非银(含全部非银类型)不良 ';
comment on column  af_request_applicantinfo.sl_id_p2p_fraud is '通过身份证号查询非银(含全部非银类型)资信不佳 ';
comment on column  af_request_applicantinfo.sl_id_p2p_lost is '通过身份证号查询非银(含全部非银类型)失联 ';
comment on column  af_request_applicantinfo.sl_id_p2p_overdue is '通过身份证号查询非银(含全部非银类型)短时逾期 ';
comment on column  af_request_applicantinfo.sl_id_p2p_refuse is '通过身份证号查询非银(含全部非银类型)拒绝 ';
comment on column  af_request_applicantinfo.sl_id_phone_overdue is '通过身份证号查询电信欠费';
comment on column  af_request_applicantinfo.lm_abnormal is '通过联系人手机查询高危行为';
comment on column  af_request_applicantinfo.lm_bank_bad is '通过联系人手机查询银行(含信用卡)不良 ';
comment on column  af_request_applicantinfo.lm_bank_fraud is '通过联系人手机查询银行(含信用卡)资信不佳 ';
comment on column  af_request_applicantinfo.lm_bank_lost is '通过联系人手机查询银行(含信用卡)失联 ';
comment on column  af_request_applicantinfo.lm_bank_overdue is '通过联系人手机查询银行(含信用卡)短时逾期 ';
comment on column  af_request_applicantinfo.lm_bank_refuse is '通过联系人手机查询银行(含信用卡)拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_ca_bad is '通过联系人手机查询非银-现金类分期不良 ';
comment on column  af_request_applicantinfo.lm_nbank_ca_fraud is '通过联系人手机查询非银-现金类分期资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_ca_lost is '通过联系人手机查询非银-现金类分期失联 ';
comment on column  af_request_applicantinfo.lm_nbank_ca_overdue is '通过联系人手机查询非银-现金类分期短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_ca_refuse is '通过联系人手机查询非银-现金类分期拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_cf_bad is '通过联系人手机查询非银-消费类分期不良 ';
comment on column  af_request_applicantinfo.lm_nbank_cf_fraud is '通过联系人手机查询非银-消费类分期资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_cf_lost is '通过联系人手机查询非银-消费类分期失联 ';
comment on column  af_request_applicantinfo.lm_nbank_cf_overdue is '通过联系人手机查询非银-消费类分期短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_cf_refuse is '通过联系人手机查询非银-消费类分期拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_com_bad is '通过联系人手机查询非银-代偿类分期不良 ';
comment on column  af_request_applicantinfo.lm_nbank_com_fraud is '通过联系人手机查询非银-代偿类分期资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_com_lost is '通过联系人手机查询非银-代偿类分期失联 ';
comment on column  af_request_applicantinfo.lm_nbank_com_overdue is '通过联系人手机查询非银-代偿类分期短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_com_refuse is '通过联系人手机查询非银-代偿类分期拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_mc_bad is '通过联系人手机查询非银-小贷不良 ';
comment on column  af_request_applicantinfo.lm_nbank_mc_fraud is '通过联系人手机查询非银-小贷资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_mc_lost is '通过联系人手机查询非银-小贷失联 ';
comment on column  af_request_applicantinfo.lm_nbank_mc_overdue is '通过联系人手机查询非银-小贷短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_mc_refuse is '通过联系人手机查询非银-小贷拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_other_bad is '通过联系人手机查询非银-其他不良 ';
comment on column  af_request_applicantinfo.lm_nbank_other_fraud is '通过联系人手机查询非银-其他资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_other_lost is '通过联系人手机查询非银-其他失联 ';
comment on column  af_request_applicantinfo.lm_nbank_other_overdue is '通过联系人手机查询非银-其他短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_other_refuse is '通过联系人手机查询非银-其他拒绝 ';
comment on column  af_request_applicantinfo.lm_nbank_p2p_bad is '通过联系人手机查询非银-P2P不良 ';
comment on column  af_request_applicantinfo.lm_nbank_p2p_fraud is '通过联系人手机查询非银-P2P资信不佳 ';
comment on column  af_request_applicantinfo.lm_nbank_p2p_lost is '通过联系人手机查询非银-P2P失联 ';
comment on column  af_request_applicantinfo.lm_nbank_p2p_overdue is '通过联系人手机查询非银-P2P短时逾期 ';
comment on column  af_request_applicantinfo.lm_nbank_p2p_refuse is '通过联系人手机查询非银-P2P拒绝 ';
comment on column  af_request_applicantinfo.lm_phone_overdue is '通过联系人手机查询电信欠费 ';
comment on column  af_request_applicantinfo.zm_score is '用户的芝麻信用评分。分值范围[350,950]。如果用户数据不足，无法评分时，返回字符串""N/A""。';
comment on column  af_request_applicantinfo.ivs_score is 'ivs评分。取值区间为[0,100]。分数越高，表示可信程度越高。0表示无对应数据。';
comment on column  af_request_applicantinfo.codeaddrenglish is '地址英文风险描述';
comment on column  af_request_applicantinfo.codecertnoenglish is '身份证英文风险描述';
comment on column  af_request_applicantinfo.codeemailenglish is '邮件英文风险描述';
comment on column  af_request_applicantinfo.codenameenglish is '姓名英文风险描述';
comment on column  af_request_applicantinfo.codephoenenglish is '手机英文风险描述';
comment on column  af_request_applicantinfo.zm1_crt_time is '创建时间';
comment on column  af_request_applicantinfo.imeienenglish is '国际移动设备标志';
comment on column  af_request_applicantinfo.imsienenglish is '国际移动用户识别码';
comment on column  af_request_applicantinfo.ipenenglish is 'ip地址';
comment on column  af_request_applicantinfo.macenenglish is '物理地址';
comment on column  af_request_applicantinfo.wifimacenenglish is 'wifi的物理地址';
comment on column  af_request_applicantinfo.result_gmsfhm is '公民身份号码核查结果';
comment on column  af_request_applicantinfo.result_xm is '姓名核查结果';
comment on column  af_request_applicantinfo.error_code is '错误代码';
comment on column  af_request_applicantinfo.error_message is '错误描述/缺失必录项描述';
comment on column  af_request_applicantinfo.error_message_col is '缺失必录项字段名称';
comment on column  af_request_applicantinfo.addr is '联系地址';
comment on column  af_request_applicantinfo.busaddr is '单位地址';
comment on column  af_request_applicantinfo.busphone is '公司固定电话';
comment on column  af_request_applicantinfo.certno is '证件号码';
comment on column  af_request_applicantinfo.certnonew is '转换后的证件号码';
comment on column  af_request_applicantinfo.certtype is '证件类型';
comment on column  af_request_applicantinfo.company is '工作单位';
comment on column  af_request_applicantinfo.conttime is '联系时间';
comment on column  af_request_applicantinfo.custname is '客户名称';
comment on column  af_request_applicantinfo.crm_cust_d_date is '数据日期';
comment on column  af_request_applicantinfo.homeaddr is '住宅地址';
comment on column  af_request_applicantinfo.homephone is '住宅固定电话';
comment on column  af_request_applicantinfo.is_credit_card is '是否持有信用卡';
comment on column  af_request_applicantinfo.mobilephone is '联系手机';
comment on column  af_request_applicantinfo.opendate is '最早开户时间';
comment on column  af_request_applicantinfo.phone is '联系电话';
comment on column  af_request_applicantinfo.crm_cust_status is '客户状态';
comment on column  af_request_applicantinfo.workage is '现单位工龄';
comment on column  af_request_applicantinfo.acc_status is '账户状态';
comment on column  af_request_applicantinfo.custid is '客户ID';
comment on column  af_request_applicantinfo.crm_acct_d_date is '数据日期';
comment on column  af_request_applicantinfo.five_class is '五级分类';
comment on column  af_request_applicantinfo.is_due is '是否逾期';
comment on column  af_request_applicantinfo.overdue_day is '逾期天数';
comment on column  af_request_applicantinfo.overdue_num is '当期逾期期数';
comment on column  af_request_applicantinfo.t_overdue_num is '累计逾期期数';
comment on column  af_request_applicantinfo.com_name is '代发单位名称';
comment on column  af_request_applicantinfo.crm_slry_d_date is '数据日期';
comment on column  af_request_applicantinfo.dkdjnum is '当前累计代发笔数';
comment on column  af_request_applicantinfo.dkdjnum_m is '本月代发笔数';
comment on column  af_request_applicantinfo.dkdjnum_y is '本年累计代发笔数';
comment on column  af_request_applicantinfo.l_date is '最后一次代发日期';
comment on column  af_request_applicantinfo.sign_date is '签约时间';
comment on column  af_request_applicantinfo.innetworkmonth is '入网时长(月)';
comment on column  af_request_applicantinfo.arrearage_flag is '是否欠费';
comment on column  af_request_applicantinfo.avg_consumption is '近3个月平均消费(元)';
comment on column  af_request_applicantinfo.phonemoney is '终端价位(元)';
comment on column  af_request_applicantinfo.realname_auth is '实名认证';
comment on column  af_request_applicantinfo.mobile_querytime is '查询时间';
comment on column  af_request_applicantinfo.credit_card_acct_num is '贷记卡账户数';
comment on column  af_request_applicantinfo.frs_cred_crd_issue_mon is '首张贷记卡发卡月份';
comment on column  af_request_applicantinfo.number_read is '数字解读';
comment on column  af_request_applicantinfo.opposite_position is '相对位置';
comment on column  af_request_applicantinfo.other_loan_num is '其他贷款笔数';
comment on column  af_request_applicantinfo.person_com_hou_loan_no is '个人商用房贷款笔数';
comment on column  af_request_applicantinfo.person_hou_loan_no is '个人住房贷款笔数';
comment on column  af_request_applicantinfo.semi_cred_acct_num is '准贷记卡账户数';
comment on column  af_request_applicantinfo.ass_dis_balance is '资产处置_余额';
comment on column  af_request_applicantinfo.ass_dis_num is '资产处置_笔数';
comment on column  af_request_applicantinfo.bad_debt_balance is '呆帐_余额';
comment on column  af_request_applicantinfo.bad_debt_num is '呆帐_笔数';
comment on column  af_request_applicantinfo.deb_c60overd_acct_num is '准贷记卡60天以上透支_笔数/账户数';
comment on column  af_request_applicantinfo.deb_c60overd_longest_over_due is '准贷记卡60天以上透支_最长逾期月数/最长透支月数';
comment on column  af_request_applicantinfo.deb_c60overd_month_num is '准贷记卡60天以上透支_月份数';
comment on column  af_request_applicantinfo.deb_c60overd_over_due_amt is '准贷记卡60天以上透支_单月最高逾期总额/单月最高透支总额';
comment on column  af_request_applicantinfo.debit_card_over_due_acct_num is '贷记卡逾期_笔数/账户数';
comment on column  af_request_applicantinfo.debit_card_over_due_month_num is '贷记卡逾期_月份数';
comment on column  af_request_applicantinfo.debit_co_due_longest_over_due is '贷记卡逾期_最长逾期月数/最长透支月数';
comment on column  af_request_applicantinfo.debit_co_due_over_due_amt is '贷记卡逾期_单月最高逾期总额/单月最高透支总额';
comment on column  af_request_applicantinfo.gua_compen_balance is '保证人代偿_余额';
comment on column  af_request_applicantinfo.gua_compen_num is '保证人代偿_笔数';
comment on column  af_request_applicantinfo.loan_overdue_acct_num is '贷款逾期_笔数/账户数';
comment on column  af_request_applicantinfo.loan_overdue_longest_over_due is '贷款逾期_最长逾期月数/最长透支月数';
comment on column  af_request_applicantinfo.loan_overdue_month_num is '贷款逾期_月份数';
comment on column  af_request_applicantinfo.loan_overdue_over_due_amt is '贷款逾期_单月最高逾期总额/单月最高透支总额';
comment on column  af_request_applicantinfo.birth_day is '出生日期';
comment on column  af_request_applicantinfo.c_comp_phone is '单位电话';
comment on column  af_request_applicantinfo.cell_phone is '手机号码';
comment on column  af_request_applicantinfo.communication_addr is '通讯地址';
comment on column  af_request_applicantinfo.domicile_addr is '户籍地址';
comment on column  af_request_applicantinfo.marital_status is '婚姻状况';
comment on column  af_request_applicantinfo.mate_cert_no is '配偶_证件号码';
comment on column  af_request_applicantinfo.mate_cert_type is '配偶_证件类型';
comment on column  af_request_applicantinfo.mate_contact_tel is '配偶_联系电话';
comment on column  af_request_applicantinfo.mate_name is '配偶_姓名';
comment on column  af_request_applicantinfo.queryed_cert_no is '被查询者证件号码';
comment on column  af_request_applicantinfo.queryed_cert_type is '被查询者证件类型';
comment on column  af_request_applicantinfo.queryed_name is '被查询者姓名';
comment on column  af_request_applicantinfo.report_time is '报告时间';
comment on column  af_request_applicantinfo.resi_tel is '住宅电话';
comment on column  af_request_applicantinfo.comp_addr1 is '单位地址1';
comment on column  af_request_applicantinfo.comp_addr2 is '单位地址2';
comment on column  af_request_applicantinfo.comp_addr3 is '单位地址3';
comment on column  af_request_applicantinfo.comp_addr4 is '单位地址4';
comment on column  af_request_applicantinfo.comp_addr5 is '单位地址5';
comment on column  af_request_applicantinfo.company1 is '工作单位1';
comment on column  af_request_applicantinfo.company2 is '工作单位2';
comment on column  af_request_applicantinfo.company3 is '工作单位3';
comment on column  af_request_applicantinfo.company4 is '工作单位4';
comment on column  af_request_applicantinfo.company5 is '工作单位5';
comment on column  af_request_applicantinfo.cur_comp_work_stat_y1 is '进入本单位年份1';
comment on column  af_request_applicantinfo.cur_comp_work_stat_y2 is '进入本单位年份2';
comment on column  af_request_applicantinfo.cur_comp_work_stat_y3 is '进入本单位年份3';
comment on column  af_request_applicantinfo.cur_comp_work_stat_y4 is '进入本单位年份4';
comment on column  af_request_applicantinfo.cur_comp_work_stat_y5 is '进入本单位年份5';
comment on column  af_request_applicantinfo.industry_type1 is '行业1';
comment on column  af_request_applicantinfo.industry_type2 is '行业2';
comment on column  af_request_applicantinfo.industry_type3 is '行业3';
comment on column  af_request_applicantinfo.industry_type4 is '行业4';
comment on column  af_request_applicantinfo.industry_type5 is '行业5';
comment on column  af_request_applicantinfo.work_info_upd_time1 is '信息更新日期1';
comment on column  af_request_applicantinfo.work_info_upd_time2 is '信息更新日期2';
comment on column  af_request_applicantinfo.work_info_upd_time3 is '信息更新日期3';
comment on column  af_request_applicantinfo.work_info_upd_time4 is '信息更新日期4';
comment on column  af_request_applicantinfo.work_info_upd_time5 is '信息更新日期5';
comment on column  af_request_applicantinfo.job1 is '职业1';
comment on column  af_request_applicantinfo.job2 is '职业2';
comment on column  af_request_applicantinfo.job3 is '职业3';
comment on column  af_request_applicantinfo.job4 is '职业4';
comment on column  af_request_applicantinfo.job5 is '职业5';
comment on column  af_request_applicantinfo.first_deposit_ym is '初缴月份';
comment on column  af_request_applicantinfo.pboc_gjj_info_upd_time is '信息更新日期';
comment on column  af_request_applicantinfo.join_socl_insu_dt is '参缴日期';
comment on column  af_request_applicantinfo.pboc_gjj_join_socl_insu_pl is '参保地';
comment on column  af_request_applicantinfo.monthly_deposit is '月缴存额';
comment on column  af_request_applicantinfo.pboc_gjj_pay_comp is '缴费单位';
comment on column  af_request_applicantinfo.pboc_gjj_pay_status is '缴费状态';
comment on column  af_request_applicantinfo.pay_ym is '缴至月份';
comment on column  af_request_applicantinfo.cumul_pay_months is '累计缴费月数';
comment on column  af_request_applicantinfo.cur_mpay_amt is '本月缴费金额';
comment on column  af_request_applicantinfo.pboc_yl_info_upd_time is '信息更新日期';
comment on column  af_request_applicantinfo.pboc_yl_join_socl_insu_pl is '参保地';
comment on column  af_request_applicantinfo.join_socl_insu_ym is '参保年月';
comment on column  af_request_applicantinfo.pause_pay_reason is '中断或终止缴费原因';
comment on column  af_request_applicantinfo.pboc_yl_pay_comp is '缴费单位';
comment on column  af_request_applicantinfo.pboc_yl_pay_status is '缴费状态';
comment on column  af_request_applicantinfo.person_pay_base is '个人缴费基数';
comment on column  af_request_applicantinfo.work_months is '参加工作月份';
comment on column  af_request_applicantinfo.query_org_crt_time is '创建时间';
comment on column  af_request_applicantinfo.query_org_1m_sum1 is '最近30天内的查询机构数_贷后管理';
comment on column  af_request_applicantinfo.query_org_1m_sum2 is '最近30天内的查询机构数_贷款审批';
comment on column  af_request_applicantinfo.query_org_1m_sum3 is '最近30天内的查询机构数_信用卡审批';
comment on column  af_request_applicantinfo.query_org_1m_sum4 is '最近30天内的查询机构数_本人查询';
comment on column  af_request_applicantinfo.query_org_1m_sum5 is '最近30天内的查询机构数_担保资格审查';
comment on column  af_request_applicantinfo.query_rec_2y_sum1 is '最近两年内的查询次数_贷后管理';
comment on column  af_request_applicantinfo.query_rec_2y_sum2 is '最近两年内的查询次数_贷款审批';
comment on column  af_request_applicantinfo.query_rec_2y_sum3 is '最近两年内的查询次数_信用卡审批';
comment on column  af_request_applicantinfo.query_rec_2y_sum4 is '最近两年内的查询次数_本人查询';
comment on column  af_request_applicantinfo.query_rec_2y_sum5 is '最近两年内的查询次数_担保资格审查';
comment on column  af_request_applicantinfo.in_6m_case_create_num is '最近6个月的立案数量（逻辑：申请日期-立案日期<=180天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_6m_case_open_num is '最近6个月的未结案数量（逻辑：申请日期-未结案日期<=180天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_12m_case_create_num is '最近12个月的立案数量（逻辑：申请日期-立案日期<=360天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_12m_case_open_num is '最近12个月的未结案数量（逻辑：申请日期-未结案日期<=360天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_36m_case_create_num is '最近36个月的立案数量（逻辑：申请日期-立案日期<=1080天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_36m_case_open_num is '最近36个月的未结案数量（逻辑：申请日期-未结案日期<=1080天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_6m_vehicle_mortgage_num is '最近6个月的车辆(不同的发动机号)抵押数量（逻辑：申请日期-信息更新日期<=180天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_12m_vehicle_mortgage_num is '最近12个月的车辆(不同的发动机号)抵押数量 （逻辑：申请日期-信息更新日期<=360天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.in_36m_vehicle_mortgage_num is '最近36个月的车辆(不同的发动机号)抵押（逻辑：申请日期-信息更新日期<=1080天，其中申请日期为条码前6位生成)';
comment on column  af_request_applicantinfo.reside_info_upd_time1 is '信息更新日期1';
comment on column  af_request_applicantinfo.reside_info_upd_time2 is '信息更新日期2';
comment on column  af_request_applicantinfo.reside_info_upd_time3 is '信息更新日期3';
comment on column  af_request_applicantinfo.reside_info_upd_time4 is '信息更新日期4';
comment on column  af_request_applicantinfo.reside_info_upd_time5 is '信息更新日期5';
comment on column  af_request_applicantinfo.reside_state1 is '居住状况1';
comment on column  af_request_applicantinfo.reside_state2 is '居住状况2';
comment on column  af_request_applicantinfo.reside_state3 is '居住状况3';
comment on column  af_request_applicantinfo.reside_state4 is '居住状况4';
comment on column  af_request_applicantinfo.reside_state5 is '居住状况5';
comment on column  af_request_applicantinfo.resident_addr1 is '居住地址1';
comment on column  af_request_applicantinfo.resident_addr2 is '居住地址2';
comment on column  af_request_applicantinfo.resident_addr3 is '居住地址3';
comment on column  af_request_applicantinfo.resident_addr4 is '居住地址4';
comment on column  af_request_applicantinfo.resident_addr5 is '居住地址5';
comment on column  af_request_applicantinfo.no_pd_card_loan_corp_number is '未销户贷记卡_贷款法人机构数/发卡法人机构数';
comment on column  af_request_applicantinfo.no_pd_card_loan_org_number is '未销户贷记卡_贷款机构数/发卡机构数';
comment on column  af_request_applicantinfo.no_pin_debit_card_acct_num is '未销户贷记卡_笔数/账户数';
comment on column  af_request_applicantinfo.outs_loans_loan_corp_number is '未结清贷款_贷款法人机构数/发卡法人机构数';
comment on column  af_request_applicantinfo.outstand_loans_acct_num is '未结清贷款_笔数/账户数';
comment on column  af_request_applicantinfo.outstand_loans_loan_org_number is '未结清贷款_贷款机构数/发卡机构数';
comment on column  af_request_applicantinfo.outstand_loans_6month_ave_pay is '未结清贷款_最近6个月平均应还款/最近6个月平均使用额度/最近6个月平均透支余额';
comment on column  af_request_applicantinfo.outstand_loans_contract_amt is '未结清贷款_合同金额/授信总额';
comment on column  af_request_applicantinfo.no_padc_6month_ave_pay is '未销户准贷记卡_最近6个月平均应还款/最近6个月平均使用额度/最近6个月平均透支余额';
comment on column  af_request_applicantinfo.no_padc_contract_amt is '未销户准贷记卡_合同金额/授信总额';
comment on column  af_request_applicantinfo.no_pin_debit_card_contract_amt is '未销户贷记卡_合同金额/授信总额';
comment on column  af_request_applicantinfo.no_pd_card_6month_ave_pay is '未销户贷记卡_最近6个月平均应还款/最近6个月平均使用额度/最近6个月平均透支余额';
comment on column  af_request_applicantinfo.vehicle_query_result is '查询结果';
comment on column  af_request_applicantinfo.vehicle_value is '车辆价值';
comment on column  af_request_applicantinfo.vehicle_age is '车龄';
comment on column  af_request_applicantinfo.req_app_num is '申请次数';
comment on column  af_request_applicantinfo.modify_time is '更新时间';


