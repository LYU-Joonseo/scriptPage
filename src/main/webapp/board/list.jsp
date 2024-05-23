<%@page import="java.net.URLDecoder"%>
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
				cId = URLDecoder.decode(cId, "utf-8");
				id.append(cId);
			}
		}
	}
	
	pageContext.setAttribute("id", id.toString());
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/list.css">
<title>게시판</title>
<script>
	window.onload = function(){
		let btn = document.getElementById("addBtn")
		btn.addEventListener('click', function(){
			location.href = 'Insert.jsp'
		})
	}
</script>
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
		<button id="addBtn">글쓰기</button>
	</div>
</body>
</html>