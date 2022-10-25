<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
	background-color: #999;
	border-radius: 5px;
	padding:15px 0;
}
input {
	width:342px;
}
#regform {
	background-color:#aaa; 
	padding:15px;
	max-width:350px;
	margin:auto;
	border-radius: 5px;
}
#resultform{
	background-color: #aaa;
	display:none;  
	
}
</style>

</head>
<body>
<h2>회원가입</h2>
<hr>
<div id="regform">
<form>
이름<br> <input type="text" id="username" name="username" class="">
<hr>
이메일<br> <input type="text" id="email" name="email" class="">
<hr>
<button type="button" onclick="signup();">가입</button>
</form>
</div>
<div id="resultform">
<h4>가입정보</h4> 
<hr>
이름 : <span id="uname"></span><br>
이메일 : <span id="uemail"></span>
</div>
<script>
function signup(){
	if(confirm("정말로 가입하시겠습니까?")){
		/* let username = document.forms[0].username.value;
		let email = document.forms[0].email.value; */
		let username = document.getElementById("username").value;
		let email = document.getElementById("email").value;
		document.getElementById("uname").innerHTML = username;
		document.getElementById("uemail").innerHTML = email;
		
		document.getElementById("regform").setAttribute("style","display:none");
		document.getElementById("resultform").setAttribute("style","display:block");
		
	
	}
}
</script>
</body>
</html>