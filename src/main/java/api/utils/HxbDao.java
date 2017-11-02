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

	public List<Map<String, Object>>  isExistsRequest(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.isExistsRequest(appId);
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
