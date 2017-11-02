package api.utils;

import java.util.List;
import java.util.Map;

public interface HxbMapper {
	public List<Map<String, Object>> isExistsRequest(String appId);
	public List<Map<String, Object>> selectAfsummary(String appId);
	public List<Map<String, Object>> selectAfriskwarning(String appId);
}