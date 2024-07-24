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
	     <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body style="background-color: #e3d7ea;">
	    <div class="secDiv">
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
		    <div id="my">관리자 페이지</div>
			    <div>
			        <a href="<c:url value="/bpolice/policeWrite.do"/>"><input type="button" value="신고한 글" class="btn"></a>
			        <a href="<c:url value="/cpolice/policeComment.do"/>"><input type="button" value="신고 댓글"  class="btn"></a>
			        <a href="<c:url value="/user/policeUser.do"/>"><input type="button" value="신고된 유저"  class="btn"></a>
			        <a href="<c:url value="/board/offWrite.do"/>"><input type="button" value="비활성화 글"  class="btn"></a>
			        <a href="<c:url value="/comment/offComment.do"/>"><input type="button" value="비활성화 댓글"  class="btn"></a>
			        <a href="<c:url value="/user/offUser.do"/>"><input type="button" value="비활성화 유저"  class="btn"></a>
			    </div>
		    <div>
		    <table id="table">
	        	<c:if test="${policeWrite != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>신고사유</th>
		                    <th>비활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <c:if test="${policeComment != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>신고사유</th>
		                    <th>비활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <c:if test="${policeUser != null}">
		            <thead>
		                <tr>
		                    <th>아이디</th>
		                    <th>닉네임</th>
		                    <th>비활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <c:if test="${policeUserTotal != null}">
		            <thead>
		                <tr>
		                    <th>아이디</th>
		                    <th>닉네임</th>
		                    <th>신고 횟수</th>
		                    <th>비활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	        	<c:if test="${offWrite != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>작성일</th>
		                    <th>활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <c:if test="${offComment != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>작성일</th>
		                    <th>활성화</th>
		                </tr>
		            </thead>
		        </c:if>
		        <c:if test="${offUser != null}">
		            <thead>
		                <tr>
		                    <th>아이디</th>
		                    <th>닉네임</th>
		                    <th>활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <tbody>
	            <c:forEach items="${policeWrite}" var="manager">
	            	 <c:forEach items="${manager.boards}" var="bo">
	            	 	<c:if test="${bo.deleteFlag == 0 }">
	            	 		<tr>
		                        <td>${manager.bno}</td>
		                        <td><a href='<c:url value="/board/post.do?bno=${manager.bno}"/>'>${bo.title}</a></td>
		                        <td>${manager.policeReason}</td>
		                        <td>
			              			<form action='<c:url value="/board/policeWriteOff.do"/>' method="post">
							        	<input type="hidden" name="bno" value="${manager.bno}">
							        	<button type="submit" >비활성화</button>
							        </form>
						        </td>
		                    </tr>
	            	 	</c:if>
                    </c:forEach>
                </c:forEach>
                <c:forEach items="${policeComment}" var="manager">
                    <tr>
                        <td>${manager.cno}</td>
                        <c:forEach items="${manager.comments}" var="co">
                        	<td><a href='<c:url value="/board/post.do?bno=${co.bno}"/>'>${co.cbody}</a></td>
                        </c:forEach>
                        <td>${manager.policeReason}</td>
                        <td>
	              			<form action='<c:url value="/board/policeWriteOff.do"/>' method="post">
					        	<input type="hidden" name="cno" value="${manager.cno}">
					        	<button type="submit" >비활성화</button>
					        </form>
				        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${policeUser}" var="manager">
            		<tr>
                      <td>${manager.id}</td>
                      <td>${manager.nick}</td>
                      <td>
                   		 <form action='<c:url value="/user/policeUserTotal.do"/>' method="post">
	                    	<input type="hidden" name="id" value="${manager.id}">
	                    	<button type="submit">조회</button>
	                     </form>
                   	  </td>
                    </tr>
                </c:forEach>
                
                <c:forEach items="${policeUserTotal}" var="manager">
            		<tr>
                      <td>${manager.id}</td>
                      <td>${manager.nick}</td>
                      <td>${manager.countTotal}</td>
                      <td>
						 <form action='<c:url value="/user/policeUserTotal.do"/>' method="post">
						 <input type="hidden" name="id" value="${manager.id}">
						 <button type="submit">비활성화</button>
						 </form>
                   	  </td>
                    </tr>
                </c:forEach>
               
                <c:forEach items="${offWrite}" var="manager">
                    <tr>
                        <td>${manager.bno}</td>
                        <td><a href='<c:url value="/board/post.do?bno=${manager.bno}"></c:url>'>${manager.title}</a></td>
                        <td>${manager.author}</td>
                        <td>${manager.createDate}</td>
                        <td>
	              			<form action='<c:url value="/board/writeOn.do"/>' method="post">
					        	<input type="hidden" name="bno" value="${manager.bno}">
					        	<button type="submit">활성화</button>
					        </form>
				        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${offComment}" var="manager">
                    <tr>
                        <td>${manager.cno}</td>
                        <td><a href='<c:url value="/board/post.do?bno=${manager.bno}"></c:url>'>${manager.cbody}</a></td>
                        <td>${manager.author}</td>
                        <td>${manager.createDate}</td>
                        <td>
                        	<form action='<c:url value="/comment/commentOn.do"/>' method="post">
					        	<input type="hidden" name="cno" value="${manager.cno}">
					        	<button type="submit">활성화</button>
					        </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${offUser}" var="manager">
            		<tr>
	                    <td>${manager.id}</td>
	                    <td>${manager.nick}</td>
                   	</tr>
                </c:forEach>
	            </tbody>
	        </table>
        <div id="btn2">
        </div>
        <c:if test="${policeWrite != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
         <c:if test="${policeComment != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/board/policeWrite.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${offWrite != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/board/offWrite.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/board/offWrite.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/board/offWrite.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/board/offWrite.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/board/offWrite.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${offComment != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/comment/offComment.do?author=${author}&page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/comment/offComment.do?author=${author}&page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/comment/offComment.do?author=${author}&page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/comment/offComment.do?author=${author}&page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/comment/offComment.do?author=${author}&page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
        <c:if test="${offUser != null}">
        	<div>
	            <ul id="page">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
	                <c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
	                <c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
	
	                <c:if test="${currentPage > 1}">
	                    <li><a href="<c:url value='/user/offUser.do?page=1' />">&lt;&lt;</a></li>
	                    <li><a href="<c:url value='/user/offUser.do?page=${currentPage-1}' />">&lt;</a></li>
	                </c:if>
	                <c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
	                    <c:choose>
	                        <c:when test="${currentPage == pageNum}">
	                            <li><a>${pageNum}</a></li>
	                        </c:when>
	                        <c:otherwise>
	                            <li><a href="<c:url value='/user/offUser.do?page=${pageNum}' />">${pageNum}</a></li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                <c:if test="${currentPage < totalPage}">
	                    <li><a href="<c:url value='/user/offUser.do?page=${currentPage+1}' />">&gt;</a></li>
	                    <li><a href="<c:url value='/user/offUser.do?page=${totalPage}' />">&gt;&gt;</a></li>
	                </c:if>
	            </ul>
        	</div>
        </c:if>
		</div>
	    <br>
	    <form action="#" method="get" id="page">
	        <select name="searchType" >
	            <option value="title">제목</option>
	            <option value="body">내용</option>
	            <option value="author">작성자</option>
	        </select>
	        <input type="text" name="search" placeholder="검색어 입력창">
	        <input type="submit" value="검색" id="#btn1">
	    </form>
	</body>
</html>