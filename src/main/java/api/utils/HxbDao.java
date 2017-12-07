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

	public void saveModelVarInput(SqlSession sqlSession,List<Map<String, Object>> list){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.saveModelVarInput(list);
	}

	public void deleteModelVarInputByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteModelVarInputByAppid(appId);
	}

	public List<Map<String, Object>>  selectModelInputParams(SqlSession sqlSession){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectModelInputParams();
	}

	public void saveSNAInput(SqlSession sqlSession,Map<String, Object> map){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.saveSNAInput(map);
	}

	public void deleteSNAInputByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteSNAInputByAppid(appId);
	}

	public List<Map<String, Object>>  selectSNAInputConf(SqlSession sqlSession){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectSNAInputConf();
	}

	public void runHandleProcedures(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.callHandleProcedures(appId);
	}

	public List<Object>  selectAfsummary(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectAfsummary(appId);
	}

	public List<Object>  selectAfriskwarning(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		return mapper.selectAfriskwarning(appId);
	}

	public void deleteAfsummaryByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteAfsummaryByAppid(appId);
	}

	public void deleteAfriskwarningByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteAfriskwarningByAppid(appId);
	}

    public void saveAddMCInfos(SqlSession sqlSession,List<Map<String, Object>> list){
        HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
        mapper.saveAddMCInfos(list);
    }

    public void saveCmpMCInfos(SqlSession sqlSession,List<Map<String, Object>> list){
        HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
        mapper.saveCmpMCInfos(list);
    }

    public void deleteAddMCInfosByAppid(SqlSession sqlSession,String appId){
        HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
        mapper.deleteAddMCInfosByAppid(appId);
    }

	public void deleteAddMCHisInfosByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteAddMCHisInfosByAppid(appId);
	}

	public void deleteAddMCExtHisInfosByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteAddMCExtHisInfosByAppid(appId);
	}

    public void deleteCmpMCInfosByAppid(SqlSession sqlSession,String appId){
        HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
        mapper.deleteCmpMCInfosByAppid(appId);
    }

	public void deleteCmpMCHisInfosByAppid(SqlSession sqlSession,String appId){
		HxbMapper mapper = sqlSession.getMapper(HxbMapper.class);
		mapper.deleteCmpMCHisInfosByAppid(appId);
	}
	
}
