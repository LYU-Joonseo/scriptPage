<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cookie = request.getHeader("Cookie");
	if(cookie != null){
		Cookie[] c = request.getCookies();
		for (Cookie coo : c){
			coo.setMaxAge(0);
			response.addCookie(coo);
		}
	}
	
%>
<script>
	alert(`로그아웃합니다.`)
	location.href = "./index.jsp"
</script>