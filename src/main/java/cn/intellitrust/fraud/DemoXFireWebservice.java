package cn.intellitrust.fraud;

import api.dto.Out;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

/**
 * Desc    : CXF Demo WebService
 * @author : shawn
 * @date   : 2018/4/13 17:21
 */
@WebService
public interface DemoXFireWebservice {
	/**
	 * Desc    : checkRulesRealTime
	 * @author : shawn
	 * @date   : 2018/4/13 17:24
	 * @param appId
	 * @param requestTimeStamp
	 * @param esbMsgID
	 * @return : Out
	 */
	@WebMethod
	Out checkRulesRealTime(@WebParam(name = "AppId") String appId, @WebParam(name = "RequestTimeStamp") String requestTimeStamp, @WebParam(name = "EsbMsgID") String esbMsgID);

}
