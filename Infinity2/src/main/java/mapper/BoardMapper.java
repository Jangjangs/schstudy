package mapper;

import java.sql.*;

import model.BoardVO;

public class BoardMapper {

	public void create(BoardVO vo) {
		
		 String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
		 String user="root";
		 String password="bigdata";

		 StringBuffer qry = new StringBuffer();
		 qry.append(" INSERT INTO big_board (bo_num, bo_category, bo_title, ");
		 qry.append("bo_content, bo_mb_id, bo_mb_name, bo_hit, bo_inputdate, bo_ip) ");
		 qry.append(" VALUES (null, ?, ?, ?, ?, ?, 0, now(), ?) ");
		 String sql = qry.toString();

		 Connection conn = null;
		 PreparedStatement stmt = null;
		 			 
		 try{
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 conn = DriverManager.getConnection(url, user, password);
			 
			 stmt = conn.prepareStatement(sql);
			 stmt.setString(1, vo.getBo_category());
			 stmt.setString(2, vo.getBo_title());
			 stmt.setString(3, vo.getBo_content());
			 stmt.setString(4, vo.getBo_mb_id());
			 stmt.setString(5, vo.getBo_mb_name());
			 stmt.setString(6, vo.getBo_ip());
			 int res = stmt.executeUpdate();
			 
			// System.out.println(vo);
			 
			 if(res != 0){
				 
			 }
			 
		 } catch(Exception e){
			 
		 } finally{
			 try{
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){
					
				}
		 }

	}
}
