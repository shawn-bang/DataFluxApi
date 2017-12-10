package api.biz;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.xml.rpc.ServiceException;

import api.constants.DataFluxEntityTypeEnum;
import api.utils.HxbDao;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dataflux.DMService_ServiceLocator;
import com.dataflux.Row__in;
import com.dataflux.Row__out;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

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
			log.info("getInputJson:" + buffer.toString());
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
		List<Object> afsummaryList = hxbDao.selectAfsummary(sqlSession, appId);
		List<Object> afriskwarningList = hxbDao.selectAfriskwarning(sqlSession, appId);

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
		responseJson.put("afsummary", new JSONArray(afsummaryList));
		responseJson.put("afriskwarning", new JSONArray(afriskwarningList));
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
			applicantinfo.put("req_app_num", 2);
			applicantinfo.put("modify_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
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
	 * 调用数据库可执行对象生成指定app_id对应的模糊匹配字段需要的cid
	 * @param sqlSession
	 * @param appId
	 */
	public void runHandleCidProcedure(SqlSession sqlSession, String appId) {
		Long starttime = System.currentTimeMillis();
		HxbDao hxbDao = HxbDao.getInstance();
		hxbDao.runHandleCidProcedure(sqlSession, appId);
		sqlSession.commit();
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":runHandleCidProcedure:" + (endtime - starttime));
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
			// must be lowercase
			String columnName = map.get("SRC_TYPE").toString().toLowerCase();
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

	/**
	 * 保存dataflux分词结果数据
	 * @param sqlSession
	 * @param appId
	 * @param dfouttab
	 */
	public void saveMatchRst(SqlSession sqlSession, String appId, Row__out[] dfouttab) {
		Long starttime = System.currentTimeMillis();
        List<Map<String, Object>> addMCInfos = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> cmpMCInfos = new ArrayList<Map<String, Object>>();
		
		if (dfouttab != null && dfouttab.length > 0) {
            for (Row__out aDfouttab : dfouttab) {
                if (aDfouttab.getEntity_type().equals(DataFluxEntityTypeEnum.ADD.name())) {
                    HashMap<String, Object> addmp = new HashMap<String, Object>();
                    addmp.put("app_id", aDfouttab.getApp_id());
                    addmp.put("cid", aDfouttab.getCid());
                    addmp.put("data_source", aDfouttab.getData_source());
                    addmp.put("data_type", aDfouttab.getData_type());
                    addmp.put("data_value", aDfouttab.getData_value());
                    addmp.put("districtmc", aDfouttab.getDistrictMC());
                    addmp.put("townmc", aDfouttab.getTownMC());
                    addmp.put("streetmc", aDfouttab.getStreetMC());
                    addmp.put("blockmc", aDfouttab.getBlockMC());
                    addmp.put("buildingmc", aDfouttab.getBuildingMC());
                    addmp.put("unitmc", aDfouttab.getUnitMC());
                    addmp.put("floormc", aDfouttab.getFloorMC());
                    addmp.put("roommc", aDfouttab.getRoomMC());
                    addmp.put("addinfomc", aDfouttab.getAddInfoMC());
                    addmp.put("city", aDfouttab.getCity());
                    addMCInfos.add(addmp);
                } else {
                    // Do nothing.
                }
                if (aDfouttab.getEntity_type().equals(DataFluxEntityTypeEnum.CMP.name())) {
                    HashMap<String, Object> cmpmp = new HashMap<String, Object>();
                    cmpmp.put("app_id", aDfouttab.getApp_id());
                    cmpmp.put("cid", aDfouttab.getCid());
                    cmpmp.put("data_type", aDfouttab.getData_type());
                    cmpmp.put("data_value", aDfouttab.getData_value());
                    cmpmp.put("namemc", aDfouttab.getNameMC());
                    cmpmp.put("legalformmc", aDfouttab.getLegalFormMC());
                    cmpmp.put("sitemc", aDfouttab.getSiteMC());
                    cmpmp.put("addmc", aDfouttab.getAddMC());
                    cmpMCInfos.add(cmpmp);
                } else {
                    // Do nothing.
                }
            }

            HxbDao hxbDao = HxbDao.getInstance();
			hxbDao.deleteAddMCInfosByAppid(sqlSession, appId);
			hxbDao.deleteAddMCHisInfosByAppid(sqlSession, appId);
			hxbDao.deleteAddMCExtHisInfosByAppid(sqlSession, appId);
			hxbDao.deleteCmpMCInfosByAppid(sqlSession, appId);
			hxbDao.deleteCmpMCHisInfosByAppid(sqlSession, appId);
            if (addMCInfos.size() > 0){
                hxbDao.saveAddMCInfos(sqlSession, addMCInfos);
            }
            if (cmpMCInfos.size() > 0){
                hxbDao.saveCmpMCInfos(sqlSession, cmpMCInfos);
            }
			sqlSession.commit();
		}
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":saveMatchCode:" + (endtime - starttime));
	}

	/**
	 * 封装模糊匹配需要的字段数据信息，请求dataflux server webservice api，获取分词结果
	 * @param applicantinfo
	 * @param appId
	 * @return
	 * @throws RemoteException
	 * @throws ServiceException
	 */
	public Row__out[] getDataFluxMatchRst(Map<String, Object> applicantinfo, String appId)
			throws RemoteException, ServiceException {
		Long starttime = System.currentTimeMillis();
		ArrayList<Row__in> list = new ArrayList<Row__in>();
		String tmpcmpvalue = null;

		String c1_coadd = applicantinfo.get("c1_coadd1").toString() + applicantinfo.get("c1_coadd2").toString() + applicantinfo.get("c1_coadd3").toString() + applicantinfo.get("c1_coadd4").toString();
		tmpcmpvalue = c1_coadd.trim();
		if (StringUtils.isNotBlank(tmpcmpvalue)) {
			Row__in row = new Row__in();
			row.setData_source("APP");
			row.setData_type("c1_coadd");
			row.setData_value(tmpcmpvalue);
			row.setEntity_type("ADD");
			row.setApp_id(appId);
			list.add(row);
		}

        String c1_hmadd = applicantinfo.get("c1_hmadd1").toString() + applicantinfo.get("c1_hmadd2").toString() + applicantinfo.get("c1_hmadd3").toString() + applicantinfo.get("c1_hmadd4").toString();
        tmpcmpvalue = c1_hmadd.trim();
		if (StringUtils.isNotBlank(tmpcmpvalue)) {
            Row__in row = new Row__in();
            row.setData_source("PBOC");
            row.setData_type("c1_coadd");
            row.setData_value(tmpcmpvalue);
            row.setEntity_type("ADD");
            row.setApp_id(appId);
            list.add(row);
        }

		if (StringUtils.isNotBlank(applicantinfo.get("c1_coname").toString())) {
            Row__in row = new Row__in();
            row.setData_source("APP");
            row.setData_type("c1_coname");
            row.setData_value(tmpcmpvalue);
            row.setEntity_type("CMP");
            row.setApp_id(appId);
            list.add(row);
        }

        // TODO 剩余模糊匹配字段的输入代码！

		Row__in[] intab = new Row__in[list.size()];
		for (int i = 0; i < intab.length; i++) {
			intab[i] = list.get(i);
		}

		DMService_ServiceLocator dsl = new DMService_ServiceLocator();
		Row__out[] dfouttab = dsl.getDMService().datasvc_hxbcb__rt__matchDdf_in(intab);
		Long endtime = System.currentTimeMillis();
		log.info(appId + ":runDataFlux:" + (endtime - starttime));
		return dfouttab;
	}

}
