<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        </style>
            <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet">
            <link href="<c:url value='/resources/css/list.css'/>" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav>
                <div id="menu">
                    <ul>
                        <li><a href="home.do">영화 사이트</a></li>
                        <li><a href="freelist.do">영화 자유 게시판</a></li>
                        <li><a href="reviewlist.do">영화 리뷰 게시판</a></li>
                        <li><a href="minfolist.do">영화 정보 게시판</a></li>
                        <li><a href="goodslist.do">영화 굿즈 게시판</a></li>
                    </ul>
                </div>
            </nav>
        </header>
            <h2 class="list_h2">영화 굿즈 게시판</h2>
            <h3 class="list_h3">게시글 목록</h3>
            <table>
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
                    <tr>
                        <td>공지사항</td>
                        <td>공지1</td>
                        <td>관리자</td>
                        <td>20240710</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>공지사항</td>
                        <td>공지2</td>
                        <td>관리자</td>
                        <td>20240710</td>
                        <td>0</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${gPage}" var="bvo">
						<tr>
							<td>${bvo.bno}</td>
							<td><a href='<c:url value="/user/post.do?sno=${bvo.bno}"></c:url>'>${bvo.title}</a></td>
							<td>${bvo.author}</td>
							<td>${bvo.createDate}</td>
							<td>${bvo.hit}</td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <%
            	if(true){
            		%><%@ include file="./includes/logincase.jsp" %><%
            	}
            %>
             <%
            	if(false){
            		%><%@ include file="./includes/logincase.jsp" %><%
            	}
            %>
             <%
            	if(false){
            		%><%@ include file="./includes/logincase.jsp" %><%
            	}
            %>
          
            <div>
                <ul class="pagination">
                    <li><a>&lt;&lt;</a></li>
                    <li><a>&lt;</a></li>
                    <li><a>&gt;</a></li>
                    <li><a>&gt;&gt;</a></li>
                </ul>
            </div>
            <br>
            <button type="button" id="write"><a href="write.do">글 쓰기</a></button>
            <br>
            <form action="#" method="get">
                <div class="searchDiv">
                    <select name="searchType">
                        <option value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="body">내용</option>
                    </select>
                    <input type="text" name="search">
                    <input type="submit" value="검색">
                </div>
            </form>
    </body>
</html>

