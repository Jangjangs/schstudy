<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, intial=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>테이블 태그</title>

</head>
<body>
	<h2>table 행:tr or th</h2>
	<div><img></div>
	<table>
	<tfoot>
		<tr>
			<th>Company</th>
			<th>Contact</th>
			<th>Country</th>
		</tr>
		</tfoot>
		<tbody>
		<tr>
			<td>Alfreds Futterkiste</td>
			<td>Maria Anders</td>
			<td>Germany</td>
		<tr>
			<td>Centro comercial Moctezuma</td>
			<td>Francisco Chang</td>
			<td>Mexico</td>
		</tr>
		<tr>
			<td>Ernst Handel</td>
			<td>Roland Mendel</td>
			<td>Austria</td>
		</tr>
		<tr>
			<td>Island Trading</td>
			<td>Helen Bennett</td>
			<td>UK</td>
		</tr>
		<tr>
			<td>Laughing Bacchus Winecellar</td>
			<td>Yoshi Tannamuri</td>
			<td>Canada</td>
		</tr>
		<tr>
			<td>Magazzini Alimentari Riuniti</td>
			<td>Giovanni Rovelli</td>
			<td>Italy</td>
		</tr>
		</tbody>
	</table>
	<table border="1" width="100%">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="50%">
		</colgroup>
		<tr>

			<th colspan="2">이름</th>
			<th>나이</th>
		</tr>
		<tr>
			<td>처녀</td>
			<td>스미스</td>
			<td>50</td>
		</tr>
		<tr>
			<td>이브</td>
			<td>잭슨</td>
			<td>94</td>
		</tr>
	</table>
</body>
</html>