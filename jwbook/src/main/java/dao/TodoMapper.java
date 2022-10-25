package dao;

import java.sql.*;
import java.util.*;

import domain.TodoVO;

public class TodoMapper {
	//C
	public String create(TodoVO vo) {
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
		Connection con = null;
		Statement st = null;
		String lastId = null;

		try {

			Class.forName(jdbc_driver);
			con = DriverManager.getConnection(jdbc_url, "root", "bigdata");
			st = con.createStatement();
			//INSERT INTO big_member (mb_id, mb_pw, mb_name) 
			//VALUES ('big003', 'bigdata', '비오는');
			StringBuffer qry = new StringBuffer();
			qry.append(" INSERT INTO big_todo (todo, todoDate) ");
			qry.append(" VALUES ('"+vo.getTodo()+"', '"+vo.getTodoDate()+"') ");
			String sql = qry.toString();
			int res = st.executeUpdate(sql);
			
			//last_insert_id()
			StringBuffer qry2 = new StringBuffer();
			qry2.append("SELECT last_insert_id()  as last_id" );
			String sql2 = qry2.toString();
			ResultSet rs = st.executeQuery(sql2);
			if(rs.next()) {
			lastId = rs.getString("last_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(st != null)st.close();
				if(con != null)con.close(); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return lastId;
	}



	public List<TodoVO> read() {
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		List<TodoVO> list = new ArrayList<TodoVO>();
		TodoVO vo= null;
		try {

			Class.forName(jdbc_driver);
			con = DriverManager.getConnection(jdbc_url, "root", "bigdata");
			st = con.createStatement();
			//INSERT INTO big_member (mb_id, mb_pw, mb_name) 
			//VALUES ('big003', 'bigdata', '비오는');
			StringBuffer qry = new StringBuffer();
			qry.append(" SELECT * FROM big_todo ORDER BY todoDate DESC ");
			//insert명령어 read에 필요없음
			//sql += " VALUES ('"+dto.getMb_id()+"', '"+dto.getMb_pw()+"', '"+dto.getMb_name()+"') ";
			String sql=qry.toString();
			rs = st.executeQuery(sql);

			while(rs.next()) {
				vo = new TodoVO();
				vo.setNum(rs.getInt("num"));
				vo.setTodo(rs.getString("todo"));
				vo.setTodoDate(rs.getString("todoDate"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(st != null)st.close();
				if(st != null)con.close(); 
				if(st != null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return list;

	}
	public void delete(TodoVO vo) {
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
		Connection con = null;
		Statement st = null;

		try {

			Class.forName(jdbc_driver);
			con = DriverManager.getConnection(jdbc_url, "root", "bigdata");
			st = con.createStatement();
			//INSERT INTO big_member (mb_id, mb_pw, mb_name) 
			//VALUES ('big003', 'bigdata', '비오는');
			StringBuffer qry = new StringBuffer();
			qry.append(" DELETE FROM big_todo ");
			qry.append(" WHERE num = "+vo.getNum());
			String sql = qry.toString();
			int rs = st.executeUpdate(sql);



		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(st != null)st.close();
				if(con != null)con.close(); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
