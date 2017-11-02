package api.utils;

import java.util.List;
import java.util.Map;

public interface GzcbCCAppAFMapper {
	public String isExistsCCApp(String shenqingjian_no);
	public void saveCCApp(Map<String, Object> ccappMap);
	public void updateCCApp(Map<String, Object> ccappMap);
	public Map<String,Object> selectCCApp(String shenqingjian_no);
	public List<Map<String,String>> getCCSnaInputConf();
	public void deleteCCSnaInputFromAppno(String shenqingjian_no);
	public void saveCCSnaInput(Map<String, String> ccSnaInputMap);
	public void deleteCCAppAddFromAppno(String shenqingjian_no);
	public void saveCCAppAdd(Map<String, String> appAddMap);
	public void deleteCCAppCmpFromAppno(String shenqingjian_no);
	public void saveCCAppCmp(Map<String, String> appCmpMap);
	public void saveCCAppMatchRst(Map<String, Object> ccappMtrstMap);
	public void callAfCCAppRT(String shenqingjian_no);
	
	public Map<String,String> selectMdkKequn(Map<String, String> paraCompanyMap);
	public void insertMdkKequn(Map<String, String> paraMdkKequnMap);
	
	public void deleteMatchrstbyAppno(String shenqingjian_no);
}