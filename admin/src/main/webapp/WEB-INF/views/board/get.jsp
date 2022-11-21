<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includes/header.jsp" %>
	<div class="wrap">
		<div class="row">
		<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board View</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								Use Bootstrap's predefined grid classes to align labels and groups of form controls in a horizontal layout by adding <code>.form-horizontal</code> to the form (which doesn't have to be a <code>&lt;form&gt;</code>). Doing so changes <code>.form-groups</code> to behave as grid rows, so no need for <code>.row</code>.
							</small>
						</div>
						<form method="post" class="form-horizontal" action="">
						<input type="hidden" name="bno" value="${board.bno }">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<c:out value="${board.title}" /> 
								</div>
							</div>
						
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">Content:</label>
								<div class="col-sm-9">
								<% pageContext.setAttribute("newLineChar", "\n"); %>
									${fn:replace (board.content, newLineChar, '<br>')}
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									${board.writer} 
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Regdate:</label>
								<div class="col-sm-9">
									<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/> 
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<a href="modify?bno=${board.bno }" class="btn btn-success btn-sm">Modify Button</a>
									<button type="button" id="btn_remove" class="btn btn-success btn-sm">Remove Button</button>
									<a href="javascript:history.go(-1);" class="btn btn-success btn-sm">List Button</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
				<div class="mail-item">
					<div style="display:inline-block; height:32px; padding-top:6px;">Reply</div>
					<div style="display:inline-block; float:right;"><button  data-toggle="modal" data-target="#composeModal" class="btn btn-default btn-sm" onclick="btn_new();">New Reply</button></div>
				</div><!-- END mail-item -->
				
				<!-- a single mail -->
				<div id="chat">
							
				</div>
						
			</div><!-- END column -->
			<div class="col-md-12">
					<!-- page -->
					<nav style="text-align:right;">
					  <ul class="pagination">
					 
					  </ul>
					</nav>
					<!-- page -->
					</div>
		</div>
	</div>
	
<!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">New Reply</h4>
			</div>
			<div class="modal-body">
				<form action="#" onsubmit="return false;">
				<input type="hidden" name="rno" id="rno">
					<textarea name="reply" id="reply" cols="30" rows="5" class="form-control" placeholder="content"></textarea>
					
					<div class="form-group">
						<input name="replyer" id="replyer" type="text" class="form-control" placeholder="writer">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="btn_modify" data-dismiss="" class="btn btn-primary">Modify <i class="fa fa-send"></i></button>
				<button type="button" id="btn_del" data-dismiss="" class="btn btn-primary">Remove <i class="fa fa-send"></i></button>
				<button type="button" id="btn_reply" data-dismiss="" class="btn btn-primary">Send <i class="fa fa-send"></i></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	
	
<script>


function btn_new(){
	
	$("#rno").val('');
	$("#reply").val('');
	$("#replyer").val('');
	
	$(".modal-footer").empty();
	let btn_footer = "";
	btn_footer += '<button type="button" id="btn_reply" data-dismiss="" class="btn btn-primary">Send <i class="fa fa-send"></i></button>';
	$(".modal-footer").html(btn_footer);
	
	console.log("click");
}

function btn_modal(t){
	let rno = $(t).data("rno");
	let reply = $(t).data("reply");
	let replyer = $(t).text();
	
	$("#reply").val(reply);
	$("#replyer").val(replyer);
	$("#rno").val(rno);
	
	$(".modal-footer").empty();
	let btn_footer = "";
	btn_footer += '<button type="button" id="btn_modify" data-dismiss="" class="btn btn-primary">Modify <i class="fa fa-send"></i></button>';
	btn_footer += '<button type="button" id="btn_del" data-dismiss="" class="btn btn-primary">Remove <i class="fa fa-send"></i></button>';
	$(".modal-footer").html(btn_footer);
	//console.log("수정삭제"+rno);
}
var pageNum = 1;

function showReplyPage(replyCnt){
	console.log(replyCnt);
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum-9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt){
		endNum = Math.ceil(replyCnt/10.0);
	}
	if(endNum * 10 < replyCnt){
		next = true;
	}
	
	var str = "";
	if(prev){
		str += '<li>';
		str += '<a href="'+(startNum -1)+'" aria-label="Previous" class="btn_pagination">';
		str += '<span aria-hidden="true">&laquo;</span>';
		str += '</a>';
		str += '</li>';
	}

	for(let i = startNum; i <= endNum; i++ ){
		if(pageNum == i){
			
			str += '<li  class="active" >';
			str += '<a>'+i+'</a>';
			str += '</li>';
		} else{
			str += '<li>';
			str += '<a href = "'+i+'" class="btn_pagination">'+i+'</a>';
			str += '</li>';
		}
	
	}

	if(next){
		str += '<li>';
		str += '<a href="'+(endNum + 1)+'"  aria-label="Next" class="btn_pagination">';
		str += '<span aria-hidden="true">&raquo;</span>';
		str += '</a>';
		str += '</li>';
	}
	$('.pagination').html(str);
}


