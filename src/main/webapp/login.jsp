<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cookie = request.getHeader("Cookie");
	if(cookie != null){
		Cookie[] c = request.getCookies();
		for (Cookie coo : c){
			coo.setMaxAge(0);
			response.addCookie(coo);
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/log.css">
<title>로그인</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
		<hr>
		<form action="./logcheck.jsp" method="post">
			<table align="center">
			<tr>
				<td align="right"> 아이디 : &nbsp;</td> 
				<td><input type="text" name="id" autocomplete="off" required></td>
			</tr>
			<tr>
				<td align="right"> 비밀번호 : &nbsp;</td>
				<td><input type="password" name="password" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="50">
		   			<input type="submit" value="로그인">
		   		</td>
		   	</tr>
		   	<tr>
		   		<td colspan="2" align="center" ><small>
		   		<br><br>아직 회원이 아닌가요?<br><br>
		   		<a href="./signUp.jsp">화원가입</a></small>
		   		</td>
		   	</tr>
   			</table>
   		</form>
   		<form action="./index.jsp">
   			<br><input type="submit" value="메인페이지">
   		</form>
	</div>
</body>
</html>