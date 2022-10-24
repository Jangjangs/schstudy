<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");



 String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
 String user="root";
 String password="bigdata";

 StringBuffer qry = new StringBuffer();
 qry.append(" INSERT INTO big_comment (com_num, com_refnum, com_content, ");
 qry.append("com_mb_id, com_mb_name, com_inputdate ) ");
 qry.append(" VALUES (null, ?, ?, ?, ?, now()) ");
 String sql = qry.toString();

 Connection conn = null;
 PreparedStatement stmt = null;
 String ajaxMessage = "Fail";
 
 int res = 0;
 
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn = DriverManager.getConnection(url, user, password);
	 
	 stmt = conn.prepareStatement(sql);
	 stmt.setString(1, request.getParameter("com_refnum"));
	 stmt.setString(2, request.getParameter("com_content"));
	 stmt.setString(3, (String) session.getAttribute("sess_id"));
	 stmt.setString(4, (String) session.getAttribute("sess_name"));
	 res = stmt.executeUpdate();
	 
	 if(res != 0){
		 ajaxMessage = "Success";
	 }
 } catch(Exception e){
	 
 } finally{
	 try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			
		}
 }
 
//원래는 JSON데이터로보내야되는데
//out.print(ajaxMessage);
out.print("<div>");
out.print("<div>"+ session.getAttribute("sess_name") +" </div>");						
out.print("<div>"+ request.getParameter("com_content") +"</div>");						
out.print("</div>");
out.print("<hr>");
%>

