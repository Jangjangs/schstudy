<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
name[a1] : <%=request.getParameter("a1") %> <br>
name[b1] : <%=request.getParameter("b1") %> <br>
name[c1] : <%=request.getParameter("c1") %> <br>
name[d1] : <%=request.getParameter("d1") %> <br>
<%
String[] strParams = request.getParameterValues("d1");
/* for(int i = 0 ; i<request.getParameterValues("d1").length; i++){
	out.print("name[d1]["+i+"] : "+strParams[i]+"<br>");
} */
%>
<%
for(int i = 0 ; i<request.getParameterValues("d1").length; i++){
%>
	name[d1][<%=i %>]:<%=strParams[i] %> <br>
<%}%>
name[d1] : <%=request.getParameterValues("d1") %> <br>
name[e1] : <%=request.getParameter("e1") %> <br>
name[f1] : <%=request.getParameter("f1") %> <br>
</body>
</html>