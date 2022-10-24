<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");



 String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
 String user="root";
 String password="bigdata";

 StringBuffer qry = new StringBuffer();
 qry.append(" INSERT INTO big_comment (com_num, com_refnum, com_content, ");
 qry.append("com_mb_id, com_mb_name, com_inputdate ) ");
 qry.append(" VALUES (null, ?, ?, ?, ?, now()) ");
 String sql = qry.toString();
	/* System.out.print(sql); */
 Connection conn = null;
 PreparedStatement stmt = null;
 
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn = DriverManager.getConnection(url, user, password);
	
	 stmt = conn.prepareStatement(sql);
	 stmt.setString(1, request.getParameter("com_refnum"));
	 stmt.setString(2, request.getParameter("com_content"));
	 stmt.setString(3, (String) session.getAttribute("sess_id"));
	 stmt.setString(4, (String) session.getAttribute("sess_name"));
	 stmt.executeUpdate();
	 System.out.print(stmt);
 } catch(Exception e){
	 
 } finally{
	 try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			
		}
 }
%>

<%
response.sendRedirect("view.jsp?bo_num="+request.getParameter("com_refnum"));
%>