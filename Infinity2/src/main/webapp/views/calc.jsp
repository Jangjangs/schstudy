<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
	<form id="calc" action="">
		<table>
			<tr>
				<td colspan="4" style="text-align:right;">
						<span id="res" style="font-size:2rem;">0</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="3" style="text-align:center;"><button style="width:100%;" class="btn mw-md btn-default" name="sign" value="" onclick="btn_reset();">CE</button></td>
				<td><button  class="btn mw-md btn-default" name="sign" value="/">÷</button></td>
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
				<td><button class="btn mw-md btn-default" name="sign" value="" onclick="backSpace()">BS</button></td>
				<td><button class="btn mw-md btn-default" name="sign" value="" onclick="cal();">=</button></td>
			</tr>
			
		</table>
	</form>
<script type="text/javascript">
$(document).ready(function(){
	$("button").on("click",function(e){
		e.preventDefault();
		var calc = $(this).val();
		console.log(calc);
		
		var calc2 = $('#res').text()+calc;
		
		//$('#res').text(calc2);

		if(isNaN(Number(calc2))){
			$('#res').text(calc2);
		}else if(calc==='.'){
			$('#res').text(calc2);
		}
		else{
			$('#res').text(Number(calc2));
		}
		
		
	});
	
});
function cal(){
	var result = eval($('#res').text());
	
	$('#res').text(result);
	
};

function btn_reset(){

	$('#res').text("0");
	
};
function backSpace(){
	var bs =$('#res').text();
	var new_bs = bs.slice(0,-1);
	$('#res').text(new_bs);
	if($('#res').text()==""){
		$('#res').text("0");
	}
	
}
</script>
<%@ include file="includes/footer.jsp" %>