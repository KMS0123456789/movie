<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 페이지</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap');
    </style>
    <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/userchgnge.css'/>" rel="stylesheet">
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
                    <form action="<c:url value="/user/changenick.do"/>" method="post">
                    	<input type="hidden" name="id" value="${sessionScope.user.id}">
                        <input type="text" name="nick" placeholder="닉네임" id="text">
                        <input type="submit" value="닉네임변경" id="btns">
                    </form>
                </div>
                <div id="userinfor">
                    <form action="<c:url value="/user/changeemail.do"/>" method="post">
                    	<input type="hidden" name="id" value="${sessionScope.user.id}">
                        <input type="text" name="email" placeholder="이메일" id="text">
                        <input type="submit" value="이메일변경" id="btns">
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>