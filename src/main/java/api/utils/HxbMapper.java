package api.utils;

import java.util.List;
import java.util.Map;

public interface HxbMapper {
	public int isExistsRequest(String appId);
	public void saveApplicantinfo(Map<String, Object> map);
	public void updateApplicantinfo(Map<String, Object> map);
	public void saveZmivsinfo(Map<String, Object> map);
	public void deleteZmivsinfoByAppid(String appId);
	public List<Map<String, Object>> selectAfsummary(String appId);
	public List<Map<String, Object>> selectAfriskwarning(String appId);
}