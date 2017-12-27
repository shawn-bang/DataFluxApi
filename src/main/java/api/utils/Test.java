package api.utils;

import api.constants.AppReqNumEnum;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

public class Test {

    public static void main(String args[]) throws IOException {
        // first request
        System.out.println(getRequestJsonByAppid("170104A932P38122", AppReqNumEnum.AF1001));

        // second request
        System.out.println(getRequestJsonByAppid("170104A932P38122", AppReqNumEnum.AF1002));
    }

    private static String getRequestJsonByAppid(String appId, AppReqNumEnum appReqNum) throws IOException {
        Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        reader.close();

        SqlSession session = sqlSessionFactory.openSession();
        HxbMapper mapper = session.getMapper(HxbMapper.class);
        List<Map<String, Object>> result = mapper.queryAppinfoByAppId(appId);

        if (result == null || result.size() == 0) {
            return "There is not exist row: " + appId;
        }

        JSONObject requestJson = new JSONObject();
        JSONObject requestDescJson = new JSONObject();
        JSONArray applicantsJson = new JSONArray();
        JSONObject app = new JSONObject();
        app.put("applicantinfo", result.get(0));
        app.put("zmivsinfo", null);

        applicantsJson.add(app);
        requestDescJson.put("trigmode", "");
        requestDescJson.put("reqappnum", appReqNum.name());
        requestDescJson.put("fromflowpoint", "");
        requestJson.put("requestdesc", requestDescJson);
        requestJson.put("applicants", applicantsJson);

        return requestJson.toJSONString();
    }

}
