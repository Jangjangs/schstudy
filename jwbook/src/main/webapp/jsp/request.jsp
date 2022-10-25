<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF=8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 메소드</title>
</head>
<body>
request.getParameter("name"):<%=request.getParameter("name") %> <br>
request.getParametervalues("name"):<%=request.getParameterValues("name")[1] %> <br>
request.getAuthType("name"):<%=request.getAuthType() %> <br>
request.getCharcterEncoding :<%=request.getCharacterEncoding() %><br>
request.getContentType :<%=request.getContentType() %> <br>
request.getContextPath():<%=request.getContextPath() %> <br>
request.getLocalAddr():<%=request.getLocalAddr() %> <br>
request.getMethod():<%=request.getMethod() %> <br>
request.getQueryString():<%=request.getQueryString() %> <br>
request.getRemoteAddr():<%=request.getRemoteAddr() %> <br>
request.getRequestURI():<%=request.getRequestURI() %> <br>
request.getRequestURL():<%=request.getRequestURL() %> <br>
request.getServletPath():<%=request.getServletPath() %> <br>
request.getLocale():<%=request.getLocale() %> <br>
request.getHeader("X-Forwarded-For"):<%=request.getHeader("X-Forwarded-For") %> <br>
request.getHeader("Proxy-Client-IP"):<%=request.getHeader("Proxy-Client-IP") %> <br>


<!-- 실행 후 홈페이지 뒤에 name=a&name=b 입력-->
</body>
</html>