package api.utils;

import java.util.List;
import java.util.Map;

public interface HxbMapper {
	int isExistsRequest(String appId);
	void saveApplicantinfo(Map<String, Object> map);
	void updateApplicantinfo(Map<String, Object> map);
	void saveZmivsinfo(Map<String, Object> map);
	void deleteZmivsinfoByAppid(String appId);
	void callHandleCidProcedure(String appId);
	void callHandleProcedures(String appId);
	List<Map<String, Object>> selectModelInputParams();
	void saveModelVarInput(List<Map<String, Object>> list);
	void deleteModelVarInputByAppid(String appId);
	List<Map<String, Object>> selectSNAInputConf();
	void saveSNAInput(Map<String, Object> map);
	void deleteSNAInputByAppid(String appId);
	List<Object> selectAfsummary(String appId);
	List<Object> selectAfriskwarning(String appId);
    List<Object> selectAfriskwarningForBlack(String appId);
	void deleteAfsummaryByAppid(String appId);
	void deletePartWarningByAppid(String appId);
    void deleteAllWarningByAppid(String appId);
	void saveAddMCInfos(List<Map<String, Object>> list);
	void saveCmpMCInfos(List<Map<String, Object>> list);
	void deleteAddMCInfosByAppid(String appId);
	void deleteAddMCHisInfosByAppid(String appId);
	void deleteAddMCExtHisInfosByAppid(String appId);
	void deleteCmpMCInfosByAppid(String appId);
	void deleteCmpMCHisInfosByAppid(String appId);

    //---------------------------------------------------------
    List<Map<String, Object>> queryAppinfoByAppId(String appId);


}