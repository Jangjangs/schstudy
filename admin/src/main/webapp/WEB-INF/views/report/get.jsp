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
						<h4 class="widget-title">Report View</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								Use Bootstrap's predefined grid classes to align labels and groups of form controls in a horizontal layout by adding <code>.form-horizontal</code> to the form (which doesn't have to be a <code>&lt;form&gt;</code>). Doing so changes <code>.form-groups</code> to behave as grid rows, so no need for <code>.row</code>.
							</small>
						</div>
						<form method="post" class="form-horizontal" action="">
						<input type="hidden" name="bno" value="${report.bno }">
										
							<% pageContext.setAttribute("newLineChar", "\n"); %>			
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">업무 내용:</label>
								<div class="col-sm-9">
									${fn:replace (report.content, newLineChar, '<br>')}
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">비고:</label>
								<div class="col-sm-9">
									${fn:replace (report.note, newLineChar, '<br>')}
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">특이사항/건의사항:</label>
								<div class="col-sm-9">
									${fn:replace (report.suggestion, newLineChar, '<br>')}
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성자:</label>
								<div class="col-sm-9">
									${report.writer} 
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성일자:</label>
								<div class="col-sm-9">
									<fmt:formatDate value="${report.regdate }" pattern="yyyy-MM-dd"/> 
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<a href="modify?bno=${report.bno }" class="btn btn-success btn-sm">Modify Button</a>
									<button type="button" id="btn_remove" class="btn btn-success btn-sm">Remove Button</button>
									<a href="javascript:history.go(-1);" class="btn btn-success btn-sm">List Button</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			
				
			</div><!-- END column -->
		
		</div>
	</div>
	

	
<script>

$(document).ready(function(){
	
	$("#btn_remove").on("click", function(){
		$("form").attr("action","remove");
		if(confirm("정말로 삭제하시겠습니까?")){
			$("form").submit();
		}
	});
	
});
</script>
<%@ include file="../includes/footer.jsp" %>