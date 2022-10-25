<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, intial=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>네이버 : 로그인</title>
<link rel="stylesheet" href="/jwbook/jsp/exam1/style.css">
</head>
<body>
<!-- header 시작 -->
	<div id="wrap">
		<div id="header">
			<div id="header_inner">
			<!-- 로고 -->
				<img src="/jwbook/jsp/exam1/logo.png" alt="NAVER" id="logo">
				<div id="sel">
					<select>
						<option>한국어</option>
					</select>
				</div>
			</div>
		</div>
		<!-- header 끝 -->
		<!-- content 시작 -->
		<div id="content">
			<div id="login_form">
				<ul id="login_tab">
					<li>ID 로그인</li>
					<li>일회용 번호</li>
					<li>QR코드</li>
				</ul>
				<!-- ID 로그인 시작 -->
				<div id="login_inner">
					<form method="post" action="">
						<input type="text" name="uid" class="input" placeholder="아이디"> <input
							class="input" type="password" name="upw" placeholder="비밀번호">
						<div>
							<div style="float: left">
								<input type="checkbox">로그인 상태 유지
							</div>
							<div style="float: right">
								IP보안<input type="checkbox">
							</div>
						</div>
						<div id="btn_login">
							<button type="submit">로그인</button>
						</div>
					</form>
					<!-- ID 로그인 끝 -->
				</div>
				<div id="login_inner_menu">
					<a href="">비밀번호 찾기</a> | <a href="">아이디 찾기</a> | <a href="">회원가입</a>

				</div>
			</div>
			<div id="banner">
				<img alt="banner" src="/jwbook/jsp/exam1/banner.jpg">
			</div>
		</div>
		<!-- content 끝 -->
		<!-- footer 시작 -->
		<div id="footer">
			<ul>
			<div id="footer_linner">
				<li><a href="https://policy.naver.com/rules/service.html"><span>이용약관</span> </a></li>
			  
			 	<li><a href="https://policy.naver.com/rules/privacy.html"><strong>개인정보처리방침</strong></a></li> 
			  
			 	<li><a href="https://policy.naver.com/rules/disclaimer.html">책임의 한계와 법적고지</a></li> 
			  
				 <li><a href="https://help.naver.com/service/5640/category/bookmark?lang=ko"><span>회원정보 고객센터</span></a></li>
			 </div> 
			</ul>
			<div id="footer_text">
			<img src="/jwbook/jsp/exam1/logo.png">  Copyright 
			<strong>© NAVER	Corp.</strong> All Rights Reserved.
			</div>
		</div>
		<!-- footer 끝 -->
	</div>
</body>
</html>