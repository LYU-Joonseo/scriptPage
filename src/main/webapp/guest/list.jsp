<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.utill.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.utill.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/*
		작업순서
		1. [자바] t_board 테이블에서 전체게시글 조회하여 list에 저장
		2. 공유영역에(pageContext)에 게시글 등록
		3. [jsp] 전체 게시글 출력
	*/
	
	List<BoardVO> list = new ArrayList<>();
	
	Connection conn = new ConnectionFactory().getConnection();
	String sql = "select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') reg_date ";
	sql += " from t_board ";
	sql += " order by no desc ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		int no = rs.getInt("no");
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		String regDate = rs.getString("reg_date");
		
		BoardVO board = new BoardVO(no, title, writer, regDate);
		
		list.add(board);
	}
	
	JDBCClose.close(pstmt, conn);
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/list.css">
<title>게시판</title>
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
		<hr>
		<h2>게시판 목록</h2>
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
		<br>
	</div>
</body>
</html>