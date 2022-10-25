<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div>
	    <h4>노선</h4>
	    <div class="sltbox">
	        <select name="line" id="line" class="" onchange="lineChg();">
	        	<option value="">노선을 선택하세요</option>
	            <option value="A노선">A노선</option>
	            <option value="B노선">B노선</option>
	            <option value="C노선">C노선</option>
	        </select>
	    </div>
	</div>
	
	<div>
	    <h4 class="inline">탑승장소</h4> <span>(※노선을 먼저 선택해주세요)</span>
	    <div class="sltbox">
	        <select name="loc" id="loc" class="">
	        <option value="">노선을 먼저 선택해주세요</option>
	        </select>
	    </div>
	</div>
	<script>
	function lineChg(){
		let listSel = document.getElementById('loc');
		let itemLi ="";
		let line = [ ['A-1','A-2','A-3'],
					 ['B-1','B-2','B-3','B-4','B-5','B-6'],
		 			 ['C-1','C-2','C-3'] ];
		let selIdx = document.getElementById('line').selectedIndex;
		console.log("change"+selIdx);
		if(selIdx !=0){
			for(let i = 0 ; i < line[selIdx-1].length; i++){
			itemLi += "<option value='"+line[selIdx-1][i]+"'>"+line[selIdx-1][i]+"</option>";
			}
		} else {
			itemLi += "<option value=''>노선을 먼저 선택해주세요</option>";
		}
		
		//itemLi += "<option value='"+line[selIdx-1][1]+"'>"+line[selIdx-1][1]+"</option>";
		//itemLi += "<option value='"+line[selIdx-1][2]+"'>"+line[selIdx-1][2]+"</option>";
			
		listSel.innerHTML = itemLi;
		
		
				
	}
	</script>
</body>
</html>