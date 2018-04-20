package cn.intellitrust.fraud.impl;


import api.dto.Out;
import cn.intellitrust.fraud.DemoXFireWebservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

/**
 * Desc    : CXF Demo WebService Implement
 * @author : shawn
 * @date   : 2018/4/13 17:12
 */
@WebService
public class DemoXFireWebserviceImpl implements DemoXFireWebservice {

	@WebMethod
	public Out checkRulesRealTime(@WebParam(name = "AppId") String appId, @WebParam(name = "RequestTimeStamp") String requestTimeStamp, @WebParam(name = "EsbMsgID") String esbMsgID) {
		Out out = new Out();
		out.setApppId("Br-A16433011111");
		out.setCheckResult("501");
		out.setDesc("BYFraud");
		out.setResponseTimeStamp("2018-03-30 10:45:27.616");
		out.setStatus("1");
		return out;
	}

}
