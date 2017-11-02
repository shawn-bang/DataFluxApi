package api.service;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.dataflux.xsd.archserver.Row__out;

import api.biz.CCAFBiz;
import api.utils.PropUtil;
import api.utils.SessionFactory;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CCAFService {
	private static Logger log = Logger.getLogger(CCAFService.class);

	public void hxbRequestEntrance(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,sss");
		long starttime = System.currentTimeMillis();
		String requestTime = sdf.format(new Date());
		CCAFBiz bizHandler = new CCAFBiz();
		String reportContent = null;
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession(false);
		try {
			JSONObject requestJson = bizHandler.getInputJsonObject(request);
			JSONObject requestdescJson = requestJson.getJSONObject("requestdesc");
			JSONArray applicantsJsonArray = requestJson.getJSONArray("applicants");
			for (int i = 0; i < applicantsJsonArray.size(); i++) {
				JSONObject requestInfoJsonObject = applicantsJsonArray.getJSONObject(i);
				JSONObject applicantinfo = requestInfoJsonObject.getJSONObject("applicantinfo");
				String appId = applicantinfo.getString("app_id");

				// app_id is required
				if (appId == null || appId.equals("")) {
					throw new Exception("input error: app_id is null but it's required");
				}
				// insert or update request information
				bizHandler.saveRequestInfos(sqlSession, requestInfoJsonObject);

				// TODO call database callable process and analysis and calculate update result tables

				// query result information and generate json response report
				reportContent = bizHandler.getResponseJsonContent(sqlSession, appId);
			}

			this.report(response, "1",
					"request time:" + requestTime + " - report time:" + sdf.format(new Date()), reportContent);
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			try {
				this.report(response, "0", "request Hxb Service failure" + e.getMessage(), reportContent);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			sqlSession.close();
		}
	}

	public void ccAppAF(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,sss");
		long starttime = System.currentTimeMillis();
		String requestTime = sdf.format(new Date());
		CCAFBiz bizHandler = new CCAFBiz();
		String ccAppAfRptStr = null;
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession(false);
		try {
			JSONObject requestJson = bizHandler.getInputJsonObject(request);
			JSONObject identityJson = requestJson.getJSONObject("identity");
			JSONObject requestdescJson = requestJson.getJSONObject("requestdesc");
			JSONArray ccappJsonArr = requestJson.getJSONArray("applicants");
			Iterator<?> iterator = ccappJsonArr.iterator();
			while (iterator.hasNext()) {
				JSONObject ccAppJson = (JSONObject) iterator.next();
				Map<String, Object> ccAppMap = bizHandler.ccAppJsonToMap(ccAppJson);
				String shenqingjian_no = ccAppMap.get("shenqingjian_no").toString();
				bizHandler.shenqingjian_no_isnull(ccAppMap);
				bizHandler.saveCCAppInfo(sqlSession, ccAppMap);
				if (PropUtil.getPropValue("runningControl", "RUNComputing").equals("YES")) {
					Row__out[] dfouttab = bizHandler.getDataFluxMatchRst(ccAppMap, shenqingjian_no);
					bizHandler.saveMatchRst(sqlSession, shenqingjian_no, dfouttab);
					bizHandler.runAfCCAppRT(sqlSession, shenqingjian_no);
					ccAppAfRptStr = bizHandler.getCCAppAfRpt(shenqingjian_no);
				}
				Long endtime = System.currentTimeMillis();
				this.logRequest(identityJson, requestdescJson, requestTime, starttime, endtime,
						ccAppMap.get("shenqingjian_no").toString());
			}
			this.reportCCAppAf(response, "1",
					"request time:" + requestTime + " - report time:" + sdf.format(new Date()), ccAppAfRptStr);
		} catch (Exception e) {
//			sqlSession.rollback();
			e.printStackTrace();
			try {
				this.reportCCAppAf(response, "0", "get CCAppAf Service failure", ccAppAfRptStr);
				log.error(e.getLocalizedMessage());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			sqlSession.close();
		}
	}

	private void reportCCAppAf(HttpServletResponse response, String status, String message, String ccAppAfRptStr)
			throws Exception {
		JSONObject reportJson = new JSONObject();
		JSONObject responseJson = new JSONObject();
		responseJson.put("status", status);
		responseJson.put("message", message);
		reportJson.put("response", responseJson);
		if (PropUtil.getPropValue("runningControl", "ReturnCCAppAfRpt").equals("YES")) {
			if (ccAppAfRptStr != null && !ccAppAfRptStr.equals("") && ccAppAfRptStr.length() > 2) {
				reportJson.put("reports",ccAppAfRptStr);
			}
		}
		log.info(reportJson.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(reportJson.toString());
		out.flush();
		out.close();
	}

	private void report(HttpServletResponse response, String status, String message, String reportContent)
			throws Exception {
		JSONObject reportJson = new JSONObject();
		JSONObject responseJson = new JSONObject();
		responseJson.put("status", status);
		responseJson.put("message", message);
		reportJson.put("response", responseJson);
		reportJson.put("afreport",reportContent);
		log.info(reportJson.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(reportJson.toString());
		out.flush();
		out.close();
	}

	private void logRequest(JSONObject identityJson, JSONObject requestdescJson, String requestTime, long starttime,
			long endtime, String shenqingjian_no) {
		log.info(requestTime + ":" + identityJson.getString("accesspointname") + ":"
				+ identityJson.getString("servicetype") + ":" + requestdescJson.getString("trigmode") + ":"
				+ requestdescJson.getString("fromflowpoint") + ":" + requestdescJson.getString("reqappnum") + ":"
				+ shenqingjian_no + ":" + (endtime - starttime));
	}

}
