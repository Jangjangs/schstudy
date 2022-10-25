<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img{
	width:100px;
}
</style>
</head>
<body>
<div id="1st" style="position:absolute; top:0; left:0px; display:inline;">
<img src="1.jpg" alt="">
</div>
<div id="2nd" style="position:absolute; top:100px; left:0px; display:inline;">
<img src="2.jpg" alt="">
</div>
<div id="3rd" style="position:absolute; top:200px; left:0px; display:inline;">
<img src="3.png" alt="">
</div>

<script>
//for(let i=0; i<100;i++){
	let strNum1 = parseInt(document.getElementById("1st").style.left);
	let strNum2 = parseInt(document.getElementById("2nd").style.left);
	let strNum3 = parseInt(document.getElementById("3rd").style.left);
	var maxArray = [0,0,0];
	var isBreak = 0;
	
	let status = setInterval(function(){
		
		strNum1 += (Math.random()*10)+2;
		document.getElementById("1st").style.left=strNum1+"px";	
		maxArray[0] = strNum1;
		
		strNum2 += (Math.random()*10)+2;
		document.getElementById("2nd").style.left=strNum2+"px";	
		maxArray[1] = strNum2;
		
		strNum3 += (Math.random()*10)+2;
		document.getElementById("3rd").style.left=strNum3+"px";	
		maxArray[2] = strNum3;
		
		isBreak=Math.max(...maxArray);
		if(isBreak >= 1000){
			clearInterval(status);
		}
	}, 300);
	
//}
	console.log(document.getElementById("1st").style.left);
	console.log(parseFloat(document.getElementById("1st").style.left));
</script>
</body>
</html>