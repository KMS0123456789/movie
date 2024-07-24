<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>PW 변경</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
    </style>
    <link href="<c:url value='/resources/css/header_footer.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/join.css' />" rel="stylesheet">
</head>
<body style="background-color: #e3d7ea;">
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
    <div class="container">
        <h1>비밀번호 변경</h1>
        <form action="changePw.do" method="POST">
            <input type="hidden" name="id" value="${vo.id}">
            <div class="form-group">
                <label for="pw">새 비밀번호 입력</label>
                <input type="password" name="pw" id="pw" placeholder="새 비밀번호 입력" required>
            </div><br>
            <div class="form-group">
                <label for="pw2">새 비밀번호 확인</label>
                <input type="password" name="pw2" id="pw2" placeholder="새 비밀번호 확인" required>
            </div><br>
            <button type="submit" class="submit-btn">비밀번호 변경</button>
        </form>
    </div>
</body>
<script>
        $(document).ready(function() {
            $('form').submit(function(e) {
                e.preventDefault();
                
                var pw = $('#pw').val();
                var pw2 = $('#pw2').val();
                
                if (pw !== pw2) {
                    alert('비밀번호가 일치하지 않습니다.');
                    return;
                }
                
                $.ajax({
                    url: 'changePw.do',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response === 'success') {
                            alert('비밀번호 변경에 성공했습니다.');
                            window.location.href = '<c:url value="/board/board.do"/>';
                        } else {
                            alert('비밀번호 변경에 실패했습니다.');
                        }
                    },
                    error: function() {
                        alert('비밀번호 변경에 실패했습니다.');
                    }
                });
            });
        });
</script>
</html>
