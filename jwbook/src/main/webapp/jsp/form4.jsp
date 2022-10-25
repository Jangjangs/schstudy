<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="request2.jsp" method="post" onsubmit="return valueChk()">
		<input type="text" name="a1" id="a2" class="" value="" required="required"> <br>
		<input type="number" name="b1" id="b2" class="" value="" required="required"> <br>
		<input type="radio" name="c1" id="c2" class="" value="input[type=radio]1" checked="checked"> <br>
		<input type="radio" name="c1" id="c3" class="" value="input[type=radio]2" > <br>
		<!--  name값이 동일해야 둘중 하나 선택임 -->
		<input type="checkbox" name="d1" id="d2" class="" value="input[type=checkbox]1" required="required"> <br>
		<input type="checkbox" name="d1" id="d3" class="" value="input[type=checkbox]2" required="required"> <br>
		<input type="checkbox" name="d1" id="d4" class="" value="input[type=checkbox]3" required="required"> <br>
		<select name="e1" id="e2" class=""> 
			<option value="값1">네임1</option>
			<option value="값2">네임2</option>
			<option value="값3">네임3</option>
		</select>	<br>
		<textarea name="f1" id="f2" row="" cols="" required="required"></textarea><br>
		<input type="file" name="g1" id="g2" class="" value=""> <br>
		<button type="submit" onclick="valueChk()">버튼</button>
	</form>
	<script>
		function valueChk(){
			alert("내가 먼저 너가 먼저");
			return true;
		}
	</script>
</body>
</html>