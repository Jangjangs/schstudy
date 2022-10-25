<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="text" name="a1" id="a2" class="" value=""> <br>
		<input type="number" name="b1" id="b2" class="" value=""> <br>
		<input type="radio" name="c1" id="c2" class="" value=""> <br>
		<input type="radio" name="c1" id="c3" class="" value=""> <br>
		<!--  name값이 동일해야 둘중 하나 선택임 -->
		<input type="checkbox" name="d1" id="d2" class="" value=""> <br>
		<input type="checkbox" name="d1" id="d3" class="" value=""> <br>
		<input type="checkbox" name="d1" id="d4" class="" value=""> <br>
		<select name="e1" id="e2" class=""> 
			<option value="값1">네임1</option>
			<option value="값2">네임2</option>
			<option value="값3">네임3</option>
		</select>	<br>
		<textarea name="f1" id="f2" row="" cols=""></textarea><br>
		<input type="file" name="g1" id="g2" class="" value=""> <br>
		<button type="button" onclick="valueChk()">버튼</button>
	</form>
	<script>
		function valueChk(){
			//document.forms[0].a1.value);   /* 폼태그가 하나밖에없어서 첫번째 폼태그 */
			document.getElementById('a2').value='42';  
			document.getElementById('b2').value='42';  
			document.getElementById('c2').checked;  
			document.getElementById('c3').checked = true;  
			document.getElementById('d2').checked = true;  
			document.getElementById('d3').checked = false;
			document.getElementById('d4').checked = true;
			//document.getElementById('e2').value;  
			//document.getElementById('e2').selectedIndex=1;
			document.getElementById('e2').options[1].selected = true;
			//document.getElementById('e2').options[document.getElementById('e2').selectedIndex].value;
			document.getElementById('f2').value='42';
			//document.getElementById('g2').value;
		}
	</script>
</body>
</html>