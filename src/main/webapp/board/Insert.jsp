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
			
			if("sys".equals(cId)){
				cId = URLDecoder.decode(cId, "utf-8");
				id.append("관리자");
			}else if("cookieId".equals(cName)){
				cId = URLDecoder.decode(cId, "utf-8");
				id.append(cId);
			}
		}
	}
	pageContext.setAttribute("id", id.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/insert.css">
<title>글쓰기</title>
</head>
<body>
	<div align="center">
		<br>
		<hr>
		<h2>게시글 등록</h2>
		<hr>
		<br>
		<form action="write.jsp" method="post">
			<table border="1" style="width:80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title" size="150"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td> ${ id } </td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td><textarea name="content" rows="30" cols="150"></textarea></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
		</form>
		<form action="./list.jsp">
			<br><input type="submit" value="이전 페이지"> 
		</form>			
	</div>
</body>
</html>