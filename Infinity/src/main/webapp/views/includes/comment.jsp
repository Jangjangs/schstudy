<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String bo_num = request.getParameter("bo_num"); 
    %>
<!--  댓글 시작 -->
						<div>
							<h4 class="widget-title">댓글</h4>
							<form method="post" action="commentAct.jsp">
							<input type="hidden" name="com_refnum" value="<%=bo_num %>">
								<div class="form-group">
									<input type="text" name="com_content" class="form-control" required="required">
										<div style="text-align:right">
											<button class="btn btn-default">입력</button>
										</div>
								</div>
							</form>
						</div>