<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Orbit&display=swap');
    </style>
     <link href="<c:url value='/resources/css/post.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/star.css'/>" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet"> 
</head>
<body>
<body style="background-color: #e3d7ea;">
    <header>
        <nav>
            <div id="menu">
                <ul>
                    <li><a href="home.do">영화 사이트</a></li>
                    <li><a href="freelist.do">자유게시판</a></li>
                    <li><a href="reviewlist.do">리뷰게시판</a></li>
                    <li><a href="minfolist.do">영화 정보게시판</a></li>
                    <li><a href="goodslist.do">굿즈 게시판</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
    	<h1 class="underline">제목:${vo.title}</h1>
    	<dl class="post-details">
        <dt>작성자:${vo.author}</dt>
        	<dd></dd>
        <dt>조회수:${vo.hit}</dt>
        	<dd></dd>
        <dt>좋아요:</dt>
        	<dd></dd>
        <dt>첨부파일:</dt>
        	<dd></dd>   
    	</dl>
   		<div class="star_rating" name="star_rating" id="star_rating" style="text-align: left;">
        <dt>별점:</dt>
        <dd>
        <fieldset>
            <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
            <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
            <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
            <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
            <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
        </fieldset>
        </dd>
    </div>
    <div class="post-content">
        
    </div>
    <div class="button-group">
       	<a href="<c:url value="/board/modify.do?bno=${vo.bno}"></c:url>"  class="button">수정</a>
        <form action="delete.do" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
			<input type="submit" class="button" value="삭제">
		</form>
		<form action="police.do" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
			<input type="submit" class="button" value="신고">
		</form>
		<form action="like.do" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
			<input type="submit" class="button" value="좋아요">
		</form>
        <a href="#" class="button">목록으로 돌아가기</a>
    </div>
    <script>
        function confirmDelete(boardNo) {
            if (confirm("게시글을 정말 삭제하시겠습니까?")) {
                window.location.href = "/hiddenPost.jsp?id=" + boardNo;
            }
        }
    </script>

    <div class="comment-section">
        <h2>댓글</h2>
        <div class="comment-form">
            <textarea placeholder="댓글을 입력하세요" id="ta_reply"></textarea><br>
            <button type="button" id="btn_reply_submit" style="margin-right: 1rem;">댓글 작성</button>
        </div>
        <div class="comment-list">
            <div class="comment">
                <div style="text-align: left;">작성자 : </div>

                <div class="comment-actions">
                    <button class="btn_comment_diplay" type="button" onclick="confirmReply(this)">작성</button>
                    <button class="btn_comment_diplay" type="button" onclick="cancelReply(this)">취소</button>
                    <button type="button" onclick="modifyReply(this);">수정</button>
                    <button type="button" onclick="deleteReply(this);">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function modifyReply(obj) {
        $(obj).parent().children(".btn_comment_diplay").css("visibility", "visible");
        $(obj).css("visibility", "hidden");
        $(obj).parent().parent().children("input").attr("readonly", false);
    }

    function confirmReply(cno, obj) {
        let cbody = $(obj).parent().parent().children("input").val();

        $.ajax({
            url: "replyModifyOk.jsp",
            method: "post",
            data: {
                "cno": cno,
                "cbody": cbody
            },
            success: function (data) {
                let objData = JSON.parse(data.trim());
                if (objData.result == "success") {
                    $(obj).parent().children(".btn_comment_diplay").css("visibility", "hidden");
                    $(obj).next().next().css("visibility", "visible");
                    $(obj).parent().parent().children("input").attr("readonly", true);
                    $(obj).parent().parent().children("input").val(cbody);
                } else {
                    alert("댓글 수정 에러");
                }
            }
        });
    }

    function cancelReply(obj, cbody) {
        $(obj).parent().children(".btn_comment_diplay").css("visibility", "hidden");
        $(obj).next().css("visibility", "visible");
        $(obj).parent().parent().children("input").attr("readonly", true);
        $(obj).parent().parent().children("input").val(cbody);
    }

    function deleteReply(cno, obj) {
        $.ajax({
            url: "replyDeleteOk.jsp",
            method: "post",
            data: {
                "cno": cno
            },
            success: function (data) {
                let objData = JSON.parse(data.trim());
                if (objData.result == "success") {
                    $(obj).parent().parent().remove();
                } else {
                    alert("댓글 삭제 에러");
                }
            }
        });
    }

    $("#btn_reply_submit").on("click", function () {
        let replyElement = $("#ta_reply");

        if (replyElement.val().trim() == "") {
            alert("댓글을 입력하세요.");
            return;
        }

        $.ajax({
            url: "replyOk.jsp",
            method: "post",
            data: {
                "reply": replyElement.val(),
            },
            success: function (data) {
                let objData = JSON.parse(data.trim());
                if (objData.result == "success") {
                    let element = '';
                    element += '<div class="comment">';
                    element += '<div>작성자 : </div>';
                    element += '<div>AUTHOR_PLACEHOLDER</div>';
                    element += '<input type="text" readonly="readonly" value="' + replyElement.val() + '">';
                    element += '<div class="comment-actions">';
                    element += '<button class="btn_comment_diplay" type="button" onclick="confirmReply(' + objData.cno + ', this)">작성</button>';
                    element += '<button class="btn_comment_diplay" type="button" onclick="cancelReply(this)">취소</button>';
                    element += '<button type="button" onclick="modifyReply(this);">수정</button>';
                    element += '<button type="button" onclick="deleteReply(' + objData.cno + ', this);">삭제</button>';
                    element += '</div>';
                    element += '</div>';

                    $(".comment-list").append(element);
                    replyElement.val("");
                } else {
                    alert("댓글 작성 에러");
                }
            }
        });
    });
</script>
</body>
</html>