package api.service;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dataflux.Row__out;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import api.biz.CCAFBiz;
import api.utils.SessionFactory;

public class CCAFService {
	private static Logger log = Logger.getLogger(CCAFService.class);

	public void hxbRequestEntrance(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,sss");
		long starttime = System.currentTimeMillis();
		String requestTime = sdf.format(new Date());
		CCAFBiz bizHandler = new CCAFBiz();
		JSONArray reportJsonObjects = null;
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession(false);
		try {
			JSONObject requestJson = bizHandler.getInputJsonObject(request);
			JSONObject requestdescJson = requestJson.getJSONObject("requestdesc");
			JSONArray applicantsJsonArray = requestJson.getJSONArray("applicants");
			for (int i = 0; i < applicantsJsonArray.size(); i++) {
				JSONObject requestInfoJsonObject = applicantsJsonArray.getJSONObject(i);
				JSONObject applicantinfo = requestInfoJsonObject.getJSONObject("applicantinfo");
				String appId = applicantinfo.getString("app_id");

				// shawn:app_id is required
				if (appId == null || appId.equals("")) {
					throw new Exception("input error: app_id is null but it's required");
				}
				// Transaction control
				bizHandler.prepareModelInput(sqlSession, applicantinfo);
				bizHandler.prepareSNAInput(sqlSession, applicantinfo);
				// insert or update request information
				bizHandler.saveRequestInfos(sqlSession, requestInfoJsonObject);
				// do we need to recall dataflux when the same appid second request?
				// call dataflux for fuzzy matching
				Row__out[] dfouttab = bizHandler.getDataFluxMatchRst(applicantinfo, appId);
				// update dataflux result to database
                bizHandler.saveMatchRst(sqlSession, appId, dfouttab);
                // TODO call database callable process to update the class_id info

				// call database callable process to analysis and calculate update result tables
				bizHandler.runHandleProcedures(sqlSession, appId);
				// query result information and generate json response report
				if (reportJsonObjects == null) {
					reportJsonObjects = new JSONArray();
				}
				reportJsonObjects.add(bizHandler.getResponseJsonContent(sqlSession, appId));

				Long endtime = System.currentTimeMillis();
				this.logRequest(requestdescJson, requestTime, starttime, endtime, appId);
			}

			this.report(response, "1", "request time:" + requestTime + " - report time:" + sdf.format(new Date()), reportJsonObjects);
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			try {
				this.report(response, "0", "request Hxb Service failure" + e.getMessage(), reportJsonObjects);
			} catch (Exception e1) {
				e1.printStackTrace();
				log.error("HxbDataFluxApi Service down!");
			}
		}finally {
			sqlSession.close();
		}
	}

	private void report(HttpServletResponse response, String status, String message, JSONArray reportJsonObjects)
			throws Exception {
		JSONObject reportJson = new JSONObject();
		JSONObject responseJson = new JSONObject();
		responseJson.put("status", status);
		responseJson.put("message", message);
		reportJson.put("response", responseJson);
		reportJson.put("afreport", reportJsonObjects);
		log.info(reportJson.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(reportJson.toString());
		out.flush();
		out.close();
	}

	private void logRequest(JSONObject requestdescJson, String requestTime, long starttime, long endtime, String appId) {
		log.info(requestdescJson.getString("trigmode") + ":"
				+ requestdescJson.getString("fromflowpoint") + ":" + requestdescJson.getString("reqappnum") + ":"
				+ appId + ":" + (endtime - starttime));
	}

}
