<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="includes/header.jsp" %>
  
			<div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글쓰기</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form method= "post" class="form-horizontal" action="">
						<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">카테고리:</label>
								<div class="col-sm-9">
									<select id="bo_category" name="bo_category" class="form-control">
										<option value="html">HTML</option>
										<option value="css">CSS</option>
										<option value="js">JS</option>
								</select>
							</div>
						</div>
						
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									<input id="bo_title" type="text" name="bo_title" class="form-control" id="exampleTextInput1" placeholder="제목을 입력하세요">
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">내용:</label>
								<div class="col-sm-9">
									<textarea id="bo_content" name="bo_content" class="form-control" id="textarea1" placeholder="내용을 입력하세요..."></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button id=writebtn type="submit" class="btn btn-success">글쓰기</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

<script>
$(document).ready(function(){
	$('#writebtn').on('click',function(e){
		e.preventDefault();
		let bo_category = $('#bo_category').val();
		let bo_title = $('#bo_title').val();
		let bo_content = $('#bo_content').val();
		
		if(bo_title == ''){
			alert("제목을 입력해주세요.");
			$('#bo_title').css("border","1px solid red");
			$('#bo_title').focus();
		} else if(bo_content == ''){
			alert("내용을 입력해주세요.");
			$('#bo_content').css("border","1px solid red");
			$('#bo_content').focus();
		}else{
			$('form').submit();			
			
		}
		
		
	});
});



</script>
			
    <%@ include file="includes/footer.jsp" %>