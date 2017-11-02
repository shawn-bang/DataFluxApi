package api.biz;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.rmi.RemoteException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.xml.rpc.ServiceException;

import api.utils.HxbDao;
import net.sf.json.JSONArray;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.dataflux.wsdl.archserver.DMServiceLocator;
import com.dataflux.xsd.archserver.Row__in;
import com.dataflux.xsd.archserver.Row__out;

import api.utils.GzcbCCAppImpl;
import api.utils.GzcbCCConfig;
import api.utils.PropUtil;
import net.sf.json.JSONObject;

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
			return JSONObject.fromObject(tmpstr);
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

	public void shenqingjian_no_isnull(Map<String, Object> inputCCAppMap) throws Exception {
		if (inputCCAppMap.get("shenqingjian_no").toString() == null
				|| inputCCAppMap.get("shenqingjian_no").toString().equals("")) {
			throw new Exception("input error: shenqingjian_no is null");
		}
	}

	public String getCCAppAfRpt(String shenqingjian_no) throws Exception {
		long starttime = System.currentTimeMillis();
		String rptStr = null;
		String reqURL = PropUtil.getPropValue("runningControl", "CCAPPAFURL")+ shenqingjian_no;
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
		CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
		HttpGet httpGet = new HttpGet(reqURL);
		try {
			HttpResponse httpResponse = closeableHttpClient.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			if (entity != null) {
				rptStr = EntityUtils.toString(entity, "UTF-8");
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				closeableHttpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
				log.error(e.getMessage(),e);
			}
		}
		Long endtime = System.currentTimeMillis();
		log.info(shenqingjian_no + ":CCAppAfRpt:" + (endtime - starttime));
		return rptStr;
	}

	public String getResponseJsonContent(SqlSession sqlSession, String appId) {
		HxbDao hxbDao = HxbDao.getInstance();
		List<Map<String, Object>> afsummaryList = hxbDao.selectAfsummary(sqlSession, appId);
		List<Map<String, Object>> afriskwarningList = hxbDao.selectAfriskwarning(sqlSession, appId);
		sqlSession.commit();
		JSONObject responseJson = new JSONObject();
		responseJson.put("app_id", appId);
		responseJson.put("afsummary", afsummaryList);
		responseJson.put("afriskwarning", afriskwarningList);
		return responseJson.toString();
	}

	/**
	 * 如果AF中不存在该申请号，直接存入；如果AF中已存在该申请号，只更新接口传入的字段(传入了什么字段就更新什么字段，即使传入的是空值也更新为空值)，用于支持接口只传入部分字段的情况
	 * 
	 * @param sqlSession
	 * @param inputCCAppMap
	 */
	public void saveCCAppInfo(SqlSession sqlSession, Map<String, Object> inputCCAppMap) {
		long starttime = System.currentTimeMillis();
		GzcbCCAppImpl ccappImpl = GzcbCCAppImpl.getInstance();
		String shenqingjian_no = (String) inputCCAppMap.get("shenqingjian_no");
		if (ccappImpl.isExistsCCApp(sqlSession, shenqingjian_no).equals("NO")) {
			ccappImpl.saveCCApp(sqlSession, inputCCAppMap);
			sqlSession.commit();
			this.saveCCSnaInput(sqlSession, inputCCAppMap, shenqingjian_no);
		} else {
			Map<String, Object> oldCCAppMap = ccappImpl.selectCCApp(sqlSession, shenqingjian_no);
			this.renewCCAppMapValue(oldCCAppMap, inputCCAppMap);
			ccappImpl.updateCCApp(sqlSession, oldCCAppMap);
			sqlSession.commit();
			this.saveCCSnaInput(sqlSession, oldCCAppMap, shenqingjian_no);
		}
		Long endtime = System.currentTimeMillis();
		log.info(shenqingjian_no + ":CCAppInfo :" + (endtime - starttime));
	}

	public void saveRequestInfos(SqlSession sqlSession, JSONObject requestInfoJsonObject) {
		long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		JSONObject applicantinfo = requestInfoJsonObject.getJSONObject("applicantinfo");
		JSONArray zmivsinfos = requestInfoJsonObject.getJSONArray("zmivsinfo");
		String appId = applicantinfo.getString("app_id");
		List<Map<String, Object>> requestInfosList = hxbDao.isExistsRequest(sqlSession, appId);
		if (requestInfosList == null || requestInfosList.size() == 0) {
			// TODO save requestInfo
		} else {
			// TODO update requestInfo
		}
		sqlSession.commit();
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":Hxb save requestInfo :" + (endtime - starttime));
	}

	private void renewCCAppMapValue(Map<String, Object> oldMap, Map<String, Object> inputCCAppMap) {
		Iterator<String> iterator = oldMap.keySet().iterator();
		String tmpkey = "";
		while (iterator.hasNext()) {
			tmpkey = iterator.next();
			if (inputCCAppMap.containsKey(tmpkey)) {
				oldMap.put(tmpkey, inputCCAppMap.get(tmpkey));
			}
		}
	}

	public Map<String, Object> ccAppJsonToMap(JSONObject ccAppJson) {
		HashMap<String, Object> ccAppMap = new HashMap<String, Object>();
		Iterator<String> iterator = ccAppJson.keySet().iterator();
		String tmpkey = null;
		while (iterator.hasNext()) {
			tmpkey = (String) iterator.next();
			if (tmpkey.equals("salary") || tmpkey.equals("historyid") || tmpkey.equals("loanaccountcount")
					|| tmpkey.equals("loanmonths") || tmpkey.equals("highestoverdueamountpermon")
					|| tmpkey.equals("loanmaxduration") || tmpkey.equals("credit_loanaccountcount")
					|| tmpkey.equals("credit_loanmonths") || tmpkey.equals("credit_highestoverdueamountpermon")
					|| tmpkey.equals("credit_loanmaxduration") || tmpkey.equals("credit_limit")
					|| tmpkey.equals("max_credit_limit_per_org") || tmpkey.equals("min_credit_limit_per_org")
					|| tmpkey.equals("used_credit_limit") || tmpkey.equals("last6_month_used_avg_amount")) {
				if (!ccAppJson.getString(tmpkey).equals("")) {
					ccAppMap.put(tmpkey, new java.math.BigDecimal(ccAppJson.getString(tmpkey)));
				}
			} else {
				String tmpvalue=ccAppJson.getString(tmpkey);
				if (tmpkey.equals("companyphone")||tmpkey.equals("homephone")){
					tmpvalue=tmpvalue.replaceAll("-", "");
				}
				ccAppMap.put(tmpkey,tmpvalue);
			}
		}
		return ccAppMap;
	}

	public void saveCCSnaInput(SqlSession sqlSession, Map<String, Object> lastestCCAppMap, String shenqingjian_no) {
		GzcbCCAppImpl ccappImpl = GzcbCCAppImpl.getInstance();
		ccappImpl.deleteCCSnaInputFromAppno(sqlSession, shenqingjian_no);
		sqlSession.commit();
		Iterator<String> it = GzcbCCConfig.getConf_CC_SNAINPUT_TOTYPE_MAP().keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String entityValue = lastestCCAppMap.get(key).toString().trim();
			if (!entityValue.equals("") && entityValue != null) {
				Map<String, String> ccSnaInputMap = new HashMap<String, String>();
				ccSnaInputMap.put("from_node", shenqingjian_no);
				ccSnaInputMap.put("to_node", entityValue);
				ccSnaInputMap.put("src_type", key);
				ccSnaInputMap.put("from_type", "APPNO");
				ccSnaInputMap.put("to_type", GzcbCCConfig.getConf_CC_SNAINPUT_TOTYPE_MAP().get(key));
				ccSnaInputMap.put("link_type", GzcbCCConfig.getConf_CC_SNAINPUT_LINKTYPE_MAP().get(key));
				ccSnaInputMap.put("cluster", GzcbCCConfig.getConf_CC_SNAINPUT_CLUSTER_MAP().get(key));
				ccappImpl.saveCCSnaInput(sqlSession, ccSnaInputMap);
			}
		}
		sqlSession.commit();
	}

	public void runAfCCAppRT(SqlSession sqlSession, String shenqingjian_no) {
		Long starttime = System.currentTimeMillis();
		GzcbCCAppImpl ccappImpl = GzcbCCAppImpl.getInstance();
		ccappImpl.callAfCCAppRT(sqlSession, shenqingjian_no);
		sqlSession.commit();
		Long endtime = System.currentTimeMillis();
		log.info(shenqingjian_no + ":runAfCCAppRT:" + (endtime - starttime));
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
