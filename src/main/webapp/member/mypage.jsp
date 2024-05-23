<%@page import="kr.ac.kopo.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Cookie[] cookie = request.getCookies();
	
	StringBuilder id = new StringBuilder();
	if(cookie != null){
		for(Cookie c : cookie){
			String cName = c.getName();
			String cId = c.getValue();
			
			if("cookieId".equals(cName)){
				cId = URLDecoder.decode(cId, "utf-8");
				id.append(cId);
			}
		}
	}
	
	MemberDAO dao = new MemberDAO();
	List<BoardVO> list = dao.mypage(id.toString());
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/list.css">
<title>마이페이지</title>
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
		<h2>마이페이지</h2>
		<hr>
		<table border="1" style="width:80%">
			<tr>
				<td width="7%">번호</td>
				<td>제목</td>
				<td width="16%">작성자</td>
				<td width="20%">등록일</td>
			</tr>
			<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.no}" /></td>
				<td>
					<a href="./detail.jsp?no=${board.no}">
					<c:out value="${board.title}" />
					</a>
				</td>
				<td><c:out value="${board.writer}" /></td>
				<td><c:out value="${board.regDate}" /></td>
			</tr>
			</c:forEach>
		</table>
		<form action="./delete.jsp">
			<br><input type="submit" value="회원탈퇴">
		</form>
		<form action="./modify.jsp">
			<br><input type="submit" value="내 정보 수정">
		</form>
	</div>
</body>
</html>