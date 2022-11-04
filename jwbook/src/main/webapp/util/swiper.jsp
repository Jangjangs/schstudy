<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<style>
.swiper {
  width: 600px;
  height: 300px;
}
</style>
</head>
<body>
<!-- Slider main container -->
<div class="swiper">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide" style="background-color:#f00;">Slide 1</div>
    <div class="swiper-slide" style="background-color:#0f0; ">Slide 2</div>
    <div class="swiper-slide" style="background-color:#00f;">Slide 3</div>
    ...
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
	<div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  If we need scrollbar
  <div class="swiper-scrollbar"></div>  
</div>
<script>
const swiper = new Swiper('.swiper', {
	  // Optional parameters
	  direction: 'horizontal',
	  loop: true,

	  // If we need pagination
	 /*  pagination: {
	    el: '.swiper-pagination',
	  }, */

	  // Navigation arrows
	    navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  }, 

	  // And if we need scrollbar
	  scrollbar: {
	    el: '.swiper-scrollbar',
	  },
	});
</script>
</body>
</html>