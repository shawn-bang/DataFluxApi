package api.biz;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.rmi.RemoteException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.xml.rpc.ServiceException;

import api.utils.HxbDao;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.dataflux.wsdl.archserver.DMServiceLocator;
import com.dataflux.xsd.archserver.Row__in;
import com.dataflux.xsd.archserver.Row__out;

import api.utils.GzcbCCAppImpl;

public class CCAFBiz {

	private static Logger log = Logger.getLogger(CCAFBiz.class);

	public JSONObject getInputJsonObject(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		StringBuilder buffer = new StringBuilder();
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			log.debug("getInputJson:" + buffer.toString());
			String tmpstr=buffer.toString();
			if (!tmpstr.substring(0, 1).equals("{")){
					tmpstr=tmpstr.substring(1);
					log.debug("remove first char rst: "+tmpstr);
				}
			return JSON.parseObject(tmpstr);
		} catch (Exception exception) {
			log.error("ERROR:getInputJson failed", exception);
			throw exception;
		} finally {
			if (null != reader) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 拼装返回报文需要的JSONObject
	 * @param sqlSession
	 * @param appId
	 * @return
	 */
	public JSONObject getResponseJsonContent(SqlSession sqlSession, String appId) {
		HxbDao hxbDao = HxbDao.getInstance();
		List<Map<String, Object>> afsummaryList = hxbDao.selectAfsummary(sqlSession, appId);
		List<Map<String, Object>> afriskwarningList = hxbDao.selectAfriskwarning(sqlSession, appId);

		// default settings
		if (afsummaryList.size() == 0){
			Map<String, Object> map = new HashMap();
			map.put("type", "");
			map.put("value", "");
			map.put("remarks", "");
			afsummaryList.add(map);
		}
		if (afriskwarningList.size() == 0) {
			Map<String, Object> map = new HashMap();
			map.put("riskno", "");
			map.put("risktype", "");
			map.put("riskcategory", "");
			map.put("riskdesc", "");
			afriskwarningList.add(map);
		}

		sqlSession.commit();
		JSONObject responseJson = new JSONObject();
		responseJson.put("app_id", appId);
		responseJson.put("afsummary", JSON.parseArray(JSON.toJSONString(afsummaryList)));
		responseJson.put("afriskwarning", JSON.parseArray(JSON.toJSONString(afriskwarningList)));
		return responseJson;
	}

	/**
	 * 如果AF中不存在该申请号，直接存入；如果AF中已存在该申请号，只更新接口传入的字段(传入了什么字段就更新什么字段，即使传入的是空值也更新为空值)，用于支持接口只传入部分字段的情况
	 *
	 * @param sqlSession
	 * @param requestInfoJsonObject
	 */
	public void saveRequestInfos(SqlSession sqlSession, JSONObject requestInfoJsonObject) {
		long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		JSONObject applicantinfo = requestInfoJsonObject.getJSONObject("applicantinfo");
		JSONArray zmivsinfos = requestInfoJsonObject.getJSONArray("zmivsinfo");
		String appId = applicantinfo.getString("app_id");
		int count = hxbDao.isExistsRequest(sqlSession, appId);
		if (count <= 0) {
			hxbDao.saveApplicantinfo(sqlSession, applicantinfo);
			for (int i = 0; i < zmivsinfos.size(); i++) {
				JSONObject zmivsinfo = zmivsinfos.getJSONObject(i);
				zmivsinfo.put("app_id", appId);
				hxbDao.saveZmivsinfo(sqlSession, zmivsinfo);
			}
		} else {
			// clear old result data
			hxbDao.deleteAfsummaryByAppid(sqlSession, appId);
			hxbDao.deleteAfriskwarningByAppid(sqlSession, appId);
			// we have already confirmed
			hxbDao.updateApplicantinfo(sqlSession, applicantinfo);
			hxbDao.deleteZmivsinfoByAppid(sqlSession, appId);
			for (int i = 0; i < zmivsinfos.size(); i++) {
				JSONObject zmivsinfo = zmivsinfos.getJSONObject(i);
				zmivsinfo.put("app_id", appId);
				hxbDao.saveZmivsinfo(sqlSession, zmivsinfo);
			}
		}
		sqlSession.commit();
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":Hxb save requestInfo :" + (endtime - starttime));
	}

