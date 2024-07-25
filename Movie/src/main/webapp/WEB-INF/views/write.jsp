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
                <!-- 숨겨진 필드로 categoryNo를 포함 -->
                <input type="hidden" id="hiddenCategoryNo" name="categoryNo" value="${param.categoryNo}">

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
		        <div id="star_rating" style="display: none;">
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
            function starview() {
                let categoryNo = $('#categoryNo').val();
                let userType = ${sessionScope.user.userType};
                if (categoryNo == '1' && userType != 0) {
                    $('#star_rating').show();
                } else {
                    $('#star_rating').hide();
                }
            }

            $(document).ready(function() {
                // 페이지 로드 시 숨겨진 필드에서 categoryNo 값을 읽어와 선택 박스에 설정
                let hiddenCategoryNo = $('#hiddenCategoryNo').val();
                $('#categoryNo').val(hiddenCategoryNo);
                starview(); // 페이지 로드 시 별점 입력 필드 표시 여부 업데이트

                $('#categoryNo').change(starview);
                
                // 파일 첨부 시 이미지 미리보기
                $('#file').on('change', function() {
                    let files = $(this)[0].files;
                    if (files.length > 0) {
                        let reader = new FileReader();
                        reader.onload = function(e) {
                            $('#previewImg').attr('src', e.target.result).show();
                        }
                        reader.readAsDataURL(files[0]);
                    } else {
                        $('#previewImg').hide();
                    }
                });
                
                // 폼 제출 시 별점 필수 체크
                $('form').submit(function(e) {
                    if ($('#categoryNo').val() == '1' && ${sessionScope.user.userType != 0} && $('input[name="star"]:checked').length == 0) {
                        alert('별점을 선택해주세요.');
                        e.preventDefault();
                    }
                });
            });

            function popImage(src) {
                let imgWindow = window.open("", "Image", "width=600,height=400");
                imgWindow.document.write('<img src="' + src + '" style="width:100%; height:auto;">');
            }
        </script>
    </body>
</html>