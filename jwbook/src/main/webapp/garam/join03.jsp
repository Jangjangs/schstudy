<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름:<%=request.getParameter("uname") %><br/>
학교:<%=request.getParameter("school") %><br/>
학년/반:<%=request.getParameter("className") %><br/>
휴대폰번호:<%=request.getParameter("phone") %><br/>
비밀번호:<%=request.getParameter("upw") %><br/>
노선:<%=request.getParameter("line") %><br/>
탑승장소:<%=request.getParameter("loc") %><br/>
</body>
</html>