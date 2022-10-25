<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
	width:75%;
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
		<form>
				<input type="text" id="item" class="form-control"
					placeholder="할일을 입력하세요.">
				<button type="button" class="btn btn-primary" onclick="addItem();">할일 추가</button>
			</form>
		</div>
		<hr>
		<ul class="list-group" id="todolist">
			
		</ul>
		
	</div>
<script>
var list;
	function addItem(){
		let item = document.getElementById("item").value;
		
		list = document.getElementById("todolist");
		let li = document.createElement("li");
		li.className = "list-group-item";
		li.innerHTML = item + '<span id="item0" class="glyphicon glyphicon-remove" onclick="removeli(this);"></span>';
		list.appendChild(li);
		
	}
	function removeli(e) {
		let pnode = e.parentNode;
		list.removeChild(pnode);
	}
</script>
</body>
</html>