<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
    String user = "root";
    String password = "bigdata";
    
    StringBuffer qry = new StringBuffer();
    qry.append(" SELECT * FROM big_board WHERE bo_num = ?  ");
    String sql = qry.toString();
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    HashMap<String, String> view = new HashMap<>();
    
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url, user, password);
    	
    	stmt = conn.prepareStatement(sql);
    	stmt.setInt(1, Integer.parseInt(request.getParameter("bo_num")));
    	
    	rs = stmt.executeQuery();
    	
    	if(rs.next()){
    		view.put("bo_num", rs.getString("bo_num"));
    		view.put("bo_category", rs.getString("bo_category"));
    		view.put("bo_title", rs.getString("bo_title"));
    		view.put("bo_content", rs.getString("bo_content"));
    		view.put("bo_mb_id", rs.getString("bo_mb_id"));
    		view.put("bo_mb_name", rs.getString("bo_mb_name"));
    		view.put("bo_hit", rs.getString("bo_hit"));
    		view.put("bo_inputdate", rs.getString("bo_inputdate"));
    		view.put("bo_ip", rs.getString("bo_ip"));
    	}
    	
    }catch(Exception e){
    	
    }finally{
    	try{
    		if(rs != null) rs.close();
    		if(stmt != null) stmt.close();
    		if(conn != null) conn.close();
    	}catch(Exception e){
    		
    	}
    }
    
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
									<%=view.get("bo_title") %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성자:</label>
								<div class="col-sm-9">
									<%=view.get("bo_mb_name") %>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">내용:</label>
								<div class="col-sm-9">
								<%=view.get("bo_content").replace("\r\n", "<br>") %>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성일:</label>
								<div class="col-sm-9">
									<%=view.get("bo_inputdate") %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-sm-offset-8">
								
								<!-- 글쓴아이디와 로그인된 아이디가 같을 경우 글수정과 글삭제버튼 노출 -->
								<!-- 글쓴아이디와 로그인된 아이디가 다를 경우 글수정과 삭제버튼이 안보임 -->
								<%-- <%=sess_id %>/<%=view.get("bo_mb_id") %> --%>
								<%
								if(sess_id.equals(view.get("bo_mb_id"))){
								%>
									<a href="modify.jsp?bo_num=<%=view.get("bo_num") %>" class="btn btn-success">글수정</a>
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
<input type="hidden" name="bo_num" value="<%=view.get("bo_num") %>">
</form>	
<script>
 function del(){
	 if(confirm("정말로 삭제하시겠습니까?")){
		 document.getElementById('sendfrm').submit();
	 }
 }
</script>			
    <%@ include file="includes/footer.jsp" %>