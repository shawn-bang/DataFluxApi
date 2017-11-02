package api.utils;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionFactory {
	private static final String RESOURCE = "mybatis-config.xml";
	private static SqlSessionFactory sqlSessionFactory = null;
	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<SqlSession>();
	static {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(RESOURCE);
		} catch (IOException e) {
			throw new RuntimeException("Get resource error:" + RESOURCE, e);
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public static void rebuildSqlSessionFactory() {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(RESOURCE);
		} catch (IOException e) {
			throw new RuntimeException("Get resource error:" + RESOURCE, e);
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	}

	public static SqlSession getSession() {
		SqlSession session = threadLocal.get();
		if (session != null) {
			if (sqlSessionFactory != null) {
				session = (sqlSessionFactory != null) ? sqlSessionFactory.openSession() : null;
			}
		}
		return session;
	}

	public static void closeSession() {
		SqlSession session = threadLocal.get();
		threadLocal.set(null);
		if (session != null) {
			session.close();
		}
	}

//	public static void main(String[] args) {
//		System.out.println(SessionFactory.getSqlSessionFactory().openSession());
//	}
}
