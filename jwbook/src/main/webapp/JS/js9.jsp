<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<button onclick="on(2)">ON</button>
<img src="pic_bulboff.gif" alt="전구">
<button onclick="document.images[0].src='pic_bulboff.gif'">OFF</button>
<script>
function on(date=1){
	document.images[0].src='pic_bulbon.gif';
	console.log(date);
}
</script>
</body>
</html>