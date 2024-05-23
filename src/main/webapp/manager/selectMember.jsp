<%@page import="kr.ac.kopo.dao.ManagerDAO"%>
<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ManagerDAO dao = new ManagerDAO();
	List<MemberVO> list = dao.selectMember();

	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/memberList.css">
<title>전체 회원</title>
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
		<hr>
		<h2>회원 목록</h2>
		<hr>
		<table border="1" style="width:80%">
			<tr>
				<td width="50%">아이디</td>
				<td width="50%">이름</td>
			</tr>
			<c:forEach items="${list}" var="member">
			<tr>
				<td><c:out value="${member.id}" /></td>
				<td><c:out value="${member.name}" /></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>