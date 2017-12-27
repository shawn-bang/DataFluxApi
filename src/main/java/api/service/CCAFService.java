package api.service;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.constants.AppReqNumEnum;
import api.exception.ApiInternalErrorException;
import api.exception.DataFluxServiceErrorException;
import api.exception.InputDataErrorException;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dataflux.Row__out;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import api.biz.CCAFBiz;
import api.utils.SessionFactory;

public class CCAFService {
	private static Logger log = Logger.getLogger(CCAFService.class);

    /**
     * API Entrancce
     * 接口入口函数: 根据reqappnum字段区分交互策略
     * @param request
     * @param response
     */
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
            String reqappnum;
            if (requestdescJson == null || (reqappnum = requestdescJson.getString("reqappnum")) == null) {
                throw new InputDataErrorException("InputDataErrorException: reqappnum is null, but it's required.");
            }
			JSONArray applicantsJsonArray = requestJson.getJSONArray("applicants");
			for (int i = 0; i < applicantsJsonArray.size(); i++) {
				JSONObject requestInfoJsonObject = applicantsJsonArray.getJSONObject(i);
				JSONObject applicantinfo = requestInfoJsonObject.getJSONObject("applicantinfo");
				String appId = applicantinfo.getString("app_id");

				// shawn:app_id is required
				if (appId == null || StringUtils.isBlank(appId)) {
					throw new InputDataErrorException("InputDataErrorException: app_id is null, but it's required.");
				}

				if (reqappnum.equals(AppReqNumEnum.AF1001.name())) {
                    // do nothing
                }else if (reqappnum.equals(AppReqNumEnum.AF1002.name())) {
                    // Transaction control
                    bizHandler.prepareModelInput(sqlSession, applicantinfo);
                    bizHandler.prepareSNAInput(sqlSession, applicantinfo);
                }else {
                    throw new InputDataErrorException("InputDataErrorException: " + reqappnum + "(reqappnum) is illegal.");
                }

				// insert or update request information
				bizHandler.saveRequestInfos(reqappnum, sqlSession, requestInfoJsonObject);
				// call dataflux for fuzzy matching
				Row__out[] dfouttab = bizHandler.getDataFluxMatchRst(reqappnum, applicantinfo, appId);
				// update dataflux result to database
				if (dfouttab == null || dfouttab.length == 0) {
                    throw new DataFluxServiceErrorException("DataFluxServiceErrorException: Dataflux Service Exception.");
                }
                bizHandler.saveMatchRst(sqlSession, appId, dfouttab);

                if (reqappnum.equals(AppReqNumEnum.AF1002.name())) {
                    // call database callable process to update the cid result data tables
                    bizHandler.runHandleCidProcedure(sqlSession, appId);
                }else {
                    // do nothing.
                }

				// call database callable process to analysis and calculate update result tables
				bizHandler.runHandleProcedures(sqlSession, appId);
				// query result information and generate json response report
				if (reportJsonObjects == null) {
					reportJsonObjects = new JSONArray();
				}
				reportJsonObjects.add(bizHandler.getResponseJsonContent(sqlSession, appId, reqappnum));

				Long endtime = System.currentTimeMillis();
				this.logRequest(requestdescJson, requestTime, starttime, endtime, appId);
			}

			this.report(response, "1", "request time:" + requestTime + " - report time:" + sdf.format(new Date()), reportJsonObjects);
		}catch (ApiInternalErrorException e) {
			sqlSession.rollback();
			try {
				this.report(response, "0", e.getMessage(), reportJsonObjects);
			} catch (Exception ee) {
				ee.printStackTrace();
				log.error("HxbDataFluxApi Service down!");
			}
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			try {
				this.report(response, "0", "ApiInternalErrorException: Request Hxb Service failure.", reportJsonObjects);
			} catch (Exception e1) {
				e1.printStackTrace();
				log.error("HxbDataFluxApi Service down!");
			}
		}finally {
			sqlSession.close();
		}
	}

	private void report(HttpServletResponse response, String status, String message, JSONArray reportJsonObjects) throws Exception {
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

    /**
     * API Entrancce Test
     * 查询指定进件, 组织JSON请求报文(仅供测试使用)
     * @param request
     * @param response
     */
    public void GetJsonByAppId(HttpServletRequest request, HttpServletResponse response) {
        SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession(false);
        CCAFBiz bizHandler = new CCAFBiz();
        try {
            JSONObject requestJson = bizHandler.getInputJsonObject(request);
            String appId = requestJson.getString("app_id");
            String reqNum = requestJson.getString("reqappnum");
            // shawn:app_id is required
            if (appId == null || StringUtils.isBlank(appId) || reqNum == null || StringUtils.isBlank(reqNum)) {
                throw new InputDataErrorException("InputDataErrorException: app_id or reqappnum is null, but it's required.");
            }

            String resultJson = bizHandler.queryAppinfoByAppId(sqlSession, appId, AppReqNumEnum.valueOf(reqNum));
            reportForTest(response, resultJson);
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject responseJson = new JSONObject();
            responseJson.put("message", e.getMessage());
            try {
                reportForTest(response, responseJson.toJSONString());
            } catch (Exception e1) {
                e1.printStackTrace();
                log.error("HxbDataFluxApi Test Service down!");
            }
        }finally {
            sqlSession.close();
        }
    }

    /**
     * API Entrancce Test
     * @param response
     * @param content
     * @throws Exception
     */
    private void reportForTest(HttpServletResponse response, String content) throws Exception {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(content);
        out.flush();
        out.close();
    }

}
