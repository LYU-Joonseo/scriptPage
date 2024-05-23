<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/log.css">
<title>회원가입</title>
</head>
<body>
	<div align="center">
		<h1>회원가입</h1>
		<hr>
		<form action="./insertMember.jsp" method="post">
			<table align="center">
			<tr>
				<td align="center"> 아이디 : &nbsp; </td>
				<td><input type="text" name="id" autocomplete="off" required></td>
			</tr>
			<tr>
				<td align="center"> 비밀번호 : &nbsp; </td>
				<td><input type="password" name="password" required></td>
			</tr>
			<tr>
				<td align="center"> 이름 : &nbsp; </td>
				<td><input type="text" name="name"></td>
			</tr>
		   	<tr>
		   		<td colspan="2" align="center" height="50">
		   			<input type="submit" value="회원가입">
		   		</td>
		   	</tr>
		   	</table>
   		</form>
   		<form action="./index.jsp">
   			<br>
   			<input type="submit" value="메인페이지">
   		</form>
	</div>
</body>
</html>