<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>ID 찾기</title>
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
<body>
    <div class="container">
        <h1>아이디 확인</h1>
        <h1 style="color:white;">${vo.id}</h1>
    </div>
</body>
</html>