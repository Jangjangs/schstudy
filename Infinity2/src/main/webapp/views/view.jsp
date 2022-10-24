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
						<h4 class="widget-title">글내용</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									<%=view.getBo_title() %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성자:</label>
								<div class="col-sm-9">
									<%=view.getBo_mb_name() %>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">내용:</label>
								<div class="col-sm-9">
								<%=view.getBo_content().replace("\r\n", "<br>") %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성일:</label>
								<div class="col-sm-9">
									<%=view.getBo_inputdate() %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-sm-offset-8">
								
								<!-- 글쓴아이디와 로그인된 아이디가 같을 경우 글수정과 글삭제버튼 노출 -->
								<!-- 글쓴아이디와 로그인된 아이디가 다를 경우 글수정과 삭제버튼이 안보임 -->
								<%-- <%=sess_id %>/<%=view.get("bo_mb_id") %> --%>
								<%
								if(sess_id.equals(view.getBo_mb_id())){
								%>
									<a href="Modify?bo_num=<%=view.getBo_num() %>" class="btn btn-success">글수정</a>
									<a href="javascript:void(0);" class="btn btn-success" onclick="del()">글삭제</a>
									<%
								}
									%>
									<a href="list.jsp" class="btn btn-success">글목록</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		
<form id="sendfrm" method="post" action="deleteAct.jsp">
<input type="hidden" name="bo_num" value="<%=view.getBo_num() %>">
</form>	
<script>
 function del(){
	 if(confirm("정말로 삭제하시겠습니까?")){
		 document.getElementById('sendfrm').submit();
	 }
 }
</script>			
    <%@ include file="includes/footer.jsp" %>