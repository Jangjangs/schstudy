<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>단락을 나타내는 태그 P</p>
<script src="jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('p').on("click",function(){
		console.log("p태그 클릭");
	});
	
/* 	$('p').click(function(){
		console.log("p태그 클릭")
	}); */
});
</script>
</body>
</html>