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
<link rel="stylesheet" href="./css/main.css">
<title>메인페이지</title>
</head>
<body>
	<div class="header">
		<div class="head">
			<h1 class="main">
				<a href="./index.jsp">
					<img src="./img/logo1.png">
				</a>
			</h1>
			<div class="menu">
				<div class="move">
					<a class="href" href="./guest/list.jsp"> 게시판 </a>
				</div>
				<div class="move">
					<a class="href" href="./login.jsp"> 로그인 </a>
				</div>
				<h5 class="group">현재 계정 : 게스트</h5>
			</div>
		</div>
	</div>
<!-- 
	<div align="center">
		<h1>메인페이지</h1>
		<h5>현재 계정 : 게스트</h5>
		<hr>
		<a class="href" href="./guest/list.jsp"> 게시판 </a><a class="href" href="./login.jsp"> 로그인 </a>
	</div>
 -->
</body>
</html>
