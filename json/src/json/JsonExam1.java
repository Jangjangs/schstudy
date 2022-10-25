package json;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonExam1 {
/*
 * {"사람들":[{"이름":"인간_1","주소":"서울&ndsp;중앙로&nbsp;1길","나이":11}]}
 */
	public static void main(String[] args) {
		
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		
		//obj.put("name", "홍길동");
		//obj.put("age", 22);
		JSONObject objout = new JSONObject();
		obj.put("이름", "인간_1");
		obj.put("주소", "서울 중앙로 1길");
		obj.put("나이", 11);
		arr.add(obj);
		
		obj = new JSONObject();
		obj.put("이름", "인간_2");
		obj.put("주소", "서울 중앙로 2길");
		obj.put("나이", 22);
		arr.add(obj);
		
		objout.put("사람들", arr);
		System.out.println(objout);
	}

}
