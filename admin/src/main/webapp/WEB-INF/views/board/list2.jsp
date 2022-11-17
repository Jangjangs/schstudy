<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	<div class="wrap">
		<div class="row">
		<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">게시판</h4>
					<p class="m-b-lg docs">
						Create responsive tables by wrapping any <code>.table</code> in <code>.table-responsive</code> to make them scroll horizontally on small devices (under 768px). When viewing on anything larger than 768px wide, you will not see any difference in these tables.
					</p>
					<div style="text-align:right;" class="form-group"><a href="register" class="btn btn-default btn-sm" role="btn">New register</a></div>
					<div class="table-responsive">
						<table class="table">
						<colgroup>
						<col style="width:80px"/>
						<col style=""/>
						<col style="width:100px"/>
						<col style="width:150px"/>
						<col style="width:150px"/>
						<col style="width:80px"/>
						</colgroup>
						
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
								<th>조회수</th>
							</tr>
							<c:set value="0" var="rowCnt"/>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }"/></td>
								<td><a href="get?bno=<c:out value="${board.bno }"/>">
								<c:out value="${board.title }"/></a></td>
								<td><c:out value="${board.writer }"/></td>
								<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td><fmt:formatDate value="${board.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${board.hit }</td>
							</tr>
							<c:set value="${rowCnt+1 }" var="rowCnt"/>
							</c:forEach>
							
							<c:if test="${rowCnt eq 0}">
							<tr>
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
							</c:if>
						</table>
					</div>
				<div class="row">
					<div class="col-md-6 pagination">
					<form action="" class="form-inline">
						<select name="type" class="form-control" style="min-width: 10px;">
							<option value="">선택</option>
							<option value="T">제목</option>
							<option value="C">내용</option>
							<option value="W">작성자</option>
							<option value="TC">제목+내용</option>
							<option value="TCW">전체</option>
						</select>
						<input type="text" name="keyword" class="form-control">
						<button class="btn btn-default">검색</button>
					</form>
					</div>
					
					<div class="col-md-6">
					<!-- page -->
				<nav style="text-align:right;">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
					  		<li>
					    		<a href="?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword}" aria-label="Previous">
					      			<span aria-hidden="true">&laquo;</span>
					     		</a>
					   		</li>
					 	</c:if>
					 
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="num">
					 		<c:if test="${pageMaker.cri.pageNum eq num}">
					    		<li  class="active" >
					    			<a>${num} </a>
					   			</li>
					   		</c:if>
					   		<c:if test="${pageMaker.cri.pageNum ne num}">
					   			<li>
					    			<a href="?pageNum=${num}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword}">${num }</a>
					    		</li>
					    	</c:if>
						</c:forEach>
					 
						<c:if test="${pageMaker.next}">
					  		<li>
					     		<a href="?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword}" aria-label="Next">
					     			<span aria-hidden="true">&raquo;</span>
					     		</a>
					  		</li>
						</c:if>
					</ul>
				</nav>
					<!-- page -->
					</div>
				</div>
				</div><!-- .widget -->
			</div><!-- END column -->
		</div>
	</div>
	
<%@ include file="../includes/footer.jsp" %>