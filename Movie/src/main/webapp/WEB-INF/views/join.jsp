<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>회원가입</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
    </style>
    <link href="<c:url value='/resources/css/header_footer.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/join.css' />" rel="stylesheet">
</head>
<body style="background-color: #e3d7ea;">
    <header>
        <nav>
            <div id="menu">
                <ul>
                    <li><a href="home.do">영화 사이트</a></li>
                    <li><a href="freelist.do">자유게시판</a></li>
                    <li><a href="reviewlist.do">리뷰게시판</a></li>
                    <li><a href="minfolist.do">영화 정보게시판</a></li>
                    <li><a href="goodslist.do">굿즈 게시판</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="container">
        <h1>회원가입</h1>
        <form action="join.do" method="post">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id">
                <button type="button" id="checkIdButton">아이디 중복확인</button>
               	
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="pw" name="pw">
            </div>
            <div class="form-group">
                <label for="passwordValid">비밀번호 확인</label>
                <input type="password" id="pwValid" name="pwValid">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nick" name="nick">
                <button type="button" id="checkNickButton">닉네임 중복확인</button>
                
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" id="email" name="email">
                <button type="button" id="checkEmailButton">이메일 중복확인</button>
                
            </div>
            <button type="submit" class="submit-btn">가입하기</button>
        </form>
    </div>
</body>
   <script>
		let idCheck = false;
		let nickCheck = false;
		let emailCheck = false;
	
		$("#checkIdButton").on("click", function(){
			let id = $("#id");
			if(id.val().trim() == ""){
				alert("아이디를 입력해주세요");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "<c:url value='/board/idCheck.do'/>",
				data : {
					"id" : id.val()
				},
				success : function(data){
					if(data.result == "success"){
						idCheck = true;
						alert("회원가입 가능한 아이디");
					}else{
						idCheck = false;
						alert("회원 아이디 중복");
					}
				}
			});
			
		});
		
		$("#checkNickButton").on("click", function(){
			let nick = $("#nick");
			if(nick.val().trim() == ""){
				alert("닉네임을 입력해주세요");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "<c:url value='/board/nickCheck.do'/>",
				data : {
					"nick" : nick.val()
				},
				success : function(data){
					if(data.result == "success"){
						nickCheck = true;
						alert("회원가입 가능한 닉네임");
					}else{
						nickCheck = false;
						alert("회원 닉네임 중복");
					}
				}
			});
			
		});
		
		$("#checkEmailButton").on("click", function(){
			let email = $("#email");
			if(email.val().trim() == ""){
				alert("이메일을 입력해주세요");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "<c:url value='/board/emailCheck.do'/>",
				data : {
					"email" : email.val()
				},
				success : function(data){
					if(data.result == "success"){
						emailCheck = true;
						alert("회원가입 가능한 이메일");
					}else{
						emailCheck = false;
						alert("회원 이메일 중복");
					}
				}
			});
			
		});
		
		$("form").submit(function(){
			let id = $("#id");
			let pw = $("#pw");
			let pwValid = $("#pwValid");
			let nick = $("#nick");
            let email = $("#email");
			
			if(id.val().trim() == ""){
				alert("아이디를 입력해주세요");
				id.focus();
				return false;
			}
			
			if(idCheck == false){
				alert("아이디 중복체크를 해주세요");
				return false;
			}
			
			if(pw.val().trim() == ""){
				alert("비밀번호를 입력해주세요");
				pw.focus();
				return false;
			}
			
			if (pw.val().trim() != pwValid.val().trim()) {
                alert("비밀번호가 일치하지 않습니다.");
                pw.focus();
                return false;
			}
			
			if(nick.val().trim() == ""){
				alert("닉네임을 입력해주세요");
				nick.focus();
				return false;
			}
			
			if(nickCheck == false){
				alert("닉네임 중복체크를 해주세요");
				return false;
			}
			
			if(email.val().trim() == ""){
				alert("이메일을 입력해주세요");
				email.focus();
				return false;
			}
			
			if(emailCheck == false){
				alert("이메일 중복체크를 해주세요");
				return false;
			}
			return true;
		});
	</script>
</html>
