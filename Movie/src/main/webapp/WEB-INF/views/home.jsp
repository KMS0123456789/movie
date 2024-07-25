<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
     <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
        <div id="container">
            <div id="case">
                <div id="free">영화 자유게시판 최신 글</div>
                <c:forEach items="${list}" var="list">
                	<c:set var="i" value="${i+1 }"/>
                	<c:if test="${list.categoryNo == 0 and list.deleteFlag == 0}">
               			<ul id="list">
                			<li id="li">
             					<span id="span">${i}</span>
								<a href='<c:url value="/board/post.do?bno=${list.bno}"></c:url>'>${list.title}</a>
							</li>
                		</ul>
                	</c:if>
                </c:forEach>
            </div>
            <div id="case">
                <div id="free">영화 리뷰게시판 최신 글</div>
                <c:forEach items="${list}" var="list">
                	<c:if test="${list.categoryNo == 1 and list.deleteFlag == 0}">
                		<c:set var="j" value="${ j+1 }"/>
                		<ul id="list">
                			<li id="li">
             					<span id="span2">${j}</span>
								<a href='<c:url value="/board/post.do?bno=${list.bno}"></c:url>'>${list.title}</a>
							</li>
                		</ul>
                	</c:if>
                </c:forEach>
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
                <c:forEach items="${list}" var="list">
                	<c:if test="${list.categoryNo == 2 and list.deleteFlag == 0}">
                		<c:set var="k" value="${ k+1 }"/>
                		<ul id="list">
                			<li id="li">
             					<span id="span3">${k}</span>
								<td><a href='<c:url value="/board/post.do?bno=${list.bno}"></c:url>'>${list.title}</a>
							</li>
                		</ul>
                	</c:if>
                </c:forEach>
            </div>
            <div id="case">
                <div id="free">영화 굿즈게시판 최신 글</div>
                <c:forEach items="${list}" var="list">
                	<c:if test="${list.categoryNo == 3 and list.deleteFlag == 0}">
                		<c:set var="l" value="${ l+1 }"/>
                		<ul id="list">
                			<li id="li">
             					<span id="span4">${l}</span>
								<a href='<c:url value="/board/post.do?bno=${list.bno}"></c:url>'>${list.title}</a>
							</li>
                		</ul>
                	</c:if>
                </c:forEach>
            </div>
        </div>
    </section>
    <script type="text/javascript">
    	$('#span').first().css("background-color","red");
    	$('#span2').first().css("background-color","red");
    	$('#span3').first().css("background-color","red");
    	$('#span4').first().css("background-color","red");
    </script>
</body>
</html>