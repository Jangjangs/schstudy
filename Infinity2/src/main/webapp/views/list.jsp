<%@page import="model.PagingDTO"%>
<%@page import="model.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
PagingDTO paging = (PagingDTO) request.getAttribute("paging");

%>
  <%@ include file="includes/header.jsp" %>
  
  <style>
  .wrap{
  	padding
  }
  </style>

  <div class="wrap">
	<section class="app-content">
		<div class="row">
				<div class="col-md-12">
				<%=paging.getP() %>/<%=paging.getTotalPage() %>
					<div class="mail-toolbar m-b-lg pull-right">								
						<div class="btn-group pull-right" role="group">
							<a href="?p=<%=paging.getP()-1 %>" class="btn btn-default <%=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-chevron-left"></i></a>
							<a href="?p=<%=paging.getP()+1 %>" class="btn btn-default <%=(paging.getP() ==paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-chevron-right"></i></a>
						</div>
						
						<div class="btn-group" role="group" style="margin-left:1rem;">
							<a href="Write" class="btn btn-default">글쓰기</a>
						</div>
					</div>
				</div>
		</div>
<div class="col-md-12">
			<div class="widget p-lg">
				<h4 class="m-b-lg">게시판</h4>
				<p class="m-b-lg docs">설명</p>
				<div class="table-responsive">
					<table class="table">
<%
//boolean dataChk = false;  //boolean기본타입은 false
String dataChk = "false";
int rowNum= paging.getTotal()-((paging.getP()-1)*paging.getPageRow());
Iterator<BoardVO> it = list.iterator();
while(it.hasNext()){
	BoardVO data = it.next();

%>					
						<tr>
							<td><%=rowNum-- %>
							<a href="View?bo_num=<%=data.getBo_num()%>"><%=data.getBo_title() %></a></td>
							<td align="right"><%=data.getBo_inputdate() %></td>
						</tr>
<%
dataChk = "true";
}

//if(!dataChk)
	//if(dataChk == false){
	if("false".equals(dataChk)){
%>

						<tr>
							<td colspan="8">등록된 글이 없습니다.</td>
						</tr>
<%
	}
%>
					</table>
				</div>
			</div>
			<!-- .widget -->
			</div><!-- END column -->
	
	</section><!-- #dash-content -->
</div><!-- .wrap -->


 
 <%@ include file="includes/footer.jsp" %>