	/**
	 * 调用数据库可执行对象进行业务规则相关逻辑运算并更新结果表数据
	 * @param sqlSession
	 * @param appId
	 */
	public void runHandleProcedures(SqlSession sqlSession, String appId) {
		Long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		hxbDao.runHandleProcedures(sqlSession, appId);
		sqlSession.commit();
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":runHandleProcedures:" + (endtime - starttime));
	}

	/**
	 * 准备模型应用数据
	 * @param sqlSession
	 * @param applicantinfo
	 */
	public void prepareModelInput(SqlSession sqlSession, JSONObject applicantinfo) {
		Long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		String appId = applicantinfo.getString("app_id");
		hxbDao.deleteModelVarInputByAppid(sqlSession, appId);
		List<Map<String, Object>> params = hxbDao.selectModelInputParams(sqlSession);
		if (params == null || params.size() == 0) {
			log.warn(appId + " : haven't found any ModelInputParams rows.");
			throw new RuntimeException(appId + " : haven't found any ModelInputParams rows.");
		}
		List<Map<String, Object>> values = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> map : params) {
			// must be lowercase
			String columnName = map.get("MODEL_VAR").toString().toLowerCase();
			Map<String, Object> value = new HashMap();
			value.put("app_id", appId);
			value.put("var_name", columnName);
			value.put("var_value", applicantinfo.getString(columnName));
			values.add(value);
		}
		hxbDao.saveModelVarInput(sqlSession, values);
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":prepareModelInput:" + (endtime - starttime));
	}

	/**
	 * 准备SNA应用数据
	 * @param sqlSession
	 * @param applicantinfo
	 */
	public void prepareSNAInput(SqlSession sqlSession, JSONObject applicantinfo) {
		Long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		String appId = applicantinfo.getString("app_id");
		hxbDao.deleteSNAInputByAppid(sqlSession, appId);
		List<Map<String, Object>> params = hxbDao.selectSNAInputConf(sqlSession);
		if (params == null || params.size() == 0) {
			log.warn(appId + " : haven't found any ModelInputParams rows.");
			throw new RuntimeException(appId + " : haven't found any SNAInputParams rows.");
		}
		for (Map<String, Object> map : params) {
			String columnName = map.get("SRC_TYPE").toString();
			String snaColumnName = map.get("TO_TYPE").toString();
			String link_type = map.get("LINK_TYPE").toString();
			String ifcluster = map.get("IFCLUSTER").toString();
			Map<String, Object> value = new HashMap();
			value.put("from_node", appId);
			value.put("to_node", applicantinfo.getString(columnName));
			value.put("src_type", columnName);
			value.put("from_type", "app_id");
			value.put("to_type", snaColumnName);
			value.put("link_type", link_type);
			value.put("ifcluster", ifcluster);
			hxbDao.saveSNAInput(sqlSession, value);
		}
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":prepareSNAInput:" + (endtime - starttime));
	}

	public void saveMatchRst(SqlSession sqlSession, String shenqingjian_no, Row__out[] dfouttab) {
		Long starttime = System.currentTimeMillis();
		Map<String, Map<String, String>> appAddTab = new HashMap<String, Map<String, String>>();
		Map<String, Map<String, String>> appCmpTab = new HashMap<String, Map<String, String>>();
		ArrayList<Map<String, Object>> mtRstTab = new ArrayList<Map<String, Object>>();

		String s_company=null;
		String s_namemc=null;
		String s_legalformmc=null;
		String s_sitemc=null;
		String s_addinfomc=null;
		String s_shenqingjian_no=null;
		
		
		if (dfouttab != null && dfouttab.length > 0) {
			for (int i = 0; i < dfouttab.length; i++) {

				HashMap<String, Object> mtrstmp = new HashMap<String, Object>();
				mtrstmp.put("shenqingjian_no", shenqingjian_no);
				mtrstmp.put("APP_entity_type", dfouttab[i].getAPP_entity_type());
				mtrstmp.put("APP_data_type", dfouttab[i].getAPP_data_type());
				mtrstmp.put("APP_data_value", dfouttab[i].getAPP_data_value());
				mtrstmp.put("APP_data_source", dfouttab[i].getAPP_data_source());
				mtrstmp.put("EXT_entity_type", dfouttab[i].getEXT_entity_type());
				mtrstmp.put("EXT_data_type", dfouttab[i].getEXT_data_type());
				mtrstmp.put("EXT_data_value", dfouttab[i].getEXT_data_value());
				mtrstmp.put("EXT_data_source", dfouttab[i].getEXT_data_source());
				mtrstmp.put("simulation_parsing", new java.math.BigDecimal(dfouttab[i].getSimulation_parsing()));
				mtrstmp.put("simulation_char", new java.math.BigDecimal(dfouttab[i].getSimulation_char()));
				mtrstmp.put("simulation_cluster", new java.math.BigDecimal(dfouttab[i].getSimulation_cluster()));
				mtrstmp.put("ext_label", dfouttab[i].getExt_label());
				mtRstTab.add(mtrstmp);

				if (dfouttab[i].getAPP_entity_type().equals("ADD")) {
					HashMap<String, String> addmp = new HashMap<String, String>();
					addmp.put("shenqingjian_no", dfouttab[i].getAPP_shenqingjian_no());
					addmp.put("data_type", dfouttab[i].getAPP_data_type());
					addmp.put("data_value", dfouttab[i].getAPP_data_value());
					addmp.put("DistrictMC", dfouttab[i].getAPP_DistrictMC());
					addmp.put("TownMC", dfouttab[i].getAPP_TownMC());
					addmp.put("StreetMC", dfouttab[i].getAPP_StreetMC());
					addmp.put("BlockMC", dfouttab[i].getAPP_BlockMC());
					addmp.put("BuildingMC", dfouttab[i].getAPP_BuildingMC());
					addmp.put("UnitMC", dfouttab[i].getAPP_UnitMC());
					addmp.put("FloorMC", dfouttab[i].getAPP_FloorMC());
					addmp.put("RoomMC", dfouttab[i].getAPP_RoomMC());
					addmp.put("AddInfo", dfouttab[i].getAPP_AddInfo());
					appAddTab.put(dfouttab[i].getAPP_data_type(), addmp);
				}
				if (dfouttab[i].getAPP_entity_type().equals("CMP")) {
					HashMap<String, String> cmpmp = new HashMap<String, String>();
					cmpmp.put("shenqingjian_no", dfouttab[i].getAPP_shenqingjian_no());
					cmpmp.put("data_type", dfouttab[i].getAPP_data_type());
					cmpmp.put("data_value", dfouttab[i].getAPP_data_value());
					cmpmp.put("NameMC", dfouttab[i].getAPP_NameMC());
					cmpmp.put("LegalFormMC", dfouttab[i].getAPP_LegalFormMC());
					cmpmp.put("SiteMC", dfouttab[i].getAPP_SiteMC());
					cmpmp.put("AddMC", dfouttab[i].getAPP_AddMC());
					appCmpTab.put(dfouttab[i].getAPP_data_type(), cmpmp);
					
					if (dfouttab[i].getAPP_data_type().trim().equals("company")){
						s_shenqingjian_no=dfouttab[i].getAPP_shenqingjian_no();
						s_company=dfouttab[i].getAPP_data_value();
						s_namemc=dfouttab[i].getAPP_NameMC();
						s_legalformmc= dfouttab[i].getAPP_LegalFormMC();
						s_sitemc=dfouttab[i].getAPP_SiteMC();
						s_addinfomc=dfouttab[i].getAPP_AddMC();
					}
				}
			}

			GzcbCCAppImpl ccappImpl = GzcbCCAppImpl.getInstance();
			ccappImpl.deleteCCAppAddFromAppno(sqlSession, shenqingjian_no);
			sqlSession.commit();
			Iterator<String> addit = appAddTab.keySet().iterator();
			while (addit.hasNext()) {
				ccappImpl.saveCCAppAdd(sqlSession, appAddTab.get(addit.next()));
				sqlSession.commit();
			}

			ccappImpl.deleteCCAppCmpFromAppno(sqlSession, shenqingjian_no);
			sqlSession.commit();
			Iterator<String> cmpit = appCmpTab.keySet().iterator();
			while (cmpit.hasNext()) {
				ccappImpl.saveCCAppCmp(sqlSession, appCmpTab.get(cmpit.next()));
				sqlSession.commit();
			}

			ccappImpl.deleteMatchrstbyAppno(sqlSession, shenqingjian_no);
			sqlSession.commit();
			Iterator<Map<String, Object>> mtrstit = mtRstTab.iterator();
			while (mtrstit.hasNext()) {
				ccappImpl.saveCCAppMatchRst(sqlSession, mtrstit.next());
				sqlSession.commit();
			}
			
			Map<String,String> paraCompany =new HashMap();
			paraCompany.put("company", s_company);
			paraCompany.put("namemc", s_namemc);
			paraCompany.put("legalformmc", s_legalformmc);
			paraCompany.put("sitemc", s_sitemc);
			paraCompany.put("addinfomc", s_addinfomc);
			
			String s2_EXT_data_value=null;
			String s2_ext_label=null;
			Map<String,String> rstCompanyKequn =ccappImpl.selectMdkKequn(sqlSession, paraCompany);
			if (rstCompanyKequn !=null && rstCompanyKequn.size()>0){
				s2_EXT_data_value=rstCompanyKequn.get("company");
				s2_ext_label=rstCompanyKequn.get("kequn");
			}
			
			Map<String,String> paraMdkKequnMap =new HashMap();
			paraMdkKequnMap.put("shenqingjian_no", shenqingjian_no);
			paraMdkKequnMap.put("APP_data_value", s_company);
			paraMdkKequnMap.put("EXT_data_value", s2_EXT_data_value);
			paraMdkKequnMap.put("ext_label", s2_ext_label);				
			ccappImpl.insertMdkKequn(sqlSession, paraMdkKequnMap);
			sqlSession.commit();
		}
		Long endtime = System.currentTimeMillis();
		log.info(shenqingjian_no + ":saveMatchCode:" + (endtime - starttime));
	}

	private boolean checkCmpValue(String cmpvalue) {
		boolean flag = false;
//		if (cmpvalue != null && !cmpvalue.equals("") && cmpvalue.length() > 3) {
//			flag = true;
//		}
		if (cmpvalue != null && !cmpvalue.equals("") && cmpvalue.length() > 0) {
			flag = true;
		}
		return flag;
	}

	private boolean checkAddValue(String addvalue) {
		boolean flag = false;
//		if (addvalue != null && !addvalue.equals("") && addvalue.length() > 5) {
//			flag = true;
//		}
		if (addvalue != null && !addvalue.equals("") && addvalue.length() > 0) {
			flag = true;
		}
		return flag;
	}

	public Row__out[] getDataFluxMatchRst(Map<String, Object> ccAppMap, String shenqingjian_no)
			throws RemoteException, ServiceException {
		Long starttime = System.currentTimeMillis();
		ArrayList<Row__in> list = new ArrayList<Row__in>();
		String tmpcmpvalue = null;
		String tmpaddvalue = null;

		tmpcmpvalue = ccAppMap.get("company").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("company");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("std_cm_pnm").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("GJJ");
			row.setData_type("std_cm_pnm");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("pbc_com_name1").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_com_name1");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("pbc_com_name2").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_com_name2");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("pbc_com_name3").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_com_name3");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("pbc_com_name4").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_com_name4");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpcmpvalue = ccAppMap.get("pbc_com_name5").toString().trim();
		if (this.checkCmpValue(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_com_name5");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("homeadd1").toString().trim() + ccAppMap.get("homeadd2").toString().trim()
				+ ccAppMap.get("homeadd3").toString().trim() + ccAppMap.get("homeadd4").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("homeadd");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("companyadd1").toString().trim() + ccAppMap.get("companyadd2").toString().trim()
				+ ccAppMap.get("companyadd3").toString().trim() + ccAppMap.get("companyadd4").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("companyadd");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("comphonequeryresult114").toString().trim()
				+ ccAppMap.get("comphonequery114").toString().trim()
				+ ccAppMap.get("comphonecheck114").toString().trim() + ccAppMap.get("companyinfo114").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("hujiadd");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("post_address").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("post_address");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("registere_address").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("registere_address");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_homeaddress_value1").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_homeaddress_value1");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_homeaddress_value2").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_homeaddress_value2");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_homeaddress_value3").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_homeaddress_value3");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_homeaddress_value4").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_homeaddress_value4");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_homeaddress_value5").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_homeaddress_value5");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_comaddress_value1").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_comaddress_value1");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_comaddress_value2").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_comaddress_value2");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_comaddress_value3").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_comaddress_value3");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_comaddress_value4").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_comaddress_value4");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		tmpaddvalue = ccAppMap.get("pbc_comaddress_value5").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("pbc_comaddress_value5");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}
		
		tmpaddvalue = ccAppMap.get("tongxun_add").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("tongxun_add");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("ADD");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}
		
		tmpaddvalue = ccAppMap.get("companyname").toString().trim();
		if (this.checkAddValue(tmpaddvalue)) {
			Row__in row = new Row__in();
			row.setData_source("PBC");
			row.setData_type("companyname");
			row.setData_value(tmpaddvalue);
			row.setEntity_type("CMP");
			row.setShenqingjian_no(shenqingjian_no);
			list.add(row);
		}

		Row__in[] intab = new Row__in[list.size()];
		for (int i = 0; i < intab.length; i++) {
			intab[i] = list.get(i);
		}

		DMServiceLocator dsl = new DMServiceLocator();
		Row__out[] dfouttab = dsl.getDMService().datasvc_ccapp__rt__matchDdf_in(intab);
		Long endtime = System.currentTimeMillis();
		log.info(shenqingjian_no + ":runDataFlux:" + (endtime - starttime));
		return dfouttab;
	}

}
