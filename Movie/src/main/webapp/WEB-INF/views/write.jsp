<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="<c:url value='/resources/css/write.css'/>" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <link href="<c:url value='/resources/css/star.css'/>" rel="stylesheet">
    </head>
    <body>
        <div class="container">
		    <h1>게시글 작성</h1>
		    <form action="write.do" method="post" enctype="multipart/form-data">
				<select id="categoryNo" name="categoryNo" class="category" onchange="starview()">
			        <option value="0">영화 자유 게시판</option>
					<option value="1">영화 리뷰 게시판</option>
		        	<option value="2">영화 정보 게시판</option>
		            <option value="3">영화 굿즈 게시판</option>
		        </select>
		        <select name="notice" class="notice" style="margin: 1rem;">
		        	<c:if test="${sessionScope.user.userType == 0}">
		        	<option value="0">공지사항</option>
		        	</c:if>
		            <option value="1">일반 글</option>
		        </select>
		        <br><br>
		        <input type="hidden" id="author" name="author" value="${sessionScope.user.id}">
		        <div class="form-group">
		            <label for="title">제목</label>
		            <input type="text" id="title" name="title">
		        </div>
		        <div class="form-group">
		            <label for="body">본문</label>
		            <textarea id="body" name="body"></textarea>
		        </div>
		        <div id="star_rating">
			        <fieldset>
			            <input type="radio" name="star" value="5" id="star1"><label for="star1">⭐</label>
			            <input type="radio" name="star" value="4" id="star2"><label for="star2">⭐</label>
			            <input type="radio" name="star" value="3" id="star3"><label for="star3">⭐</label>
			            <input type="radio" name="star" value="2" id="star4"><label for="star4">⭐</label>
			            <input type="radio" name="star" value="1" id="star5"><label for="star5">⭐</label>
			        </fieldset>
			    </div>
		        <div class="form-group" id="fileDiv">
		            <label for="file">첨부파일</label>
		            <input type="file" accept="image/*" multiple id="file" name="file">
		        </div>
		        <div>
		            <img id="previewImg" onclick="popImage(this.src)">
		        </div>
		        <div class="footer">
		            <button type="submit" class="button">작성하기</button>
		            <a onclick="history.back()" class="button">취소</a>
		        </div>
		    </form>
		</div>
		<script>
            $('form').submit(function(e) {
                if ($('#categoryNo').val() == '1' && $('input[name="star"]:checked').length == 0) {
                    alert('별점을 선택해주세요.');
                    e.preventDefault();
                }
            });
	 
            function starview() {
                let categoryNo = $('#categoryNo').val();
                if (categoryNo == 1) {
                    if (!$('#star_rating').length) {
                        let star = '<div id="star_rating"><fieldset>';
                        star += '<input type="radio" name="star" value="5" id="star1"><label for="star1">⭐</label>';
                        star += '<input type="radio" name="star" value="4" id="star2"><label for="star2">⭐</label>';
                        star += '<input type="radio" name="star" value="3" id="star3"><label for="star3">⭐</label>';
                        star += '<input type="radio" name="star" value="2" id="star4"><label for="star4">⭐</label>';
                        star += '<input type="radio" name="star" value="1" id="star5"><label for="star5">⭐</label>';
                        star += '</fieldset></div>';
                        $("#fileDiv").before(star);
                    }
                } else {
                    $("#star_rating").remove();
                }
            }
            
            $(document).ready(function() {
                starview(); // 페이지 로드 시 실행
                $('#categoryNo').change(starview); 
            });
            
        </script>
    </body>
</html>