<%@page import="java.util.Iterator"%>
<%@page import="model.TradingDetailVO"%>
<%@page import="java.util.List"%>
<%@page import="model.TradingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    


  <%@ include file="includes/header.jsp" %>
  	<div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">거래명세서</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								<!-- 설명 -->
							</small>
						</div>
						<form method="post" class="form-horizontal" action="">
						<input type="hidden" name="tra_num" value='<c:out value="${trading.tra_num}"/><%//=request.getParameter("tra_num") %>'> 
						<label>공급받는자</label>
						<input type ="text" name ="tra_account" class="form-control" value="${trading.tra_account}<%//=trading.getTra_account()%>">
							<table class="table" id="crew">
								<tr>
									<th>월일</th>
									<th>품목</th>
									<th>규격</th>
									<th>수량</th>
									<th>단가</th>
									<th>공급가액</th>
									<th>세액</th>
									<th>비고</th>
									<th></th>
								</tr>

<c:set value="0" var="idx"/>
								<c:forEach items="${list}" var="tradingDetail">
								<tr>
							<td><input type="date" name="tradingDate" id="tradingDate${idx}" class="form-control" value='<fmt:formatDate value="${tradingDetail.trad_tradingDate}" pattern="yyyy-MM-dd"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td><input type="text" name="subject" id="subject${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_subject }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td><input type="text" name="standard" id="standard${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_standard }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td><input type="text" name="quantity" id="quantity${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_quantity }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="assignment(${idx}); updatefrm(this)"></td>
									<td><input type="text" name="unitPrice" id="unitPrice${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_unitPrice }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="assignment(${idx}); updatefrm(this)"></td>
									<td><input type="text" name="supplyPrice" id="supplyPrice${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_supplyPrice }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td><input type="text" name="taxAmount" id="taxAmount${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_taxAmount }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td><input type="text" name="note" id="note${idx}" class="form-control" value='<c:out value="${tradingDetail.trad_note }"/>' data-trad_num='<c:out value="${tradingDetail.trad_num }"/>' onchange="updatefrm(this)"></td>
									<td>
							<c:if test="${(fn:length(list)-1) eq idx}">																
										<button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>
										<button type="button" id=""class="btn btn-default" onclick="delItem(this)">-</button>
										</c:if>
							
						</tr>
<c:set value="${idx +1}" var="idx" />
		</c:forEach>

<c:if test="${idx eq 0 }">
<tr>
							<td><input type="date" name="tradingDate" id="tradingDate${idx }" class="form-control" value=""></td>
							
							<td><input type="text" name="subject" id="subject${idx }" class="form-control" value=""></td>
							
							<td><input type="text" name="standard" id="standard${idx }" class="form-control" value=""></td>
							
							
							<td><input type="text" name="quantity" id="quantity${idx }" class="form-control" value="" onchange="assignment(<c:out value='${idx }' />);"></td>
							
							
							
							<td><input type="text" name="unitPrice" id="unitPrice${idx }" class="form-control" value="" onchange="assignment(<c:out value='${idx }' />);"></td>
							
							
							<td><input type="text" name="supplyPrice" id="supplyPrice${idx }" class="form-control" value=""></td>
							
							
							
							<td><input type="text" name="taxAmount" id="taxAmount${idx }" class="form-control" value=""></td>
							
							
							
							<td><input type="text" name="note" id="note${idx }" class="form-control" value=""></td>
							
							
							
							<td><button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>
							<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>
							
							
							
							
						</tr>
</c:if>	

					</table>
					<button type="submit">거래명세서 수정</button>
				</form>
			</div><!-- .widget-body -->
		</div><!-- .widget -->
	</div><!-- END column -->
<script type="text/javascript">
	function delItem(t){
		len =$('#crew tr').length;
		if(len > 2){
			$(t).parent().parent().remove();
			let html = "";
			html += '<button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>';
			html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button>';
			
			console.log(len);
			$("#crew > tbody > tr:nth-child("+(len-1)+") > td:nth-child(9)").append(html);
		} else{
			alert('더 이상 지울수없습니다.');
		}
		
	}
	function addItem(t){
		
		//자신삭제
		$(t).parent().empty();
		
		let len = $('#crew tr').length;
		console.log(len);
		
		let html = "";
		html += '<tr>';
		html += '<td><input type="date" name="tradingDate" id="tradingDate'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><input type="text" name="subject" id="subject'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><input type="text" name="standard" id="standard'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><input type="text" name="quantity" id="quantity'+len+'" class="form-control" onchange="assignment('+len+'); insertfrm(this)"></td>';
		html += '<td><input type="text" name="unitPrice" id="unitPrice'+len+'" class="form-control" onchange="assignment('+len+'); insertfrm(this)"></td>';
		html += '<td><input type="text" name="supplyPrice" id="supplyPrice'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><input type="text" name="taxAmount" id="taxAmount'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><input type="text" name="note" id="note'+len+'" class="form-control" onchange="insertfrm(this)"></td>';
		html += '<td><button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>';
		html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>';
		html += '</tr>';
		
		//console.log("addItem"+html);
		
		$('#crew:last').append(html);
	}
	
