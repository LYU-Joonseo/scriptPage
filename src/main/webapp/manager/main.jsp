<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<title>환영합니다 관리자님.</title>
</head>
<body>
	<div class="header">
		<div class="head">
			<h1 class="main">
				<a href="./main.jsp">
					<img src="../img/logo1.png">
				</a>
			</h1>
			<div class="menu">
				<div class="move">
					<a class="href" href="./selectMember.jsp"> 전체 회원 </a>
				</div>
				<div class="move">
					<a class="href" href="../board/list.jsp"> 게시판 </a>
				</div>
				<div class="move">
					<a class="href" href="../logout.jsp"> 로그아웃 </a>
				</div>
				<h5 class="group">현재 계정 : 관리자</h5>
			</div>
		</div>
	</div>
	
<!-- 
	<div align="center">
		<h1>메인페이지</h1>
		<h5>현재 계정 : 관리자</h5>
		<hr>
		<a href="./selectMember.jsp"> 전체 회원 </a><a href="../board/list.jsp"> 게시판 </a><a href="../logout.jsp"> 로그아웃 </a>
	</div>
 -->
</body>
</html>