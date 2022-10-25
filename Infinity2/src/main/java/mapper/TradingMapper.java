package mapper;

import java.sql.*;
import java.sql.PreparedStatement;

import common.DBUtil;
import model.TradingVO;

public class TradingMapper {

	public int create(TradingVO vo) {
		 StringBuffer qry = new StringBuffer();
		 qry.append(" INSERT INTO big_trading (tra_num, tra_account, tra_inputdate) ");
		 qry.append(" VALUES (null, ?, curdate()) ");
		 String sql = qry.toString();

		 Connection conn = null;
		 PreparedStatement stmt = null;
		 	
		 int lastId = 0;
		 try{
			 conn = DBUtil.getConnection();
			 
			 stmt = conn.prepareStatement(sql);
			 stmt.setString(1, vo.getTra_account());
			 int res = stmt.executeUpdate();
			 
			// System.out.println(vo);
			 //last ID 가져오기
			 String sqlLastId = " SELECT last_insert_id() as lastId ";
			 stmt = conn.prepareStatement(sqlLastId);
			 ResultSet rs = stmt.executeQuery();
			 if(rs.next()){
				 lastId = rs.getInt("lastId");
			 }
			 
		 } catch(Exception e){
			 
		 } finally{
			 DBUtil.setClose(null, stmt, conn);
		 }

		return lastId;
	}
}
