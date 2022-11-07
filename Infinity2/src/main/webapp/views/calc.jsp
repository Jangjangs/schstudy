<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
	<form id="calc" action="">
		<table>
			<tr>
				<td colspan="4" style="text-align:right;">
						<span id="res" style="font-size:2rem;"></span>
				</td>
			</tr>
			
			
			
			<tr>
				<td><button class="btn mw-md btn-default" name="sign" value="CE">CE</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="(">(</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value=")">)</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="/">÷</button></td>
			</tr>
			
			<tr>
				<td><button class="btn mw-md btn-default" name="num" value="7">7</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="8">8</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="9">9</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="*">×</button></td>
			</tr>
			
			<tr>
				<td><button class="btn mw-md btn-default" name="num" value="4">4</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="5">5</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="6">6</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="-">-</button></td>
			</tr>
			
			<tr>
				<td><button class="btn mw-md btn-default" name="num" value="1">1</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="2">2</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="3">3</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="+">+</button></td>
			</tr>
			
			<tr>
				<td><button class="btn mw-md btn-default" name="sign" value=".">.</button></td>
				<td><button class="btn mw-md btn-default" name="num" value="0">0</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="BS">BS</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="=">=</button></td>
			</tr>
			
		</table>
	</form>
<script type="text/javascript">
$(document).ready(function(){
	$("button").on("click",function(e){
		e.preventDefault();
		//console.log($(this).val());
		var calc = $(this).val();
		
		var calc2 = $('#res').text()+$(this).val();
		
		$('#res').text(calc2);
		
		
		//변수를 만들어서 저장해야되나 
		
		switch(calc){
		case "+":
			
			break;
			
		case "-":
			
			break;
			
		case "/":
			
			break;
			
		case "*":
			
			break;
			
		case "=":
			
			break;
		}
		
		
		
	});
});
</script>
<%@ include file="includes/footer.jsp" %>