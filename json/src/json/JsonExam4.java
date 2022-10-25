package json;



import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonExam4 {
/*
 * {"사람들":[{"이름":"인간_1","주소":"서울&ndsp;중앙로&nbsp;1길","나이":11}]}
 */
	public static void main(String[] args) {
		
		String jsonData= "{\"사람들\":[{\"이름\":\"인간_1\",\"주소\":\"서울 중앙로 1길\",\"나이\":11},{\"이름\":\"인간_2\",\"주소\":\"서울 중앙로 2길\",\"나이\":22}]}";
				
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(jsonData);
			JSONObject jsonObj = (JSONObject) obj;
			JSONArray jsonArr = (JSONArray)jsonObj.get("사람들");
			
			JSONObject jsonObjSub = (JSONObject)jsonArr.get(0);
						
			System.out.println(jsonArr.get(0));
			System.out.println(jsonObjSub.get("이름"));
			System.out.println(jsonObjSub.get("주소"));
			System.out.println(jsonObjSub.get("나이"));
			
			jsonObjSub = (JSONObject)jsonArr.get(1);
			System.out.println(jsonArr.get(1));
			System.out.println(jsonObjSub.get("이름"));
			System.out.println(jsonObjSub.get("주소"));
			System.out.println(jsonObjSub.get("나이"));
		} catch(ParseException e) {
			e.printStackTrace();
		}
	}

}
