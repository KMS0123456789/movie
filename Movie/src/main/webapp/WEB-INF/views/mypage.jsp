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
    <section id="main">
        <div id="my">마이페이지</div>
        <div id="btn-list">
            <form action='<c:url value="/board/myWrite.do"/>' method="get">
                <input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">작성 글</button>
            </form>
            <form action='<c:url value="/comment/myComment.do"/>' method="get">
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">작성 댓글</button>
            </form>
            <form action='<c:url value="/board/myLike.do"/>'>
            	<input type="hidden" name="likeUser" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">좋아요 글</button>
            </form>
            <form action='<c:url value="/bpolice/myPoliceWrite.do"/>'>
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">신고 글</button>
            </form>
            <form action='<c:url value="/cpolice/myPoliceComment.do"/>'>
            	<input type="hidden" name="author" value="${sessionScope.user.id}">
                <button id="btn" class="btn" type="submit">신고 댓글</button>
            </form>
        </div>
	        <table id="table">
	        	<c:if test="${myWrite != null}">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                    <th>수정</th>
	                    <th>삭제</th>
	                </tr>
	            </thead>
	            </c:if>
	            <c:if test="${myComment != null}">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                    <th>삭제</th>
	                </tr>
	            </thead>
	            </c:if>
	            <c:if test="${myLike != null}">
	            <thead>
	                <tr>
	                    <th>글 번호</th>
	                    <th>글 제목</th>
	                    <th>작성일</th>
	                    <th>조회수</th>
	                </tr>
	            </thead>
	            </c:if>
	            <c:if test="${myPoliceWrite != null}">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>신고 사유</th>
	                    <th>신고 결과</th>
	                </tr>
	            </thead>
	            </c:if>
	             <c:if test="${myPoliceComment != null}">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>신고 사유</th>
	                    <th>신고 결과</th>
	                </tr>
	            </thead>
	            </c:if>
	            <tbody>
	                <c:forEach items="${myWrite}" var="my">
	                    <tr>
	                        <td>${my.bno}</td>
	                        <td><a href='<c:url value="/board/post.do?bno=${my.bno}"></c:url>'>${my.title}</a></td>
	                        <td>${my.author}</td>
	                        <td>${my.createDate}</td>
	                        <td><button><a href="<c:url value='/board/modify.do?bno=${my.bno}' />">수정</a></button></td>
	                        <td>
		              			<form action='<c:url value="/board/myWriteOff.do"/>' method="post">
						        	<input type="hidden" name="bno" value="${my.bno}">
						        	<button type="submit">삭제</button>
						        </form>
					        </td>
	                    </tr>
	                </c:forEach>
	                <c:forEach items="${myComment}" var="my">
	                    <tr>
	                        <td>${my.cno}</td>
	                        <td><a href='<c:url value="/board/post.do?bno=${my.bno}"></c:url>'>${my.cbody}</a></td>
	                        <td>${my.author}</td>
	                        <td>${my.createDate}</td>
	                        <td>
	                        	<form action='<c:url value="/comment/myCommentOff.do"/>' method="post">
						        	<input type="hidden" name="cno" value="${my.cno}">
						        	<button type="submit">삭제</button>
						        </form>
	                        </td>
	                    </tr>
	                </c:forEach>
	                <c:forEach items="${myLike}" var="my">
	                    <tr>
	                        <td>${my.bno}</td>
	                        <td><a href='<c:url value="/board/post.do?bno=${my.bno}"></c:url>'>${my.title}</a></td>
	                        <td>${my.createDate}</td>
	                        <td>${my.hit}</td>
	                    </tr>
	                </c:forEach>
	                <c:forEach items="${myPoliceWrite}" var="my">
	                    <c:forEach items="${my.boards}" var="bo">
	                    	<c:choose>
		                    	<c:when test="${my.policeResult == 0}">
		                    		<tr>
				                        <td>${my.bno}</td>
				                        <td><a href='<c:url value="/board/post.do?bno=${bo.bno}"></c:url>'>${bo.title}</a></td>
										<td>${bo.author}</td>
										<td>${my.policeReason}</td>
										<td>처리 대기 중</td>
				                    </tr>
		                    	</c:when>
		                    	<c:when test="${my.policeResult == 1}">
		                    		<tr>
				                        <td>${my.bno}</td>
				                        <td>비활성화된 게시글 입니다.</td>
				                        <td>${bo.author}</td>
										<td>${my.policeReason}</td>
										<td>처리 완료</td>
				                    </tr>
		                    	</c:when>
		                    </c:choose>
	                    </c:forEach>
	                </c:forEach>
	                <c:forEach items="${myPoliceComment}" var="my">
	                    <c:forEach items="${my.comments}" var="co">
	                    	<c:choose>
		                    	<c:when test="${my.policeResult == 0}">
		                    		<tr>
				                        <td>${my.cno}</td>
				                        <td><a href='<c:url value="/board/post.do?bno=${co.bno}"></c:url>'>${co.cbody}</a></td>
										<td>${co.author}</td>
										<td>${my.policeReason}</td>
										<td>처리 대기 중</td>
				                    </tr>
		                    	</c:when>
		                    	<c:when test="${my.policeResult == 1}">
		                    		<tr>
				                        <td>${my.cno}</td>
				                        <td>비활성화된 댓글 입니다.</td>
										<td>${co.author}</td>
										<td>${my.policeReason}</td>
										<td>처리 완료</td>
				                    </tr>
		                    	</c:when>
		                    </c:choose>
	                    </c:forEach>
	                </c:forEach>
	            </tbody>
	        </table>
        <div id="btn2">
        </div>
        <c:if test="${myWrite != null}">
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
        </c:if>
        <c:if test="${myComment != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/comment/myComment.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/comment/myComment.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/comment/myComment.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/comment/myComment.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/comment/myComment.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${myLike != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/like/myLike.do?likeUser=${likeUser}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/like/myLike.do?likeUser=${likeUser}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/like/myLike.do?likeUser=${likeUser}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/board/myLike.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/board/myLike.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${myPoliceWrite != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/bpolice/myPoliceWrite.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/bpolice/myPoliceWrite.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/bpolice/myPoliceWrite.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/bpolice/myPoliceWrite.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/bpolice/myPoliceWrite.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${myPoliceComment != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/cpolice/myPoliceComment.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/cpolice/myPoliceComment.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/cpolice/myPoliceComment.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/cpolice/myPoliceComment.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/cpolice/myPoliceComment.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
    </section>
</body>
</html>
