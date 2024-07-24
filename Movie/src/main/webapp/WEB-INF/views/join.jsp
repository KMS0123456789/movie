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
    <link href="<c:url value='/resources/css/join.css' />" rel="stylesheet">
</head>
<body style="background-color: #e3d7ea;">
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
			    <span id="passwordMatch" class="password-match">비밀번호가 일치합니다.</span>
			    <span id="passwordMismatch" class="password-mismatch">비밀번호가 일치하지 않습니다.</span>
			</div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nick" name="nick">
                <button type="button" id="checkNickButton">닉네임 중복확인</button>
            </div>
            <div class="form-group">
                <label for="emailId">이메일</label>
                <input type="text" id="emailId" name="emailId">
                <select id="emailDomain" name="emailDomain">
                    <option value="@naver.com">@naver.com</option>
                    <option value="@gmail.com">@gmail.com</option>
                    <option value="@daum.net">@daum.net</option>
                </select>
                <button type="button" id="checkEmailButton">이메일 중복확인</button>
            </div>
            <button type="submit" class="submit-btn">가입하기</button>
        </form>
    </div>
</body>
<script>
	$(document).ready(function() {
	    var message = "${message}";
	    var error = "${error}";
	    
	    if(message && message.trim() !== "") {
	        alert(message);
	    }
	    
	    if(error && error.trim() !== "") {
	        alert(error);
	    }
	});

    let idCheck = false;
    let nickCheck = false;
    let emailCheck = false;

    $("#checkIdButton").on("click", function(){
        let id = $("#id");
        if(id.val().trim() == ""){
            alert("아이디를 입력해주세요");
            return;
        }
        if(id.val().trim().length < 5){
            alert("아이디는 5자 이상이어야 합니다.");
            return;
        }
        
        $.ajax({
            type: "post",
            url: "<c:url value='/user/idCheck.do'/>",
            data: {
                "id": id.val()
            },
            dataType: 'json',
            success: function(data) {
                console.log("Server response:", data);
                if (data.result === "success") {
                    idCheck = true;
                    alert("회원가입 가능한 아이디");
                } else {
                    idCheck = false;
                    alert("회원 아이디 중복");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error: ", textStatus, errorThrown);
                console.log("Response Text:", jqXHR.responseText);
                alert("아이디 중복 확인 중 오류가 발생했습니다.");
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
            url : "<c:url value='/user/nickCheck.do'/>",
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
        let emailId = $("#emailId");
        let emailDomain = $("#emailDomain").val();
        let email = emailId.val() + emailDomain;
        
        if(emailId.val().trim() == ""){
            alert("이메일을 입력해주세요");
            return;
        }
        
        $.ajax({
            type : "post",
            url : "<c:url value='/user/emailCheck.do'/>",
            data : {
                "email" : email
            },
            dataType: 'json',
            success : function(data){
                if(data.result == "success"){
                    emailCheck = true;
                    alert("회원가입 가능한 이메일");
                }else{
                    emailCheck = false;
                    alert("회원 이메일 중복");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error: ", textStatus, errorThrown);
                console.log("Response Text:", jqXHR.responseText);
                alert("이메일 중복 확인 중 오류가 발생했습니다.");
            }
        });
    });

    $("#pw, #pwValid").on("input", function(){
        let pw = $("#pw").val();
        let pwValid = $("#pwValid").val();

        if (pw === pwValid) {
            $("#passwordMatch").show();
            $("#passwordMismatch").hide();
        } else {
            $("#passwordMatch").hide();
            $("#passwordMismatch").show();
        }
    });
    
    $("form").submit(function(e){
        e.preventDefault();
        
        let id = $("#id");
        let pw = $("#pw");
        let pwValid = $("#pwValid");
        let nick = $("#nick");
        let emailId = $("#emailId");
        let emailDomain = $("#emailDomain").val();
        let email = emailId.val() + emailDomain;

        if(id.val().trim() == ""){
            alert("아이디를 입력해주세요");
            id.focus();
            return false;
        }

        if(id.val().trim().length < 5){
            alert("아이디는 5자 이상이어야 합니다.");
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

        if(pw.val().trim().length < 5){
            alert("비밀번호는 5자 이상이어야 합니다.");
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

        if(emailId.val().trim() == ""){
            alert("이메일을 입력해주세요");
            emailId.focus();
            return false;
        }

        if(emailCheck == false){
            alert("이메일 중복체크를 해주세요");
            return false;
        }

        $("<input>").attr({
            type: "hidden",
            name: "email",
            value: email
        }).appendTo($(this));

        this.submit();
    });
    
</script>
</html>
