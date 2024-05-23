<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="java.net.URLDecoder"%>
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
	
	
	Cookie[] cookie = request.getCookies();

	StringBuilder id = new StringBuilder();
	if(cookie != null){
		for(Cookie c : cookie){
			String cName = c.getName();
			String cId = c.getValue();
			
			if("sys".equals(cId)){
				cId = URLDecoder.decode(cId, "utf-8");
				id.append("sys");
			}else if("cookieId".equals(cName)){
				cId = URLDecoder.
						decode(cId, "utf-8");
				id.append(cId);
			}
		}
	}
	
	pageContext.setAttribute("id", id.toString());
	
	session.setAttribute("no", boardNo);
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
	<c:choose>
			<c:when test="${id == 'sys' }">
				<div class="header">
					<div class="head">
						<h1 class="main">
							<a href="../manager/main.jsp">
								<img src="../img/logo1.png">
							</a>
						</h1>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="header">
					<div class="head">
						<h1 class="main">
							<a href="../member/main.jsp">
								<img src="../img/logo1.png">
							</a>
						</h1>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
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
					<c:out value="${board.content}"/>
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
		<form action="./list.jsp">
			<br><input type="submit" value="목록">
		</form>
		<hr>
		<c:if test="${ id == 'sys' }">
			<form action="../manager/deleteList.jsp">
				<br><input type="submit" value="글 삭제">
			</form>
		</c:if>
	</div>
</body>
</html>