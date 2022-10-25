<%@page import="java.time.LocalDateTime"%>
<%@page import="com.mysql.cj.jdbc.ha.ReplicationMySQLConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //쿠키설정
    Cookie cookie = new Cookie("name","강길동");
    	cookie.setMaxAge(60*60*9);
    	response.addCookie(cookie); 
    System.out.println(LocalDateTime.now());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키값: <%=request.getCookies()[0].getValue() %>
</body>
</html>