function getList(){
	// ajax 통신
    $.ajax({
        type : "GET",            // HTTP method type(GET, POST) 형식이다.
        url : "/admin/replies/pages/${board.bno}/"+pageNum+".json",      // 컨트롤러에서 대기중인 URL 주소이다.
        contentType: "application/json",
        //data : JSON.stringify(data),            // Json 형식의 데이터이다.
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다.
            // 응답코드 > 0000
            let html = "";
            console.log(res);
            for(let i = 0; i<res.list.length; i++){
				html += '<div class="mail-item">';
				html += '<table class="mail-container">';
				html += '<tr>';
				html += '<td class="mail-center">';
				html += '<div class="mail-item-header">';
				html += '<h4 class="mail-item-title"><span data-toggle="modal" data-target="#composeModal" class="title-color"';
				html += 'onclick="btn_modal(this)" data-reply="'+res.list[i].reply+'" data-rno="'+res.list[i].rno+'">'+res.list[i].replyer+'</span></h4>';
				html += '</div>';
				html += '<p class="mail-item-excerpt">'+res.list[i].reply+'</p>';
				html += '</td>';
				html += '<td class="mail-right" style="width:160px;">';
				html += '<p class="mail-item-date">'+(new Date(res.list[i].replyDate).toLocaleString())+'</p>';
				html += '</td>';
				html += '</tr>';
				html += '</table>';
				html += '</div>';
				
            }
            $("#chat").html(html);
            
            showReplyPage(res.replyCnt); //페이징
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            console.log("통신 실패.");
        }
    });
}

$(document).ready(function(){
	
	getList();
	
	$("#btn_remove").on("click", function(){
		$("form").attr("action","remove");
		if(confirm("정말로 삭제하시겠습니까?")){
			$("form").submit();
		}
	});
	
	$(document).on("click","#btn_del",function(){
		let rno = $('#rno').val();
		if(confirm("정말로 삭제하시겠습니까?")){
			// ajax 통신
	        $.ajax({
	            type : "DELETE",            // HTTP method type(GET, POST) 형식이다.
	            url : "/admin/replies/"+rno,      // 컨트롤러에서 대기중인 URL 주소이다.
	            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다.
	                // 응답코드 > 0000
	              //  console.log("댓글등록성공");
	                console.log(res);
	              
	              if(res == 'success'){
	            	  getList();
	              }
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                console.log("통신 실패.");
	            }
	        });
			
			$("#composeModal").modal('hide');			
		}
		//console.log("click"+reply+replyer);
	});
	
	$(document).on("click","#btn_modify",function(){
		let rno = $('#rno').val();
		let bno = '${board.bno}';
		let reply = $("#reply").val();
		let replyer = $("#replyer").val();
		
		let data = {bno:bno,
            	reply:reply,
            	replyer:replyer};
		if(reply == ''){
			alert("댓글내용을 작성해주세요.");
		} else if (replyer == ''){
			alert("댓글작성자를 입력해주세요.");
		} else{
			// ajax 통신
	        $.ajax({
	            type : "PUT",            // HTTP method type(GET, POST) 형식이다.
	            url : "/admin/replies/"+rno,      // 컨트롤러에서 대기중인 URL 주소이다.
	            contentType: "application/json",
	            data : JSON.stringify(data),            // Json 형식의 데이터이다.
	            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다.
	                // 응답코드 > 0000
	              //  console.log("댓글등록성공");
	              //  console.log(res);
	              
	              if(res == 'success'){
	            	  getList();
	              }
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                console.log("통신 실패.");
	            }
	        });
			
			$("#composeModal").modal('hide');			
		}
		console.log("click"+reply+replyer);
	});
	
	$(document).on("click","#btn_reply" ,function(){
		let bno = '${board.bno}';
		let reply = $("#reply").val();
		let replyer = $("#replyer").val();
		
		let data = {bno:bno,
            	reply:reply,
            	replyer:replyer};
		if(reply == ''){
			alert("댓글내용을 작성해주세요.");
		} else if (replyer == ''){
			
			alert("댓글작성자를 입력해주세요.");
		} else{
			// ajax 통신
	        $.ajax({
	            type : "POST",            // HTTP method type(GET, POST) 형식이다.
	            url : "/admin/replies/new",      // 컨트롤러에서 대기중인 URL 주소이다.
	            contentType: "application/json",
	            data : JSON.stringify(data),            // Json 형식의 데이터이다.
	            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다.
	                // 응답코드 > 0000
	              //  console.log("댓글등록성공");
	              //  console.log(res);
	              
	              if(res == 'success'){
	            	  getList();
	              }
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                console.log("통신 실패.");
	            }
	        });
			
			$("#composeModal").modal('hide');			
		}
		console.log("click"+reply+replyer);
	});
	
	$(document).on("click",".btn_pagination",function(e){
		e.preventDefault();
		pageNum = $(this).attr("href");
		getList();
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>