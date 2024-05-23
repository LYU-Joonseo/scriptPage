<%@page import="java.net.URLEncoder"%>
<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String cId = null;
	
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setPassword(pass);
	MemberDAO dao = new MemberDAO();
	int chack = dao.login(member);
	
	if(chack == 2){
		cId = id;
        if (cId != null) {
            cId = URLEncoder.encode(cId, "utf-8");

            Cookie cookie = new Cookie("cookieId", cId);
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
        }
%>	
	<script>
		alert("환영합니다. 관리자님")
		location.href = "./manager/main.jsp"
	</script>
<% }else if(chack == 1){ 
		cId = id;
	    if (cId != null) {
	        cId = URLEncoder.encode(cId, "utf-8");
	
	        Cookie cookie = new Cookie("cookieId", cId);
	        cookie.setMaxAge(-1);
	        response.addCookie(cookie);
	    }
%>
	<script>
		alert("로그인 되었습니다.")
		location.href = "./member/main.jsp"
	</script>
<% }else {%>
	<script>
		alert("등록되지 않은 계정입니다. 다시 시도하여주세요.")
		location.href = "./login.jsp"
	</script>
<% } %>