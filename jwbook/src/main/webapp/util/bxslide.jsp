<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<div class="bxslider">
  <div><img src="coffee1.jpg" title="Funky roots"></div>
  <div><img src="coffee2.jpg" title="The long and winding road"></div>
  <div><img src="coffee3.jpg" title="Happy trees"></div>
</div>
<script>
$(function(){
	  $('.bxslider').bxSlider({
	    mode: 'fade',
	    captions: true,
	    
	    auto: true,
	    autoControls: false,
	    stopAutoOnClick: false,
	    pager: false,
	    slideWidth: 600
	  });
	});
</script>
</body>
</html>