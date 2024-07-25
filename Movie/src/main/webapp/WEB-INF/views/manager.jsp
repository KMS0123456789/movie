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
			    <div id="btn-list">
			        <button class="btn"><a href="<c:url value="/bpolice/policeWrite.do"/>">신고된 글</a></button>
			        <button class="btn"><a href="<c:url value="/cpolice/policeComment.do"/>">신고된 댓글</a></button>
			        <button class="btn"><a href="<c:url value="/user/policeUser.do"/>">신고된 유저</a></button>
			        <button class="btn"><a href="<c:url value="/board/offWrite.do"/>">비활성화 글</a></button>
			        <button class="btn"><a href="<c:url value="/comment/offComment.do"/>">비활성화 댓글</a></button>
			        <button class="btn"><a href="<c:url value="/user/offUser.do"/>">비활성화 유저</a></button>
			    </div>
		    <div>
		    <c:if test="${policeWrite != null}">
		        <form action="<c:url value="/bpolice/policeWrite.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
			                <option value="title" ${param.searchType == 'title'  ? 'selected' : ''}>제목</option>
	                        <option value="body" ${param.searchType == 'body'  ? 'selected' : ''}>내용</option>
	                        <option value="author" ${param.searchType == 'author'  ? 'selected' : ''}>작성자</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
        	<c:if test="${policeComment != null}">
		        <form action="<c:url value="/cpolice/policeComment.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
	                        <option value="cbody" ${param.searchType == 'cbody'  ? 'selected' : ''}>내용</option>
	                        <option value="author" ${param.searchType == 'author'  ? 'selected' : ''}>작성자</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
        	<c:if test="${policeUser != null}">
		        <form action="<c:url value="/user/policeUser.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
	                        <option value="id" ${param.searchType == 'id'  ? 'selected' : ''}>아이디</option>
	                        <option value="nick" ${param.searchType == 'nick'  ? 'selected' : ''}>닉네임</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
        	<c:if test="${offWrite != null}">
		        <form action="<c:url value="/board/offWrite.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
			                <option value="title" ${param.searchType == 'title'  ? 'selected' : ''}>제목</option>
	                        <option value="body" ${param.searchType == 'body'  ? 'selected' : ''}>내용</option>
	                        <option value="author" ${param.searchType == 'author'  ? 'selected' : ''}>작성자</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
        	<c:if test="${offComment != null}">
		        <form action="<c:url value="/comment/offComment.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
	                        <option value="cbody" ${param.searchType == 'cbody'  ? 'selected' : ''}>내용</option>
	                        <option value="author" ${param.searchType == 'author'  ? 'selected' : ''}>작성자</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
        	<c:if test="${offUser != null}">
		        <form action="<c:url value="/user/offUser.do" />" method="get" id="form">
			        <div class="searchDiv">
			            <select name="searchType">
	                        <option value="id" ${param.searchType == 'id'  ? 'selected' : ''}>아이디</option>
	                        <option value="nick" ${param.searchType == 'nick'  ? 'selected' : ''}>닉네임</option>
			            </select>
			            <input type="text" name="keyword" value="${param.keyword}">
			            <input type="submit" value="검색">
			        </div>
		        </form>
        	</c:if>
		    <table id="table">
	        	<c:if test="${policeWrite != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
				            <th>신고자</th>
		                    <th>신고사유</th>
		                    <th>비활성화</th>
		                </tr>
		            </thead>
	            </c:if>
	            <c:if test="${policeComment != null}">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>내용</th>
		                    <th>작성자</th>
		                    <th>신고자</th>
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
		                    <th>신고 유무</th>
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
		                    <th>신고 유무</th>
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
		                        <form action='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>
									<input type="hidden" name="bno" value="${bvo.bno}">
									<input type="hidden" name="id" value="${sessionScope.user.id}">
									<td><button type="submit">${bvo.title}</button></td>
								</form>
		                        <td>${bo.author}</td>
		                        <td>${manager.policeMan}</td>
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
                    <c:forEach items="${manager.comments}" var="co">
                    	<c:if test="${co.deleteFlag == 0}">
		                    <tr>
		                        <td>${manager.cno}</td>	                        
		                        <form action='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>
									<input type="hidden" name="bno" value="${bvo.bno}">
									<input type="hidden" name="id" value="${sessionScope.user.id}">
									<td><button type="submit">${bvo.title}</button></td>
								</form>
		                        <td>${co.author}</td>
		                        <td>${manager.policeMan}</td>
		                        <td>${manager.policeReason}</td>
		                        <td>
			              			<form action='<c:url value="/comment/cpoliceWriteOff.do"/>' method="post">
							        	<input type="hidden" name="cno" value="${manager.cno}">
							        	<button type="submit" >비활성화</button>
							        </form>
						        </td>
		                    </tr>
                    	</c:if>
                    </c:forEach>
                </c:forEach>
                <c:forEach items="${policeUser}" var="manager">
            		<c:if test="${manager.userType < 2}">
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
            		</c:if>
                </c:forEach>
                
                <c:forEach items="${policeUserTotal}" var="manager">
            		<tr>
                      <td>${manager.id}</td>
                      <td>${manager.nick}</td>
                      <td>${manager.countTotal}</td>
                      <td>
						 <form action='<c:url value="/user/userOff.do"/>' method="post">
						 <input type="hidden" name="id" value="${manager.id}">
						 <c:if test="${manager.countTotal >= 5}">
						 	<button type="submit">비활성화</button>
						 </c:if>
						 </form>
                   	  </td>
                    </tr>
                </c:forEach>
               
                <c:forEach items="${offWrite}" var="manager">
                	<c:forEach items="${manager.bpolices}" var="bp">
                    <tr>
                        <td>${manager.bno}</td>
                        <form action='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>
							<input type="hidden" name="bno" value="${bvo.bno}">
							<input type="hidden" name="id" value="${sessionScope.user.id}">
							<td><button type="submit">${bvo.title}</button></td>
						</form>
                        <td>${manager.author}</td>
                        <td>${manager.createDate}</td>
						<c:choose>
							<c:when test="${(bp.policeResult == null) or (bp.policeResult == 0)}">
								<td>X</td>
							</c:when>
							<c:when test="${bp.policeResult == 1}">
								<td>O</td>
							</c:when>
						</c:choose>
                        <td>
							<c:if test="${(bp.policeResult == null) or (bp.policeResult == 0)}">
								<form action='<c:url value="/board/writeOn.do"/>' method="post">
						        	<input type="hidden" name="bno" value="${manager.bno}">
						        	<button type="submit">활성화</button>
					        	</form>
							</c:if>
				        </td>
                    </tr>
                    </c:forEach>
                </c:forEach>
                <c:forEach items="${offComment}" var="manager">
                	<c:forEach items="${manager.cpolices}" var="cp">
	                    <tr>
	                        <td>${manager.cno}</td>
	                        <form action='<c:url value="/board/post.do?bno=${bvo.bno}"></c:url>'>
								<input type="hidden" name="bno" value="${bvo.bno}">
								<input type="hidden" name="id" value="${sessionScope.user.id}">
								<td><button type="submit">${bvo.title}</button></td>
							</form>
	                        <td>${manager.author}</td>
	                        <td>${manager.createDate}</td>
	                        <c:choose>
								<c:when test="${(cp.policeResult == null) or (cp.policeResult == 0)}">
									<td>X</td>
								</c:when>
								<c:when test="${cp.policeResult == 1}">
									<td>O</td>
								</c:when>
							</c:choose>
	                        <td>
								<c:if test="${(cp.policeResult == null) or (cp.policeResult == 0)}">
									<form action='<c:url value="/comment/CommentOn.do"/>' method="post">
							        	<input type="hidden" name="cno" value="${manager.cno}">
							        	<button type="submit">활성화</button>
						        	</form>
								</c:if>
					        </td>
	                    </tr>
                    </c:forEach>
                </c:forEach>
                <c:forEach items="${offUser}" var="manager">
            		<tr>
	                    <td>${manager.id}</td>
	                    <td>${manager.nick}</td>
	                    <td>
	              			<form action='<c:url value="/user/userOn.do"/>' method="post">
					        	<input type="hidden" name="id" value="${manager.id}">
					        	<button type="submit" >활성화</button>
					        </form>
				        </td>
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
	</body>
</html>