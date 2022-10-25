<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>계산기</title>
<style>
.calc {
	border : 1px solid red;
	/* display: inline; */
	max-width: 600px;
	margin:auto;
	padding: 15px;
	background-color: powderblue;
	border-radius: 10px;
	margin-top: 50px;	
}
</style>
</head>
<body>
	<div class="container">
		<div class="calc">
			<form method="post" action="../Calc">
			<div class="form-group">
				<input name="num1" class="form-control" style="width:250px; float:left;"> 
				<select name="oper" class="form-control" style="width:68px; float:left; font-size:2rem;">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select> 
				<input name="num2" class="form-control" style="width:250px; float:left;">
			</div>
				<button class="form-control">계산</button>
			
			</form>
		</div>
	</div>
</body>
</html>