function updatefrm(t){
	//data-trad_num = ""
	//console.log("날짜바뀜"+$(t).data('trad_num'));
	let trad_num = $(t).data('trad_num');
	let trad_value = $(t).val();
	let trad_name = $(t).attr('name');
	//console.log(trad_name);
	
	 $.ajax({
         type : "POST",            // HTTP method type(GET, POST) 형식이다.
         url : "../ajax/ajax.tradingUpdateAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
         data : {trad_num:trad_num,
        	 trad_value:trad_value,
        	 trad_name:trad_name},            // Json 형식의 데이터이다.
         success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
             console.log(res);
         },
         error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
             console.log("통신 실패.")
         }
     });
}


	
function insertfrm(t){
	
	let trad_refnum = "${trading.tra_num}"<%//=request.getParameter("tra_num") %>
	let trad_tradingDate , trad_subject, trad_standard, trad_quantity, trad_unitPrice
	let trad_supplyPrice, trad_taxAmount, trad_note;
	
	$(t).parent().parent().find('input').each(function(index,item){
		//console.log('element',$(item).attr('name'),$(item).val());
		if($(item).attr('name') == 'tradingDate' && $(item).val() != "") {
			trad_tradingDate = $(item).val();
		}
		if($(item).attr('name') == 'subject' && $(item).val() != "") {
			trad_subject = $(item).val();
		}
		if($(item).attr('name') == 'standard' && $(item).val() != "") {
			trad_standard = $(item).val();
		}
		if($(item).attr('name') == 'quantity' && $(item).val() != "") {
			trad_quantity = $(item).val();
		}
		if($(item).attr('name') == 'unitPrice' && $(item).val() != "") {
			trad_unitPrice = $(item).val();
		}
		if($(item).attr('name') == 'supplyPrice' && $(item).val() != "") {
			trad_supplyPrice = $(item).val();
		}
		if($(item).attr('name') == 'taxAmount' && $(item).val() != "") {
			trad_taxAmount = $(item).val();
		}
		if($(item).attr('name') == 'note' && $(item).val() != "") {
			trad_note = $(item).val();
		}
	});
	//console.log($(t).parent().parent().find('input'));
	
	//typeof trad_tradingDate != 'undefined'
	if(trad_tradingDate != undefined
		&& trad_subject != undefined
		&& trad_quantity != undefined
		&& trad_unitPrice != undefined
		&& trad_supplyPrice != undefined
		&& trad_taxAmount != undefined){

		$.ajax({
	         type : "POST",            // HTTP method type(GET, POST) 형식이다.
	         url : "../ajax/ajax.tradingInsertAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
	         data : {trad_refnum:trad_refnum,
	        	 trad_tradingDate:trad_tradingDate,
	        	 trad_subject:trad_subject,
	        	 trad_standard:trad_standard,
	        	 trad_quantity:trad_quantity,
	        	 trad_unitPrice:trad_unitPrice,
	        	 trad_supplyPrice:trad_supplyPrice,
	        	 trad_taxAmount:trad_taxAmount,
	        	 trad_note:trad_note},            // Json 형식의 데이터이다.
	         success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	             console.log(res);
	         		location.reload();
	         },
	         error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	             console.log("통신 실패.")
	         }
	    });	
	}
}
function assignment(target){
	
	$("#supplyPrice"+target).val($("#quantity"+target).val() * $("#unitPrice"+target).val());
	$("#taxAmount"+target).val($("#supplyPrice"+target).val()*0.1);
	
}

/* $(document).ready(function(){
	오늘 사용 안함
	1 수정인데 데이터 삭제 후 삽입
	2 ajax값 입력 onchange 이벤트로 저장
	3~4 +버튼으로 열추가하고 값입력 및 저장
	5.공급가액 세액 자동 계산
}); */
</script>
  
  <%@ include file="includes/footer.jsp" %>