/*
 * jdbc프로그램
 */
package mapper;

import java.sql.*;

import model.MemberVO;

/*
 * 회원테이블관련 SQL
 * 
 */
public class MemberMapper {

	public void create(MemberVO vo) {
	
		

		//JDBC프로그래밍
		String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
		String user="root";
		String password="bigdata";

		StringBuffer qry = new StringBuffer(); //String 값 변경
		qry.append(" INSERT INTO big_member (mb_id, mb_pw, mb_name, mb_email, ");
		qry.append(" mb_zipcode, mb_addr, mb_detailAddr, mb_phone, mb_birth, mb_gender, mb_joindate) ");
		qry.append(" VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,now()) "); //preparestatement


		String sql=qry.toString();


		int idx = 1;
		Connection conn = null;
		PreparedStatement stmt = null;
		

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(sql);
			//?에 값넣기
			//stmt.setString(1, mb_id); smtm에 id값 넣기
			stmt.setString(idx++, vo.getMb_id());
			stmt.setString(idx++, vo.getMb_pw());
			stmt.setString(idx++, vo.getMb_name());
			stmt.setString(idx++, vo.getMb_email());
			stmt.setString(idx++, vo.getMb_zipcode());
			stmt.setString(idx++, vo.getMb_addr());
			stmt.setString(idx++, vo.getMb_detailAddr());
			stmt.setString(idx++, vo.getMb_phone());
			stmt.setString(idx++, vo.getMb_birth());
			stmt.setString(idx++, vo.getMb_gender());
			//실행
			int res = stmt.executeUpdate();
			if(res != 0){
				
			}
		} catch (Exception e){
			e.getLocalizedMessage();
		} finally {
			try {
				if(stmt != null) stmt.close(); //연결 해제
				if(conn != null) conn.close();
			} catch(Exception e){
				e.getLocalizedMessage();
			}
		}

		

		
	}
}
