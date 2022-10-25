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
<div id="stage">

</div>
<script>
	//inner로 DIV추가
	let txt="";
	let cars=["1.jpg","2.jpg","3.png"];
	for(let i =0 ;i <3 ; i++){
	txt+='<div id="'+(i+1)+'st" style="position:absolute; top:'+(i*100)+'px; left:0px; display:inline;">';
	txt+='<img src="'+cars[i]+'" alt="">';
	txt+='</div>';
	}
	console.log(cars[0]);
	document.getElementById("stage").innerHTML = txt;
	var maxArray = [0,0,0];
	var isBreak = 0;
	let strNum= new Array();
	for(let i =0 ;i <3 ; i++){
		strNum[i] = parseInt(document.getElementById((i+1)+"st").style.left);	
	}
	
	
	let status = setInterval(function(){
		for(let i = 0; i<3; i++){
			strNum[i] += (Math.random()*10)+2;
			document.getElementById((i+1)+"st").style.left=strNum[i]+"px";	
			maxArray[0] = strNum[i];
		}		
		
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