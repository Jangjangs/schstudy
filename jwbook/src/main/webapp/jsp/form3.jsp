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
		<input type="radio" name="c1" id="c2" class="" value="input[type=radio]1"> <br>
		<input type="radio" name="c1" id="c3" class="" value="input[type=radio]2"> <br>
		<!--  name값이 동일해야 둘중 하나 선택임 -->
		<input type="checkbox" name="d1" id="d2" class="" value="input[type=checkbox]"> <br>
		<input type="checkbox" name="d1" id="d3" class="" value="input[type=checkbox]"> <br>
		<input type="checkbox" name="d1" id="d4" class="" value="input[type=checkbox]"> <br>
		<select name="e1" id="e2" class=""> 
			<option value="">선택/전체</option>
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
			console.log(document.getElementsByName('c1').length);
			//if(document.forms[0].a1.value);   /* 폼태그가 하나밖에없다 첫번째 폼태그 */
			if(document.getElementById('a2').value ==''){alert('값을 반드시 입력하세요.');}  
			if(document.getElementById('b2').value ==''){alert('값을 반드시 입력하세요.');}  
			
			let c1=false;
			for(let i = 0; i < document.getElementsByName('c1').length; i++){
				if(document.getElementsByName('c1')[i].checked){
					c1 = true;
					break;
				}
			}  
			if(!c1){alert('값을 반드시 체크하세요.');}   //not연산자 !c1했을때 true면 출력
			
			
			let j = 0;
			for(let i = 0; i < document.getElementsByName('d1').length; i++){
				if(document.getElementsByName('d1')[i].checked){
					j++;
										
				}
			}  
			if(j<2){alert('두개 이상의 값을 반드시 선택하세요.');}
			 
		
			//if(document.getElementById('e2').selectedIndex == 0){
			//	alert("값을 선택해주세요.");	
			//}
			
			if(document.getElementById('e2').value == ''){
				alert("값을 선택해주세요.");	
			}
			if(document.getElementById('f2').value == ''){alert('값을 입력해주세요.'');}
			if(document.getElementById('g2').value == ''){alert('파일을 등록해주세요.');}
		}
	</script>
</body>
</html>