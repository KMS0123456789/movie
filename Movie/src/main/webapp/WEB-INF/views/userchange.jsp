<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>회원정보 페이지</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap');
    </style>
    <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/userchange.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
    <header>
        <nav>
            <div id="menu">
                <ul>
                    <li><a href="<c:url value='/board/board.do'/>">영화 사이트</a></li>
                    <li><a href="<c:url value='/board/freelist.do'/>">영화 자유게시판</a></li>
                    <li><a href="<c:url value='/board/reviewlist.do'/>">영화 리뷰게시판</a></li>
                    <li><a href="<c:url value='/board/minfolist.do'/>">영화 정보게시판</a></li>
                    <li><a href="<c:url value='/board/goodslist.do'/>">영화 굿즈 게시판</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <section>
        <h2 id="userchange">회원정보 변경</h2>
        <div>
            <div id="user">
                <div class="id">아이디</div>
                <div id="userinfor">
                    <form action="<c:url value="/user/changePw.do"/>">
                    	<input type="hidden" name="id" value="${sessionScope.user.id}">
                        <input type="submit" value="비밀번호 변경" id="btns">
                    </form>
                </div>
                 <div id="userinfor">
                    <form id="nickForm" action="<c:url value='/user/changenick.do'/>" method="post">
                        <input type="hidden" name="id" value="${sessionScope.user.id}">
                        <input type="text" name="nick" id="nick" placeholder="닉네임">
                        <button type="button" id="checkNickButton">닉네임 중복확인</button>
                        <input type="submit" value="닉네임변경" id="btns">
                    </form>
                </div>
                <div id="userinfor">
                    <form id="emailForm" action="<c:url value='/user/changeemail.do'/>" method="post">
                        <input type="hidden" name="id" value="${sessionScope.user.id}">
                        <input type="text" name="email" id="email" placeholder="이메일">
                        <button type="button" id="checkEmailButton">이메일 중복확인</button>
                        <input type="submit" value="이메일변경" id="btns">
                    </form>
                </div>
            </div>
        </div>
    </section>
    <script>
        let nickCheck = false;
        let emailCheck = false;

        $("#checkNickButton").on("click", function() {
            let nick = $("#nick");
            if (nick.val().trim() == "") {
                alert("닉네임을 입력해주세요");
                return;
            }

            $.ajax({
                type: "post",
                url: "<c:url value='/user/nickCheck.do'/>",
                data: {
                    "nick": nick.val()
                },
                success: function(data) {
                    if (data.result == "success") {
                        nickCheck = true;
                        alert("변경 가능한 닉네임");
                    } else {
                        nickCheck = false;
                        alert("회원 닉네임 중복");
                    }
                },
                error: function() {
                    alert("서버 요청 중 오류가 발생했습니다.");
                }
            });
        });

        $("#checkEmailButton").on("click", function() {
            let email = $("#email");
            if (email.val().trim() == "") {
                alert("이메일을 입력해주세요");
                return;
            }

            $.ajax({
                type: "post",
                url: "<c:url value='/user/emailCheck.do'/>",
                data: {
                    "email": email.val()
                },
                success: function(data) {
                    if (data.result == "success") {
                        emailCheck = true;
                        alert("변경 가능한 이메일");
                    } else {
                        emailCheck = false;
                        alert("회원 이메일 중복");
                    }
                },
                error: function() {
                    alert("서버 요청 중 오류가 발생했습니다.");
                }
            });
        });

        $("#nickForm").on("submit", function(e) {
            if (!nickCheck) {
                alert("닉네임 변경 불가");
                e.preventDefault();
            }
        });

        $("#emailForm").on("submit", function(e) {
            if (!emailCheck) {
                alert("이메일 변경 불가");
                e.preventDefault();
            }
        });
    </script>
</body>
</html>