<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p id="demo">

</p>
<script>
let arr=
	['강원도','경기도','경상남도','경상북도','전라남도','전라북도','충청남도','충청북도'];
	
	
let txt="";   
	txt += '<ul id="ul">'	//txt='<ul id="ul">' 
		for(let i=0;i<arr.length;i++){
			txt += "<li>"+arr[i]+"</li>"
			
		}
		txt += "</ul>";
		document.getElementById("demo").innerHTML=txt;
	
</script>
	

</body>
</html>