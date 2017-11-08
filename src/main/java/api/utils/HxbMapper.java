package api.utils;

import java.util.List;
import java.util.Map;

public interface HxbMapper {
	public int isExistsRequest(String appId);
	public void saveApplicantinfo(Map<String, Object> map);
	public void updateApplicantinfo(Map<String, Object> map);
	public void saveZmivsinfo(Map<String, Object> map);
	public void deleteZmivsinfoByAppid(String appId);
	public void callHandleProcedures(String appId);
	public List<Map<String, Object>> selectModelInputParams();
	public void saveModelVarInput(List<Map<String, Object>> list);
	public void deleteModelVarInputByAppid(String appId);
	public List<Map<String, Object>> selectSNAInputConf();
	public void saveSNAInput(Map<String, Object> map);
	public void deleteSNAInputByAppid(String appId);
	public List<Object> selectAfsummary(String appId);
	public List<Object> selectAfriskwarning(String appId);
	public void deleteAfsummaryByAppid(String appId);
	public void deleteAfriskwarningByAppid(String appId);
}