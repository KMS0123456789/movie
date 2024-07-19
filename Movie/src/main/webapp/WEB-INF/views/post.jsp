<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 

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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <header>
        <nav>
            <div id="menu">
                <ul>
                    <li><a href="board.do">영화 사이트</a></li>
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
    <div>
    	<c:if test="${(sessionScope.user.id) eq (vo.author)}">
	    	<div class="button-group">
	       		<a href="<c:url value="/board/modify.do?bno=${vo.bno}"></c:url>"  class="button">수정</a>
	       	</div>
       	</c:if>
 		<c:if test="${((sessionScope.user.id) eq (vo.author)) or (sessionScope.user.userType == 0)}">
	       	<div  class="button-group">
		        <form action="off.do" method="post">
					<input type="hidden" name="bno" value="${vo.bno}">
					<input type="hidden" name="categoryNo" value="${vo.categoryNo}">
					<input type="submit" class="button" value="삭제">
				</form>
			</div>
		</c:if>
		<div  class="button-group">
			<form action="return.do" method="get">
				<input type="hidden" name="categoryNo" value="${vo.categoryNo}">
				<input type="submit" class="button" value="목록으로 돌아가기">
	        </form>
	     </div>
	     
    </div>
	<div id="p_l_btn">
        <div>
            <form action="police.do" method="post">
                <div id="p_l_btn1">
                    <p> <img src="../resources/image/siren.jpg"> </p>
                    <input type="hidden" name="bno" value="${vo.bno}">
                    <input type="submit" class="buttons" value="신고">
                </div>
            </form>
        </div>
        <div id="p_l_btn2">
		<form action="like.do" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
			<input type="submit" class="buttons" value="♡ 좋아요">
		</form>
        </div>
    </div>
    <div class="comment-section">
        <h2>댓글</h2>
        <form action='<c:url value="/comment/cWrite.do" />' method="post">
	        <div class="comment-form">
	        	<input type="hidden" name="bno" value="${vo.bno}">
	        	<input type="hidden" name="author" value="${sessionScope.user.id}">
	            <textarea placeholder="댓글을 입력하세요" id="cbody" name="cbody"></textarea><br>
	            <button type="submit" id="btn_reply_submit" style="margin-right: 1rem;">댓글 작성</button>
	        </div>
        </form>
		
		<div class="comment-list">
		    <div class="comment">
		        <c:forEach items="${vo.comments}" var="item">
		            <div style="text-align: left;">작성자 :${item.author}</div>
		            <div style="text-align: left;">${item.cbody}</div>
		            <div class="comment-actions">
		            <input type="text" readonly="readonly"  ${item.cbody}>
		                <button class="btn_comment_diplay" type="button" onclick="confirmReply(${item.cno}, this)" style="visibility: hidden;">작성</button>
		                <button class="btn_comment_diplay" type="button" onclick="cancelReply(this)" style="visibility: hidden;" data-original-text="${item.cbody}">취소</button>
		                <button type="button" class="modifyReply" onclick="modifyReply(this)">수정</button>
		                <button type="button" class="deleteReply" onclick="deleteReply(${item.cno}, this)">삭제</button>
		            </div>
		        </c:forEach>
		    </div>
		</div>
        
    </div>
</div>

<script>
    function modifyReply(obj) {
        // "작성" 및 "취소" 버튼을 보이게 함
        $(obj).siblings(".btn_comment_diplay").css("visibility", "visible");
        // "수정" 및 "삭제" 버튼을 숨김
        $(obj).css("visibility", "hidden");
        $(obj).siblings(".deleteReply").css("visibility", "hidden");
        // 댓글 입력 필드를 활성화
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
                    // "작성" 및 "취소" 버튼 숨김
                    $(obj).parent().children(".btn_comment_diplay").css("visibility", "hidden");
                    // "수정" 및 "삭제" 버튼 보임
                    $(obj).siblings(".modifyReply").css("visibility", "visible");
                    $(obj).siblings(".deleteReply").css("visibility", "visible");
                    // 댓글 입력 필드를 비활성화
                    $(obj).parent().parent().children("input").attr("readonly", true);
                    $(obj).parent().parent().children("input").val(cbody);
                } else {
                    alert("댓글 수정 에러");
                }
            }
        });
    }

    function cancelReply(obj) {
        // "작성" 및 "취소" 버튼 숨김
        $(obj).parent().children(".btn_comment_diplay").css("visibility", "hidden");
        // "수정" 및 "삭제" 버튼 보임
        $(obj).siblings(".modifyReply").css("visibility", "visible");
        $(obj).siblings(".deleteReply").css("visibility", "visible");
        // 댓글 입력 필드를 비활성화하고 기존 값 복원
        $(obj).parent().parent().children("input").attr("readonly", true);
        // 기존 댓글 내용 복원
        let originalText = $(obj).data("originalText");
        $(obj).parent().parent().children("input").val(originalText);
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
                    element += '<button class="btn_comment_diplay" type="button" onclick="confirmReply(' + objData.cno + ', this)" style="visibility: hidden;">작성</button>';
                    element += '<button class="btn_comment_diplay" type="button" onclick="cancelReply(this)" style="visibility: hidden;" data-original-text="' + replyElement.val() + '">취소</button>';
                    element += '<button type="button" onclick="modifyReply(this);" class="modifyReply">수정</button>';
                    element += '<button type="button" onclick="deleteReply(' + objData.cno + ', this);" class="deleteReply">삭제</button>';
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