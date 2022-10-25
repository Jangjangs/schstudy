<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p id="demo">안녕하세요!</p>
<script>
document.write("Hello World!");
document.getElementById("demo").innerHTML = "HI!";
console.log(document.getElementById("demo").innerHTML);
console.log(document.getElementById("demo"));
window.alert("경고창 메세지");
alert("경고창 메세지");
</script>
</body>
</html>