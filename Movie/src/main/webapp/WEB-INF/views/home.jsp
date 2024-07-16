<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        @import url('./header_footer.css');
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
    </style>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/header_footer.css'/>">
</head>
<body>
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
    <section>
        <div id="container">
            <div id="case">
                <div id="free">자유게시판 최신 글</div>
            </div>
            <div id="case">
                <div id="free">리뷰게시판 최신 글</div>
            </div>
            <div id="logincase" >
                <div id="login">
                    <h2>로그인</h2>
                    <form method="post">
                        <div class="information">
                            <div id="label"><label for="id">아이디</label></div>
                            <input type="text" name="id" placeholder="id를 입력하세요." id="id"><br>
                        </div>
                        <div class="information">
                            <div id="label"><label for="password">비밀번호</label></div>
                            <input type="password" name="password" placeholder="비밀번호를 입력하세요." id="pw">
                        </div>
                        <div id="btn">
                            <button type="submit" id="sub">로그인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="container">
            <div id="case">
                <div id="free">영화 정보게시판 최신 글</div>
            </div>
            <div id="case">
                <div id="free">영화 굿즈게시판 최신 글</div>
            </div>
        </div>
    </section>
</body>
</html>