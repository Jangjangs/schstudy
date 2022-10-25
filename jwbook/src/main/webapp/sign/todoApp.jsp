<%@page import="java.util.Iterator"%>
<%@page import="domain.TodoVO"%>
<%@page import="java.util.List"%>
<%@page import="controller.TodoController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    TodoController todo = new TodoController();
    List<TodoVO> list = (List)request.getAttribute("list");
    Iterator<TodoVO> it = list.iterator();
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>title</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.container{
margin: 50px auto;
padding:50px;
background-color: #ccc;
border-radius: 10px;
}
input[type=text]{
	width:50%;
	display:inline;
}
input[type=date]{
	width:20%;
	display:inline;
}
.form-group{
	text-align: center;
}
body > div > ul > li > span {
	float: right;
}

</style>
</head>
<body>
	<div class="container">
		<h2>My ToDo App</h2>
		<hr>
		<div class="form-group">
			<form onsubmit="return nosubmit();">
				<input type="date" id="todoDate" name="todoDate" class="form-control">
				<input type="text" name="item" id="item" class="form-control"
					placeholder="할일을 입력하세요.">
				<button type="button" class="btn btn-primary" onclick="nosubmit();">할일 추가</button>
			</form>
		</div>
		<hr>
		<ul class="list-group" id="todolist">
		<%
		//스크립트
		while(it.hasNext()){
			TodoVO todovo = it.next();
		%>
			<li class="list-group-item"><%=todovo.getTodoDate() %><%=todovo.getTodo() %><span id="<%=todovo.getNum() %>" class="glyphicon glyphicon-remove" onclick="removeli(this);"></span></li>
			<%
		}
			%>
		</ul>
		
	</div>
<script>
var list = document.getElementById("todolist");
	function addItem(){
		let item = document.getElementById("item").value;
		let todoDate = document.getElementById("todoDate").value;
		
		/* list = document.getElementById("todolist"); */
		let li = document.createElement("li");
		li.className = "list-group-item";
		li.innerHTML = todoDate + " " + item + '<span id="" class="glyphicon glyphicon-remove" onclick="removeli(this);"></span>';
		list.appendChild(li);
		/* document.getElementById("item").value =""; //li를 추가 후 입력창을 공백으로 만듦. */
		document.getElementById("item").select();
		saveItem(li); //ajax를 이용한 데이터 등록
	}
	
	function saveItem(liItem){
		let item=document.getElementById("item").value;
		let todoDate=document.getElementById("todoDate").value;
		 // ajax 통신
        $.ajax({
            type : "POST",            // HTTP method type(GET, POST) 형식이다.
            url : "../ajax/ajax.todo.create.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : {item:item,
            		todoDate:todoDate
            		},            // Json 형식의 데이터이다.
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
            	liItem.lastElementChild.id=res;
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                console.log("통신 실패.")
            }
        });
	}
	function removeli(e) {
		let pnode = e.parentNode;
		list.removeChild(pnode);
		
		removeItem(e); //ajax를 이용한 데이터 삭제
	}
	function removeItem(e){
		let num=e.id;
		// ajax 통신
        $.ajax({
            type : "POST",            // HTTP method type(GET, POST) 형식이다.
            url : "../ajax/ajax.todo.delete.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : {num:num},            // Json 형식의 데이터이다.
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
               console.log(res);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                console.log("통신 실패.")
            }
        });
	}
	function nosubmit(){
		let item = document.getElementById("item").value.trim();
		let todoDate = document.getElementById("todoDate").value;
		document.getElementById("item").value = item; 
		if(todoDate == ''){
			alert("날짜를 입력해주세요.");
			return false;
		}
		if(item == ''){
			alert("할일을 입력해주세요.");
			return false;
		}
		
		addItem();
		console.log("submit ON")
		return false;
	}
</script>
</body>
</html>