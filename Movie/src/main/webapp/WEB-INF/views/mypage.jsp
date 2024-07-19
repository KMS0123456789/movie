<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <form action='<c:url value="/board/myWrite.do"/>' method="get">
                <input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">작성 글</button>
            </form>
            <form>
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">작성 댓글</button>
            </form>
            <form>
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">좋아요 글</button>
            </form>
            <form>
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">신고 글</button>
            </form>
        </div>
        <table id="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th><input type="checkbox" id="checkAll" onclick="toggleAll(this)" name="bno"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${my}" var="my">
                    <tr>
                        <td>${my.bno}</td>
                        <td><a href='<c:url value="/board/post.do?bno=${my.bno}"></c:url>'>${my.title}</a></td>
                        <td>${my.author}</td>
                        <td>${my.createDate}</td>
                        <td>${my.hit}</td>
                        <td><input type="checkbox" class="checkItem" name="bno" value="${my.bno}"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="btn2">
        	<form>
        		<button>삭제</button>
        	</form>
        </div>
        <div>
            <ul id="page">
                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>

                <c:if test="${currentPage > 1}">
                    <li><a href="<c:url value='/board/myWrite.do?author=${author}&page=1' />">&lt;&lt;</a></li>
                    <li><a href="<c:url value='/board/myWrite.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
                    <c:choose>
                        <c:when test="${currentPage == pageNum}">
                            <li><a>${pageNum}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="<c:url value='/board/myWrite.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPage}">
                    <li><a href="<c:url value='/board/myWrite.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
                    <li><a href="<c:url value='/board/myWrite.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
                </c:if>
            </ul>
        </div>
    </section>
    </c:when>
    <c:otherwise>
        <%
            String url = "localhost:8080/controller/board/board.do";
            response.sendRedirect(url);
        %>
    </c:otherwise>
</c:choose>

<script>

</script>

</body>
</html>
