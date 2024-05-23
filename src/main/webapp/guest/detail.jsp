<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.vo.BoardVO"%>
<%@page import="kr.ac.kopo.utill.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.utill.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	int boardNo = Integer.parseInt(request.getParameter("no"));

	MemberDAO dao = new MemberDAO();
	dao.countView(boardNo);

	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, content, view_cnt ");
	sql.append("     , to_char(reg_date, 'yyyy-mm-dd') reg_date ");
	sql.append("  from t_board ");
	sql.append(" where no = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, boardNo);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	int    no 		= rs.getInt("no");
	String title 	= rs.getString("title");
	String writer 	= rs.getString("writer");
	String content 	= rs.getString("content");
	int    viewCnt	= rs.getInt("view_cnt");
	String regDate 	= rs.getString("reg_date");
	
	BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate);
	
	JDBCClose.close(pstmt, conn);
	
	pageContext.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/detail.css">
<title>게시판 상세</title>
</head>
<body>
	<div class="header">
		<div class="head">
			<h1 class="main">
				<a href="../index.jsp">
					<img src="../img/logo1.png">
				</a>
			</h1>
		</div>
	</div>
	<div align="center">
		<br>
		<h2>게시판 상세</h2>
		<hr>
		<br>
		<table border="1" style="width:80%;">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>
					<c:out value="${board.title}"/>
				</td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><c:out value="${board.writer}" /></td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td class="content">
					<c:out value="${board.content}" />
				</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${board.viewCnt}</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${board.regDate}</td>
			</tr>
		</table>
		<hr>
	</div>
	<div align="center">
		<form action="./list.jsp">
			<br><input type="submit" value="목록">
		</form>
	</div>
</body>
</html>