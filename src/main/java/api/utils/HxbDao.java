package api.utils;

import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class HxbDao {
	private static class HxbDaoHandler {
		private static HxbDao hxbDao = new HxbDao();
	}

	private HxbDao() {
	}
	
	public static HxbDao getInstance() {
		return HxbDaoHandler.hxbDao;
	}

	public int  isExistsRequest(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.isExistsRequest(appId);
	}

	public void saveApplicantinfo(SqlSession sqlSession,Map<String,Object> map){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.saveApplicantinfo(map);
	}

	public void updateApplicantinfo(SqlSession sqlSession,Map<String, Object> map){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.updateApplicantinfo(map);
	}

	public void saveZmivsinfo(SqlSession sqlSession,Map<String, Object> map){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.saveZmivsinfo(map);
	}

	public void deleteZmivsinfoByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteZmivsinfoByAppid(appId);
	}

	public void runHandleProcedures(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.callHandleProcedures(appId);
	}

	public List<Map<String, Object>>  selectAfsummary(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectAfsummary(appId);
	}

	public List<Map<String, Object>>  selectAfriskwarning(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectAfriskwarning(appId);
	}
	
}
