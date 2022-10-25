<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
//continue문
for(let i = 1; i < 340; i++){
	let strNum = String(i); //숫자를 문자로
	let arrNum = [...strNum]; //문자를 배열로
	let strJJak = "";
	
	for(let j = 0; j< arrNum.length; j++){
		if(arrNum[j].indexOf('3') == 0 || arrNum[j].indexOf('6') == 0 || arrNum[j].indexOf('9') == 0){
			strJJak += "짝";
		}
			
	}
	document.write(i+" : ");
	if(strJJak == ""){
		document.write(i);
	} else {
		document.write(strJJak);
	}
	document.write("<br/>")
}
</script>
</body>
</html>