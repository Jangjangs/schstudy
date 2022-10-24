
<%@page import="model.BoardVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  BoardVO view = (BoardVO) request.getAttribute("view");  
  %>
  <%@ include file="includes/header.jsp" %>
  
			<div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글수정</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form method= "post" class="form-horizontal" action="">
						<!-- 없는 타입을 쓰면 텍스트로 출력됨  hiddena-->
						<input id="bo_num" type="hidden" name="bo_num" value="<%=view.getBo_num() %>">
							<div class="form-group">
								<label  for="bo_category" class="col-sm-3 control-label">카테고리:</label>
								<div class="col-sm-9">
									<select id="bo_category" name="bo_category" class="form-control">
										<option value="html" <%="html".equals(view.getBo_category())?"selected":"" %>>HTML</option>
										<option value="css" <%="css".equals(view.getBo_category())?"selected":"" %> >CSS</option>
										<option value="js" <%="js".equals(view.getBo_category())?"selected":"" %>>JS</option>
								</select>
							</div>
							</div>
							<div class="form-group">
								<label for="bo_title" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									<input id="bo_title" type="text" name="bo_title" class="form-control" id="exampleTextInput1" value="<%=view.getBo_title() %>" placeholder="제목을 입력하세요">
								</div>
							</div>
							
							<div class="form-group">
								<label for="bo_content" class="col-sm-3 control-label">내용:</label>
								<div class="col-sm-9">
									<textarea id="bo_content" class="form-control" name="bo_content" id="textarea1" placeholder="내용을 입력하세요..."><%=view.getBo_content() %></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-4 col-sm-offset-8">
									<button id="modifybtn" type="submit" class="btn btn-success">글수정</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
			
<script>

$(document).ready(function(){
	$('#modifybtn').on('click',function(e){
		e.preventDefault();
		
		let bo_num = "<%=view.getBo_num() %>";
		let bo_category = $('#bo_category').val().trim();
		let bo_title = $('#bo_title').val().trim();
		let bo_content = $('#bo_content').val().trim();
		
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