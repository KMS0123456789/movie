<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
        </style>
            <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet">
            <link href="<c:url value='/resources/css/list.css'/>" rel="stylesheet">
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
            <h2 class="list_h2">영화 정보 게시판</h2>
            <h3 class="list_h3">게시글 목록</h3>
            <form action="<c:url value="/board/minfolist.do" />" method="get" id="form">
                <div class="searchDiv">
                    <select name="searchType">
                        <option value="title" ${param.searchType == 'title'  ? 'selected' : ''}>제목</option>
                        <option value="author" ${param.searchType == 'body'  ? 'selected' : ''}>작성자</option>
                        <option value="body" ${param.searchType == 'writer'  ? 'selected' : ''}>내용</option>
                    </select>
                    <input type="text" name="keyword" value="${param.keyword}">
                    <input type="submit" value="검색">
                </div>
            </form>
            <table id="table">
                <colgroup>
                    <col width="200px">
                    <col width="400px">
                    <col width="200px">
                    <col width="250px">
                    <col width="200px">
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${mPage}" var="bvo">
                    <c:if test="${bvo.notice == 0}">
						<tr>
							<td>공지</td>
							<td><a href='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>${bvo.title}</a></td>
							<td>${bvo.author}</td>
							<td>${bvo.createDate}</td>
							<td>${bvo.hit}</td>
						</tr>
					</c:if>
					</c:forEach>
                </tbody>
                <tbody>
                    <c:forEach items="${mPage}" var="bvo">
                    <c:if test="${bvo.notice == 1}">
						<tr>
							<td>${bvo.bno}</td>
							<td><a href='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>${bvo.title}</a></td>
							<td>${bvo.author}</td>
							<td>${bvo.createDate}</td>
							<td>${bvo.hit}</td>
						</tr>
					</c:if>
					</c:forEach>
                </tbody>
            </table>
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
			<c:if test="${!empty sessionScope.user.id}">
				<button type="button" id="write"><a href="write.do">글 쓰기</a></button>
			</c:if>
             <div>
                <ul id="page">
                 <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>

				<c:if test="${currentPage > 1}">
						<li><a href="<c:url value="/board/minfolist.do?page=1" />">&lt;&lt;</a></li>
						<li><a href="<c:url value="/board/minfolist.do?page=${currentPage-1}" />">&lt;</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
					<c:choose>
						<c:when test="${currentPage == pageNum}">
							<li><a>${pageNum}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value="/board/minfolist.do?page=${pageNum}" />">${pageNum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<li><a href="<c:url value="/board/minfolist.do?page=${currentPage+1}" />">&gt;</a></li>
					<li><a href="<c:url value="/board/minfolist.do?page=${totalPage}" />">&gt;&gt;</a></li>
				</c:if>
                </ul>
            </div>
    </body>
</html>