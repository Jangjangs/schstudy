<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
	<div class="wrap">
		<div class="row">
		<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board Register</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								Use Bootstrap's predefined grid classes to align labels and groups of form controls in a horizontal layout by adding <code>.form-horizontal</code> to the form (which doesn't have to be a <code>&lt;form&gt;</code>). Doing so changes <code>.form-groups</code> to behave as grid rows, so no need for <code>.row</code>.
							</small>
						</div>
						<form id="frm" method="post" class="form-horizontal" action="">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" name="title" id="title" placeholder="Title" required="required">
								</div>
							</div>
						
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">Content:</label>
								<div class="col-sm-9">
									<textarea class="form-control input-sm" name="content" id="content" placeholder="Your content..." required="required"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" name="writer" id="writer" placeholder="Writer" readonly="readonly" required="required" value="<sec:authentication property="principal.username"/>">
									
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" class="btn btn-success btn-sm">Submit Button</button>
									<button type="reset" class="btn btn-success btn-sm">Reset Button</button>
								</div>
							</div>
							<!-- 첨부파일 -->
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3">
									<label for="uploadFile" class="col-sm-3 control-label">Attach File:</label>
									<div class="col-sm-9 uploadDiv">
									<input type="file" class="form-control input-sm" name="uploadFile" id="uploadFile" placeholder="uploadFile" multiple="multiple">
								</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3">
									<label for="uploadFile" class="col-sm-3 control-label"></label>
									<div class="col-sm-9 uploadResult">
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		</div>
	</div>

<script type="text/javascript">
var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp|zip|hwp)$"); //정규표현식
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
	
	if(!uploadResultArr || uploadResultArr.length == 0){
		return;
	}
	
	//console.log(uploadResultArr);
	let str = "";
	$(uploadResultArr).each(function( i, obj){
		//str += "<li>" + obj.fileName + "</li>";
		if(obj.image){ // 이미지일 경우에 처리
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName=" + fileRealPath + "'>";
		str += "<img src='../display?fileName=" + fileCallPath + "'></a>";
		str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
		} else{
			var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName=" + fileRealPath + "'>";
			str += "파일아이콘";
			str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='file'>X</span></li>";
		}
	});
	
	$(".uploadResult ul").append(str); //html
}

$(document).ready(function(){
	$("button[type=submit]").on("click",function(e){
		e.preventDefault();
		
		let title = $("#title").val();
		let content = $("#content").val();
		let writer = $("#writer").val();
		if(title == ''){
			alert("제목을 입력하세요.");
			return;
		}
		if(content == ''){
			alert("내용을 입력하세요.");
			return;
		}
		if(writer == ''){
			alert("작성자를 입력하세요.");
			return;
		}
		
		let str = "";
		$(".uploadResult ul li").each(function(i, obj){
			console.log(obj);
			str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+$(obj).data('filename')+'">';
			str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+$(obj).data('uuid')+'">';
			str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+$(obj).data('path')+'">';
			str += '<input type="hidden" name="attachList['+i+'].fileType" value="'+$(obj).data('type')+'">';
		});
		
		$("#frm").append(str).submit();
	});
	
	
	//var cloneObj = $(".uploadDiv").clone();
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type=file]").on("change",function(){
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		//console.log(files);
		
		for(var i = 0;  i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:"/admin/uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				//console.log(result);
				//alert("Success");
				
				//파일선택을 초기화
				$("#uploadFile").val('');
				
				
				//파일 목록 출력
				showUploadFile(result);
				
			}
		});
		

	});
	
	$(".uploadResult").on("click","span", function(){
		//console.log("span click");
		let targetRealfile = $(this).data("realfile"); //원본파일
		let targetfile = $(this).data("file"); //썸네일파일
		let type = $(this).data("type");
		let span = $(this);
		
		//console.log(targetfile);
		//console.log(type);
		
		$.ajax({
			url: "../deleteFile",
			data:{
				fileRealName:targetRealfile,
				fileName:targetfile,
				type:type
			},
			dataType:"text",
			type:"POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				//console.log(result);
				if("delete" == result){
					span.parent().remove();
					
					//$(".uploadDiv").html(cloneObj.html());
				}
			}
		});
	});
	
});
</script>
<%@ include file="../includes/footer.jsp" %>