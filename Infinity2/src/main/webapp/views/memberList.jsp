<%@page import="model.MemberVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MemberVO> list =(List<MemberVO>) request.getAttribute("list");
%>

<%@ include file="includes/header.jsp" %>
  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-12">
				<h4 class="m-b-lg">회원관리</h4>
			</div><!-- END column -->

			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">회원 목록</h4>
					<p class="m-b-lg docs">
						가입된 회원목록입니다. 1년간 로그인이 없을 시 탈퇴회원 또는 휴면계정으로 변환하셔야합니다.
					</p>
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>#순번</th>
								<th>아이디</th>
								<th>회원 이름</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>가입 일자</th>
								<th>관리</th>
							</tr>
<%
int num = 1;

	Iterator<MemberVO> it = list.iterator();
	while(it.hasNext()){
		MemberVO data = it.next();
	
%>
							<tr>
								<td><%=num++ %></td>
								<td><%=data.getMb_id() %></td>
								<td><%=data.getMb_name() %></td>
								<td><%=data.getMb_email() %></td>
								<td><%=data.getMb_phone() %></td>
								<td><%=data.getMb_birth() %></td>
								<td><%=data.getMb_gender() %></td>
								<td><%=data.getMb_joindate() %></td>
								<td><button data-mb_id="<%=data.getMb_id() %>" class="btn">탈퇴</button></td>
							</tr>
<%
	}						
	
	if(num == 1){
		
	
%>
							<tr>
								<td colspan="9">가입된 회원이 없습니다.</td>
							</tr>
		
<%
	}
%>					
						</table>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
<script>
$(document).ready(function(){
	$('.btn').on("click",function(){
		let mb_id = $(this).data('mb_id');
		let pe = $(this).parent().parent();
		//console.log(mb_id);
		
		if(confirm('정말로 탈퇴하시겠습니까?')){
			// ajax 통신
	        $.ajax({
	            type : "POST",            // HTTP method type(GET, POST) 형식이다.
	            url : "../ajax/ajax.memberAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
	            data : {mb_id:mb_id},            // Json 형식의 데이터이다.
	            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	                // 응답코드 > 0000
	                if(res == 'Success'){
	                	//location.reload();  //새로고침
	                	
	                	pe.remove();
	                }
	               //console.log("["+res+"]");
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                console.log("통신 실패.")
	            }
	        });
		}
	})
}); 
</script>

 <%@ include file="includes/footer.jsp" %>