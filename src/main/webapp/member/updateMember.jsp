<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Cookie[] cookie = request.getCookies();
	
	String id = null;
	if(cookie != null){
		for(Cookie c : cookie){
			String cName = c.getName();
			String cId = c.getValue();
			
			if("cookieId".equals(cName)){
				cId = URLDecoder.decode(cId, "utf-8");
				id = cId;
			}
		}
	}
	String password = request.getParameter("password");
	String newPw = request.getParameter("newPw");
	String chPw = request.getParameter("chPw");
	String newName = request.getParameter("newName");
	
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setPassword(password);
	MemberDAO dao = new MemberDAO();
	
	int chaek = dao.login(member);
	
	if(chaek == 0){%>
		<script>
			alert('현재 비밀번호가 일치 하지 않습니다.\n다시 입력해주세요.');
			location.href = './modify.jsp';
		</script>
<%	}else if(!newPw.equals(chPw)){%>
		<script>
			alert('변경할 비밀번호와 비밀번호확인이 일치 하지 않습니다.\n다시 입력해주세요.');
			location.href = './modify.jsp';
		</script>	
<%	}else{
		member.setPassword(newPw);
		member.setName(newName);
		dao.updateMember(member);
%>
	<script>
		alert('정보 수정완료\n다시 로그인해주세요.');
		location.href = '../login.jsp';
	</script>
<% }%>