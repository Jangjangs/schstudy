package json;



import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonExam3 {
/*
 * {"사람들":[{"이름":"인간_1","주소":"서울 중앙로&nbsp;1길","나이":11}]}
 */
	public static void main(String[] args) {
		
		String jsonData= "{\"boxOfficeResult\":{\"boxofficeType\":\"일별 박스오피스\",\"showRange\":\"20221005~20221005\",\"dailyBoxOfficeList\":[{\"rnum\":\"1\",\"rank\":\"1\",\"rankInten\":\"0\",\"rankOldAndNew\":\"OLD\",\"movieCd\":\"20215601\",\"movieNm\":\"공조2: 인터내셔날\",\"openDt\":\"2022-09-07\",\"salesAmt\":\"269837555\",\"salesShare\":\"23.0\",\"salesInten\":\"-50246570\",\"salesChange\":\"-15.7\",\"salesAcc\":\"64374851344\",\"audiCnt\":\"27530\",\"audiInten\":\"-5225\",\"audiChange\":\"-16\",\"audiAcc\":\"6274106\",\"scrnCnt\":\"992\",\"showCnt\":\"3303\"},{\"rnum\":\"2\",\"rank\":\"2\",\"rankInten\":\"1\",\"rankOldAndNew\":\"OLD\",\"movieCd\":\"20198317\",\"movieNm\":\"인생은 아름다워\",\"openDt\":\"2022-09-28\",\"salesAmt\":\"226639591\",\"salesShare\":\"19.3\",\"salesInten\":\"-9280763\",\"salesChange\":\"-3.9\",\"salesAcc\":\"3761870478\",\"audiCnt\":\"24760\",\"audiInten\":\"-500\",\"audiChange\":\"-2\",\"audiAcc\":\"388072\",\"scrnCnt\":\"947\",\"showCnt\":\"3126\"},{\"rnum\":\"3\",\"rank\":\"3\",\"rankInten\":\"-1\",\"rankOldAndNew\":\"OLD\",\"movieCd\":\"20219628\",\"movieNm\":\"정직한 후보2\",\"openDt\":\"2022-09-28\",\"salesAmt\":\"187838879\",\"salesShare\":\"16.0\",\"salesInten\":\"-52862448\",\"salesChange\":\"-22\",\"salesAcc\":\"5281661293\",\"audiCnt\":\"20128\",\"audiInten\":\"-5321\",\"audiChange\":\"-20.9\",\"audiAcc\":\"538385\",\"scrnCnt\":\"966\",\"showCnt\":\"3244\"},{\"rnum\":\"4\",\"rank\":\"4\",\"rankInten\":\"0\",\"rankOldAndNew\":\"OLD\",\"movieCd\":\"20226777\",\"movieNm\":\"극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교\",\"openDt\":\"2022-09-28\",\"salesAmt\":\"98628818\",\"salesShare\":\"8.4\",\"salesInten\":\"3836077\",\"salesChange\":\"4\",\"salesAcc\":\"2493826437\",\"audiCnt\":\"9949\",\"audiInten\":\"232\",\"audiChange\":\"2.4\",\"audiAcc\":\"251095\",\"scrnCnt\":\"499\",\"showCnt\":\"751\"},{\"rnum\":\"5\",\"rank\":\"5\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20217624\",\"movieNm\":\"컴백홈\",\"openDt\":\"2022-10-05\",\"salesAmt\":\"68984523\",\"salesShare\":\"5.9\",\"salesInten\":\"68984523\",\"salesChange\":\"100\",\"salesAcc\":\"138468523\",\"audiCnt\":\"7633\",\"audiInten\":\"7633\",\"audiChange\":\"100\",\"audiAcc\":\"15349\",\"scrnCnt\":\"603\",\"showCnt\":\"1753\"},{\"rnum\":\"6\",\"rank\":\"6\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20227308\",\"movieNm\":\"스파이더맨: 노 웨이 홈 '펀버전'\",\"openDt\":\"2022-10-05\",\"salesAmt\":\"46848745\",\"salesShare\":\"4.0\",\"salesInten\":\"46848745\",\"salesChange\":\"100\",\"salesAcc\":\"46848745\",\"audiCnt\":\"4479\",\"audiInten\":\"4479\",\"audiChange\":\"100\",\"audiAcc\":\"4479\",\"scrnCnt\":\"347\",\"showCnt\":\"715\"},{\"rnum\":\"7\",\"rank\":\"7\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20227073\",\"movieNm\":\"신 에반게리온 극장판\",\"openDt\":\"2022-10-05\",\"salesAmt\":\"32542900\",\"salesShare\":\"2.8\",\"salesInten\":\"32542900\",\"salesChange\":\"100\",\"salesAcc\":\"32542900\",\"audiCnt\":\"2944\",\"audiInten\":\"2944\",\"audiChange\":\"100\",\"audiAcc\":\"2944\",\"scrnCnt\":\"93\",\"showCnt\":\"187\"},{\"rnum\":\"8\",\"rank\":\"8\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20227452\",\"movieNm\":\"엑스칼리버 더 뮤지컬 다큐멘터리: 도겸의 찬란한 여정\",\"openDt\":\" \",\"salesAmt\":\"51911000\",\"salesShare\":\"4.4\",\"salesInten\":\"51911000\",\"salesChange\":\"100\",\"salesAcc\":\"73635500\",\"audiCnt\":\"2257\",\"audiInten\":\"2257\",\"audiChange\":\"100\",\"audiAcc\":\"3126\",\"scrnCnt\":\"31\",\"showCnt\":\"31\"},{\"rnum\":\"9\",\"rank\":\"9\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20226739\",\"movieNm\":\"고고다이노 극장판: 얼음공룡의 비밀\",\"openDt\":\"2022-10-05\",\"salesAmt\":\"18499999\",\"salesShare\":\"1.6\",\"salesInten\":\"18499999\",\"salesChange\":\"100\",\"salesAcc\":\"22747999\",\"audiCnt\":\"2120\",\"audiInten\":\"2120\",\"audiChange\":\"100\",\"audiAcc\":\"2578\",\"scrnCnt\":\"321\",\"showCnt\":\"378\"},{\"rnum\":\"10\",\"rank\":\"10\",\"rankInten\":\"0\",\"rankOldAndNew\":\"NEW\",\"movieCd\":\"20210087\",\"movieNm\":\"듄\",\"openDt\":\"2021-10-20\",\"salesAmt\":\"27983000\",\"salesShare\":\"2.4\",\"salesInten\":\"27983000\",\"salesChange\":\"100\",\"salesAcc\":\"17456443010\",\"audiCnt\":\"2008\",\"audiInten\":\"2008\",\"audiChange\":\"100\",\"audiAcc\":\"1588222\",\"scrnCnt\":\"20\",\"showCnt\":\"49\"}]}}";
				
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(jsonData);
			JSONObject jsonObj=(JSONObject) obj;
			JSONObject jsonResult = (JSONObject) jsonObj.get("boxOfficeResult");
			JSONArray jsonArr=(JSONArray) jsonResult.get("dailyBoxOfficeList");
			
			
			for(int i = 0 ; i< jsonArr.size(); i++) {
				JSONObject data = (JSONObject)jsonArr.get(i);
				System.out.println((i+1)+ ">>" +data.get("movieNm"));
			}
			
		} catch(ParseException e) {
			e.printStackTrace();
		}
	}

}
