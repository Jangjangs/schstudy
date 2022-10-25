<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form onsubmit="abc();">
	<input type="text">
	<button>전송</button>
</form>
<script>
function abc(){
	
	console.log("submit");
	return false;
}
</script>
</body>
</html>