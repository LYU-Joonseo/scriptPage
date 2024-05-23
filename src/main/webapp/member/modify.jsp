<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Cookie[] cookie = request.getCookies();
	
	String id = null;
	if(cookie != null){
		for(Cookie c : cookie){
			String cName = c.getName();
			String cId = c.getValue();
			
			if("cookieId".equals(cName)){
				cId = URLDecoder.decode(cId, "utf-8");
				id = cId;
			}
		}
	}
	
	pageContext.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/update.css">
<title>회원수정</title>
</head>
<body>
	<div class="header">
		<div class="head">
			<h1 class="main">
				<a href="./main.jsp">
					<img src="../img/logo1.png">
				</a>
			</h1>
		</div>
	</div>
	<div align="center">
		<h1>회원 수정</h1>
		<hr>
		<form action="./updateMember.jsp" method="post">
			<table align="center">
			<tr>
				<td align="center"> 아이디 : &nbsp; </td>
				<td><c:out value="${ id }"></c:out></td>
			</tr>
			<tr>
				<td align="center"> 현재 비밀번호 : &nbsp; </td>
				<td><input type="password" name="password" required></td>
			</tr>
			<tr>
				<td align="center"> 변경할 비밀번호 : &nbsp; </td>
				<td><input type="password" name="newPw" required></td>
			</tr>
			<tr>
				<td align="center"> 비밀번호 확인 : &nbsp; </td>
				<td><input type="password" name="chPw" required></td>
			</tr>
			<tr>
				<td align="center"> 변경할 이름 : &nbsp; </td>
				<td><input type="text" name="newName" autocomplete="off"></td>
			</tr>
		   	<tr>
		   		<td colspan="2" align="center" height="50">
		   			<input type="submit" value="정보 저장">
		   		</td>
		   	</tr>
		   	</table>
   		</form>
	</div>
</body>
</html>