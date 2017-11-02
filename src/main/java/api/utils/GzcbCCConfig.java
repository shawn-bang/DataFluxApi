package api.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

public class GzcbCCConfig {

	private static Logger log = Logger.getLogger(GzcbCCConfig.class);

	private static Map<String, String> CC_SNAINPUT_TOTYPE_MAP = null;

	private static Map<String, String> CC_SNAINPUT_LINKTYPE_MAP = null;

	private static Map<String, String> CC_SNAINPUT_CLUSTER_MAP = null;

	static {
		SqlSession sqlSession = null;
		try {
			sqlSession = SessionFactory.getSqlSessionFactory().openSession();
			List<Map<String, String>> conflist = GzcbCCAppImpl.getInstance().getCCSnaInputConf(sqlSession);
			Iterator<Map<String, String>> it = conflist.iterator();
			HashMap<String, String> ccToTypeMap = new HashMap<String, String>();
			HashMap<String, String> ccLinkTypeMap = new HashMap<String, String>();
			HashMap<String, String> ccClusterMap = new HashMap<String, String>();
			while (it.hasNext()) {
				Map<String, String> tmpmap = it.next();
				ccToTypeMap.put(tmpmap.get("src_type"), tmpmap.get("to_type"));
				ccLinkTypeMap.put(tmpmap.get("src_type"), tmpmap.get("link_type"));
				ccClusterMap.put(tmpmap.get("src_type"), tmpmap.get("cluster"));
			}
			GzcbCCConfig.CC_SNAINPUT_TOTYPE_MAP = ccToTypeMap;
			GzcbCCConfig.CC_SNAINPUT_LINKTYPE_MAP = ccLinkTypeMap;
			GzcbCCConfig.CC_SNAINPUT_CLUSTER_MAP = ccClusterMap;
			log.info("static:Init CCSnaInputConf");
		} catch (Exception e) {
			log.error("static:Init CCSnaInputConf failed", e);
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	private static void buildCCSnaInputConf() {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		List<Map<String, String>> conflist = GzcbCCAppImpl.getInstance().getCCSnaInputConf(sqlSession);
		Iterator<Map<String, String>> it = conflist.iterator();
		HashMap<String, String> ccToTypeMap = new HashMap<String, String>();
		HashMap<String, String> ccLinkTypeMap = new HashMap<String, String>();
		HashMap<String, String> ccClusterMap = new HashMap<String, String>();
		while (it.hasNext()) {
			Map<String, String> tmpmap = it.next();
			ccToTypeMap.put(tmpmap.get("src_type"), tmpmap.get("to_type"));
			ccLinkTypeMap.put(tmpmap.get("src_type"), tmpmap.get("link_type"));
			ccClusterMap.put(tmpmap.get("src_type"), tmpmap.get("cluster"));
		}
		GzcbCCConfig.CC_SNAINPUT_TOTYPE_MAP = ccToTypeMap;
		GzcbCCConfig.CC_SNAINPUT_LINKTYPE_MAP = ccLinkTypeMap;
		GzcbCCConfig.CC_SNAINPUT_CLUSTER_MAP = ccClusterMap;
		log.info("buildCCSnaInputConf:Init CCSnaInputConf");
	}

	public static Map<String, String> getConf_CC_SNAINPUT_TOTYPE_MAP() {
		if (CC_SNAINPUT_TOTYPE_MAP == null || CC_SNAINPUT_TOTYPE_MAP.keySet().size() < 3) {
			log.info("CC_SNAINPUT_TOTYPE_MAP==null || CC_SNAINPUT_TOTYPE_MAP.keySet().size()<3");
			GzcbCCConfig.buildCCSnaInputConf();
		}
		return GzcbCCConfig.CC_SNAINPUT_TOTYPE_MAP;
	}

	public static Map<String, String> getConf_CC_SNAINPUT_LINKTYPE_MAP() {
		if (CC_SNAINPUT_LINKTYPE_MAP == null || CC_SNAINPUT_LINKTYPE_MAP.keySet().size() < 3) {
			log.info("CC_SNAINPUT_LINKTYPE_MAP==null || CC_SNAINPUT_LINKTYPE_MAP.keySet().size()<3");
			GzcbCCConfig.buildCCSnaInputConf();
		}
		return GzcbCCConfig.CC_SNAINPUT_LINKTYPE_MAP;
	}

	public static Map<String, String> getConf_CC_SNAINPUT_CLUSTER_MAP() {
		if (CC_SNAINPUT_CLUSTER_MAP == null || CC_SNAINPUT_CLUSTER_MAP.keySet().size() < 3) {
			log.info("CC_SNAINPUT_CLUSTER_MAP==null || CC_SNAINPUT_CLUSTER_MAP.keySet().size()<3");
			GzcbCCConfig.buildCCSnaInputConf();
		}
		return GzcbCCConfig.CC_SNAINPUT_CLUSTER_MAP;
	}

}
