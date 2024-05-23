<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/delete.css">
<title>회원탈퇴</title>
<script>
	function checkBox(){
		var checkbox = document.getElementById('check');
		if(checkbox.checked){
			location.href = "deleteMember.jsp";
		}else{
			alert("동의란에 체크를 해주세요.");
		}
	}
</script>
</head>
<body>
	<div class="header">
		<div class="head">
			<h1 class="main">
				<a href="./main.jsp">
					<img src="../img/logo1.png">
				</a>
			</h1>
		</div>
	</div>
	<div align="center">
		<h1>회원탈퇴</h1>
		<hr>
		회원탈퇴를 하더라도 현재까지 작성하신 게시글은 삭제되지 않습니다.<br><br>
		<input type="checkbox" id="check"> 동의합니다.<br>
		<br><button onclick="checkBox()">탈퇴하기</button>
	</div>
</body>
</html>