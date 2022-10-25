<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery.min.js"></script>
</head>
<body>
<button id="btn" class="btn">버튼</button>
<script>
$(document).ready(function(){
	$(".btn").on("click",function(){
		console.log("버튼 클릭");
	});
	
});

</script>
</body>
</html>