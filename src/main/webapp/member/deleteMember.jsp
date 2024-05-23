<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	dao.deleteMember(id.toString());
%>
<script>
	alert("회원탈퇴가 완료되었습니다.");
	location.href = "../index.jsp";
</script>