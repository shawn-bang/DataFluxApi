package api.utils;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class GzcbCCAppImpl {
	private static class GzcbCCAppHandler {
		private static GzcbCCAppImpl ccAppImpl = new GzcbCCAppImpl();
	}

	private GzcbCCAppImpl() {
	}
	
	public static GzcbCCAppImpl getInstance() {
		return GzcbCCAppHandler.ccAppImpl;
	}
	
	public String  isExistsCCApp(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		return (mapper.isExistsCCApp(shenqingjian_no)!=null)?"YES":"NO";
	}
	
	public void saveCCApp(SqlSession sqlSession,Map<String,Object> ccappMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.saveCCApp(ccappMap);
	}
	
	public void updateCCApp(SqlSession sqlSession,Map<String,Object> ccappMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.updateCCApp(ccappMap);
	}
	
	public Map<String,Object> selectCCApp(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		return mapper.selectCCApp(shenqingjian_no);
	}
	
	public List<Map<String,String>> getCCSnaInputConf(SqlSession sqlSession){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		return mapper.getCCSnaInputConf();	
	}
	
	public void deleteCCSnaInputFromAppno(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.deleteCCSnaInputFromAppno(shenqingjian_no);
	}
	
	public void saveCCSnaInput(SqlSession sqlSession,Map<String,String> ccSnaInputMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.saveCCSnaInput(ccSnaInputMap);
	}
	
	public void deleteCCAppAddFromAppno(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.deleteCCAppAddFromAppno(shenqingjian_no);
	}
	
	public void saveCCAppAdd(SqlSession sqlSession,Map<String,String> appAddMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.saveCCAppAdd(appAddMap);
	}
	
	public void deleteCCAppCmpFromAppno(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.deleteCCAppCmpFromAppno(shenqingjian_no);
	}
	
	public void saveCCAppCmp(SqlSession sqlSession,Map<String,String> appCmpMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.saveCCAppCmp(appCmpMap);
	}
	
	public void saveCCAppMatchRst(SqlSession sqlSession,Map<String,Object> ccappMtrstMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.saveCCAppMatchRst(ccappMtrstMap);
	}
	
	public void callAfCCAppRT(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.callAfCCAppRT(shenqingjian_no);
	}
	
	public Map<String,String> selectMdkKequn(SqlSession sqlSession,Map<String,String> paraCompany){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		return mapper.selectMdkKequn(paraCompany);
	}
	
	public void insertMdkKequn(SqlSession sqlSession,Map<String,String> paraMdkKequnMap){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.insertMdkKequn(paraMdkKequnMap);
	}
	
	public void deleteMatchrstbyAppno(SqlSession sqlSession,String shenqingjian_no){
		GzcbCCAppAFMapper mapper = sqlSession.getMapper(GzcbCCAppAFMapper.class);
		mapper.deleteMatchrstbyAppno(shenqingjian_no);
	}
	
}
