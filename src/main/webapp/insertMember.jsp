<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="kr.ac.kopo.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String name = null;
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	name = request.getParameter("name");
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = new MemberVO(id, pass, name);
	
	int chack = dao.selectById(id);
	if(chack != 0){
%>
	<script>
		alert("이미 등록된 사용자입니다. 다시 작성해주세요.")
		location.href = "./signUp.jsp"
	</script>
<%	}else{
		dao.insertMember(member);
%>
	<script>
		alert("회원가입이 완료되었습니다. 로그인 페이지로 전환합니다.")
		location.href = "./login.jsp"
	</script>	
<%	} %>