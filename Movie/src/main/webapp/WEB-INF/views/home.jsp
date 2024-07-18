<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
    </style>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/header_footer.css'/>">
</head>
<body>
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
    <section>
        <div id="container">
            <div id="case">
                <div id="free">자유게시판 최신 글</div>
            </div>
            <div id="case">
                <div id="free">리뷰게시판 최신 글</div>
            </div>
             <c:choose>
				<c:when test="${sessionScope.user.userType > 0}">
					<%@ include file="./includes/userlogincase.jsp" %>
				</c:when>
				<c:when test="${sessionScope.user.userType == 0}">
					<%@ include file="./includes/managerlogincase.jsp" %>
				</c:when>
				<c:otherwise>
					<%@ include file="./includes/b_logincase.jsp" %>
				</c:otherwise>
			</c:choose>
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