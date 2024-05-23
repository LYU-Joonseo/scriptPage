<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = (int)session.getAttribute("no");
	
	MemberDAO dao = new MemberDAO();
	dao.deleteMyList(boardNo);
	
	session.invalidate();
%>
<script>
	alert("글 삭제완료");
	location.href = "./mypage.jsp"
</script>