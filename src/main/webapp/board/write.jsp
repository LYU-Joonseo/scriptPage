<%@page import="kr.ac.kopo.utill.JDBCClose"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.utill.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		작업순서
		1. 파라미터 추출(title, writer, content)
		2. t_board 테이블에 추출된 파라미터로 삽입(insert)
	*/
	request.setCharacterEncoding("utf-8");
	
	Cookie[] cookie = request.getCookies();
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String writer = null;
	if(cookie != null){
		for(Cookie c : cookie){
			String cName = c.getName();
			String cId = c.getValue();
			
			if("sys".equals(cId)){
				cId = URLDecoder.decode(cId, "utf-8");
				writer = "관리자";
			}else if("cookieId".equals(cName)){
				cId = URLDecoder.decode(cId, "utf-8");
				writer = cId;
			}
		}
	}

	StringBuilder sql = new StringBuilder(); 
	sql.append("insert into t_board(no, title, writer, content) ");
	sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
	
	Connection conn = new ConnectionFactory().getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());		

	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	
	pstmt.executeUpdate();

	JDBCClose.close(pstmt, conn);
	/*
	System.out.println("title : " + title);
	System.out.println("writer : " + writer);
	System.out.println("content : " + content);
	*/
%>

<script>
	alert('등록 완료')
	location.href = "list.jsp"
</script>