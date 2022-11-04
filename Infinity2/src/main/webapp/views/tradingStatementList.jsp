<%@page import="model.TradingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.PagingDTO"%>
<%@page import="model.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%
List<TradingVO> list = (List<TradingVO>) request.getAttribute("list");
PagingDTO paging = (PagingDTO) request.getAttribute("paging");

%> --%>
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
				<c:out value="${paging.p }" /><%//=paging.getP() %>/<c:out value="${paging.totalPage }" /><%//=paging.getTotalPage() %>
					<div class="mail-toolbar m-b-lg pull-right">								
						<div class="btn-group pull-right" role="group">
							<a href="?p=<c:out value="${paging.p-1 }" /><%//=paging.getP()-1 %>" class="btn btn-default <c:out value="${paging.p eq 1?'disabled':''}" /><%//=(paging.getP() == 1)?"disabled":"" %>"><i class="fa fa-chevron-left"></i></a>
							<a href="?p=<c:out value="${paging.p+1 }" /><%//=paging.getP()+1 %>" class="btn btn-default <c:out value="${paging.p eq paging.totalPage?'disabled':''}" /><%//=(paging.getP() ==paging.getTotalPage())?"disabled":"" %>"><i class="fa fa-chevron-right"></i></a>
						</div>
						
						<div class="btn-group" role="group" style="margin-left:1rem;">
							<a href="TradingWrite" class="btn btn-default">글쓰기</a>
						</div>
					</div>
				</div>
		</div>
<div class="col-md-12">
			<div class="widget p-lg">
				<h4 class="m-b-lg">거래명세서</h4>
				<p class="m-b-lg docs">설명</p>
				<div class="table-responsive">
					<table class="table">
<%-- <%
//boolean dataChk = false;  //boolean기본타입은 false
String dataChk = "false";
int rowNum= paging.getTotal()-((paging.getP()-1)*paging.getPageRow());
Iterator<TradingVO> it = list.iterator();
while(it.hasNext()){
	TradingVO data = it.next();

%>		 --%>
<c:set var="dataChk" value="false" />	
<c:set var="rowNum" value="${paging.total-((paging.p-1)*paging.pageRow) }" />	
<c:forEach items="${list}" var="data">
						<tr>
							<td><c:out value="${rowNum}" /><%//=rowNum-- %>
							<a href="TradingView?tra_num=<c:out value="${data.tra_num}" /><%//=data.getTra_num()%>"><c:out value="${data.tra_account}" /><%//=data.getTra_account() %></a></td>
							<td align="right"><fmt:formatDate value="${data.tra_inputdate }"/> <%//=data.getTra_inputdate() %></td>
						</tr>
<c:set var="rowNum" value="${rowNum-1}" />
<c:set var="dataChk" value="true" />	
</c:forEach>	
<%-- <%
dataChk = "true";
}

//if(!dataChk)
	//if(dataChk == false){
	if("false".equals(dataChk)){
%> --%>
<c:if test="${dataChk eq 'false' }">

						<tr>
							<td colspan="2">등록된 글이 없습니다.</td>
						</tr>
</c:if>
<%-- <%
	}
%> --%>
					</table>
				</div>
			</div>
			<!-- .widget -->
			</div><!-- END column -->
	
	</section><!-- #dash-content -->
</div><!-- .wrap -->


 
 <%@ include file="includes/footer.jsp" %>