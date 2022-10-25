<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, intial=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>시맨틱 태그</title>
<style type="text/css">
#wrapper {
	border: 1px solid red;
	width: 860px;
	margin:0 auto;
}
header{
	border: 1px solid green;
	height:50px
}

#logo{
	width: auto;
	float:left;
}
#header{
	width:auto;
	float:right;
}
nav{
	border: 1px solid blue;
	height:60px;
}

aside, section{
	display:none;
}
article{
	border: 1px solid purple;
	width: 600px;
	height: 400px;
	margin:0 auto;
}

input {
	width:100%;
	height:40px;
	font-size:25px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<header> <div id="logo">로고</div> 
		<div id="header">검색 즐겨찾기 사이트맵 등등...</div> </header>
		<nav>
			<ul>
				<li>HTML</li>
				<li>CSS</li>
				<li>JS</li>
			</ul>
		</nav>
		<main>
			article, aside section 등등...
			<section>section</section>
			<article>
				<form>
					<div><input type="text" placeholder="아이디"></div>
					<div><input type="password" placeholder="비밀번호"></div>
					<div><input type="submit" value="로그인"></div>
				</form>
			</article>
			<aside>aside</aside>
		</main>
		<footer>
			Copyright 등등..
		</footer>

	</div>
</body>
</html>