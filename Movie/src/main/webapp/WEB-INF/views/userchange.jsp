<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 페이지</title>
    <style>
        @import url('./main.css');
        @import url('./header_footer.css');
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap');
        @import url('./userchange.css');
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
                    <li><a href="#">영화 사이트</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">리뷰게시판</a></li>
                    <li><a href="#">영화 정보게시판</a></li>
                    <li><a href="#">영화 굿즈게시판</a></li>
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
                    <form>
                        <input type="button" value="비밀번호 변경" id="btns">
                    </form>
                </div>
                <div id="userinfor">
                    <form>
                        <input type="text" placeholder="닉네임" id="text">
                        <input type="submit" value="닉네임변경" id="btns">
                    </form>
                </div>
                <div id="userinfor">
                    <form>
                        <input type="text" placeholder="이메일" id="text">
                        <input type="submit" value="이메일변경" id="btns">
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>