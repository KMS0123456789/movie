<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap');
    </style>
    <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/mypage.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<c:choose>
	<c:when test="${!empty sessionScope.user.id}">
    <header>
        <nav>
            <div id="menu">
                <ul>
                    <li><a href="board.do">영화 사이트</a></li>
                    <li><a href="freelist.do">영화 자유 게시판</a></li>
                    <li><a href="reviewlist.do">영화 리뷰 게시판</a></li>
                    <li><a href="minfolist.do">영화 정보 게시판</a></li>
                    <li><a href="goodslist.do">영화 굿즈 게시판</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <section id="main">
        <div id="my">마이페이지</div>
        <div id="btn-list">
            <button id="btn" class="btn">작성 글</button>
            <button id="btn">작성 댓글</button>
            <button id="btn">좋아요 누른 글</button>
            <button id="btn">신고 한 글</button>
        </div>
        <table id="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th><input type="checkbox"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>안녕하세요</td>
                    <td>작성자1</td>
                    <td>2024.07.10</td>
                    <td>10</td>
                    <td><input type="checkbox"></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>안녕하세요</td>
                    <td>작성자1</td>
                    <td>2024.07.10</td>
                    <td>10</td>
                    <td><input type="checkbox"></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>안녕하세요</td>
                    <td>작성자1</td>
                    <td>2024.07.10</td>
                    <td>10</td>
                    <td><input type="checkbox"></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>안녕하세요</td>
                    <td>작성자1</td>
                    <td>2024.07.10</td>
                    <td>10</td>
                    <td><input type="checkbox"></td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>안녕하세요</td>
                    <td>작성자1</td>
                    <td>2024.07.10</td>
                    <td>10</td>
                    <td><input type="checkbox"></td>
                </tr>
            </tbody>
        </table>
        <div id="btn2">
            <button class="btn">삭제</button>
        </div>
        <ul id="page">
            <li><a>&lt;&lt;</a></li>
            <li><a>&lt;</a></li>
            <li><a>1</a></li>
            <li><a>2</a></li>
            <li><a>3</a></li>
            <li><a>4</a></li>
            <li><a>5</a></li>
            <li><a>6</a></li>
            <li><a>7</a></li>
            <li><a>8</a></li>
            <li><a>9</a></li>
            <li><a>10</a></li>
            <li><a>&gt;</a></li>
            <li><a>&gt;&gt;</a></li>
        </ul>
    	</section>
    	</c:when>
    	<c:otherwise>
    		<%
    			String url = "localhost:8080/controller/board/board.do";
    			response.sendRedirect(url);
    		%>
    	</c:otherwise>
</c:choose>
</body>
</html>