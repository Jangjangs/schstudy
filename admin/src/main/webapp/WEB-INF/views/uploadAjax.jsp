<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/admin/resources/libs/bower/jquery/dist/jquery.js"></script>
</head>
<body>
<h1>Upload with Ajax</h1>
<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple="multiple" accept="image/*">
</div>

<button id="uploadBtn">Upload</button>

<div class="uploadResult">
	<ul>
		
	</ul>
</div>

<script type="text/javascript">
var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp)$"); //정규표현식
var maxSize = 1024*1024*5; //5mb

function checkExtension(fileName, fileSize){
	//용량체크
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	//허용확장자체크
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}

function showUploadFile(uploadResultArr){
	console.log(uploadResultArr);
	let str = "";
	$(uploadResultArr).each(function( i, obj){
		//str += "<li>" + obj.fileName + "</li>";
		//obj.image // 이미지일 경우에 처리
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<li><a href='download?fileName=" + fileRealPath + "'>";
		str += "<img src='display?fileName=" + fileCallPath + "'></a>";
		str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
	});
	
	$(".uploadResult ul").append(str); //html
}

$(document).ready(function(){
	
	$(".uploadResult").on("click","span", function(){
		//console.log("span click");
		let targetRealfile = $(this).data("realfile"); //원본파일
		let targetfile = $(this).data("file"); //썸네일파일
		let type = $(this).data("type");
		let span = $(this);
		
		console.log(targetfile);
		console.log(type);
		
		$.ajax({
			url: "deleteFile",
			data:{
				fileRealName:targetRealfile,
				fileName:targetfile,
				type:type
			},
			dataType:"text",
			type:"POST",
			success:function(result){
				console.log(result);
				if("delete" == result){
					span.parent().remove();
				}
			}
		});
	});
	
	var cloneObj = $(".uploadDiv").clone();
	
	$(document).on("click", "#uploadBtn",function(){
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		console.log(files);
		
		for(var i = 0;  i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:"uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			success:function(result){
				//console.log(result);
				//alert("Success");
				
				//파일선택을 초기화
				$(".uploadDiv").html(cloneObj.html());
				
				
				//파일 목록 출력
				showUploadFile(result);
				
			}
		});
	});
});
</script>
</body>
</html>