package api.utils;

import java.util.Locale;
import java.util.ResourceBundle;

public class PropUtil {
	
	public static String getPropValue(String popfileName,String key) throws Exception{
		Locale locale=Locale.getDefault();
		ResourceBundle rb=ResourceBundle.getBundle(popfileName, locale);
		String value=rb.getString(key).trim();
		if (value==null || value.length()<1){
			throw new Exception("failed : get value from "+popfileName+" by "+key);
		}
		return value;
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println(PropUtil.getPropValue("runningControl", "CCAPPAFURL"));
//		System.out.println(PropUtil.getPropValue("runningControl", "DFSERVICEADD"));
//		System.out.println(PropUtil.getPropValue("runningControl", "ReturnCCAppAfRpt"));
//		System.out.println(PropUtil.getPropValue("runningControl", "RUNComputing"));
		String companyphone="020 2321-233";
		String homephone="010-32341232";
		companyphone=companyphone.replaceAll("-", "");
		homephone=homephone.replaceAll("-", "");
		
		System.out.println(companyphone);
		System.out.println(homephone);
		
	}
}
