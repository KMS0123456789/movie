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
    <link href="<c:url value='/resources/css/header_footer.css'/>" rel="stylesheet"> 
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
    <div class="container">
    	<h1 class="underline">제목:${vo.title}</h1>
    	<dl class="post-details">
        <dt>작성자:${vo.author}</dt>
        	<dd></dd>
        <dt>조회수:${vo.hit}</dt>
        	<dd></dd>
        <dt>좋아요:</dt>
        	<dd>
        		<c:forEach items="${vo.likes}" var="like" varStatus="likes">
					<c:if test="${likes.last}">
						${likes.count}
					</c:if>
        		</c:forEach>
        	</dd>
        <dt>첨부파일:</dt>
        	<dd>
	        	<c:forEach items="${vo.files}" var="file">
	    			${file.fileName}
	    		</c:forEach>
        	</dd>   
    	</dl>
    	
    	<c:if test="${vo.categoryNo == 1 && vo.notice != 0}">
		    <div class="star_rating" name="star_rating" id="star_rating">
		        <dt>별점:</dt>
		        <dd>
		            <c:forEach items="${vo.stars}" var="star">
		                <c:choose>
		                    <c:when test="${not empty star.star}">
		                        <c:forEach begin="1" end="5" var="i">
		                            <c:choose>
		                                <c:when test="${i <= vo.stars[0].star}">
		                                    <span class="star_filled" style="font-size: 30px; color: red;">★</span>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="star" style="font-size: 28px; color: red;">☆</span>
		                                </c:otherwise>
		                            </c:choose>
		                        </c:forEach>
		                    </c:when>
		                </c:choose>
		            </c:forEach>
		        </dd>
		    </div>
		</c:if>
    	
    <div class="post-content">
    	<c:forEach items="${vo.files}" var="file">
    		<img alt="이미지" src="<c:url value="${file.filePath}"/>" onerror="this.style.display='none'" id="image">
    	</c:forEach>
    	${vo.body}
    </div>
    <div>
    	<c:if test="${(sessionScope.user.id) eq (vo.author)}">
	    	<div class="button-group">
	       		<a href="<c:url value="/board/modify.do?bno=${vo.bno}"></c:url>"  class="button">수정</a>
	       	</div>
       	</c:if>
 		<c:if test="${((sessionScope.user.id) eq (vo.author)) or (sessionScope.user.userType == 0)}">
	       	<div  class="button-group">
		        <form action="<c:url value='/board/off.do'/>" method="post">
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
			<c:if test="${!empty sessionScope.user.id}">
		        <div>
				    <div id="p_l_btn1">
				        <p> <img src="../resources/image/siren.jpg"> </p>
				        <button type="button" class="buttons" onclick="openModal()">신고</button>
				    </div>
				</div>
			</c:if>
        <c:if test="${sessionScope.user.id != null}">
	        <div id="p_l_btn2">
	        <c:forEach items="${vo.likes}" var="like" varStatus="likes" begin="0" end="0">
	        	<c:choose>
	        		<c:when test="${(sessionScope.user.id) ne like.likeUser}">
						<form action="<c:url value='/like/like.do'/>"  method="post">
							<input type="hidden" name="bno" value="${vo.bno}">
							<input type="hidden" name="likeUser" value="${sessionScope.user.id}">
							<input type="submit" class="buttons" value="🤍 좋아요">
						</form>
					</c:when>
					<c:when test="${(sessionScope.user.id) eq like.likeUser}">
						<form action="<c:url value='/like/likeOff.do'/>"  method="post">
							<input type="hidden" name="bno" value="${vo.bno}">
							<input type="hidden" name="likeUser" value="${sessionScope.user.id}">
							<input type="submit" class="buttons" value="❤️ 좋아요">
						</form>
					</c:when>
	        	</c:choose>
	        </c:forEach>
	        </div>
	    </c:if>
    </div>
    <div class="comment-section">
        <h2>댓글</h2>
        <form action='<c:url value="/comment/cWrite.do" />' method="post">
	        <div class="comment-form">
	        	<input type="hidden" name="bno" value="${vo.bno}">
	        	<input type="hidden" name="author" value="${sessionScope.user.id}">
	            <textarea placeholder="댓글을 입력하세요" id="cbody" name="cbody"></textarea><br>
	            <c:if test="${!empty sessionScope.user.id}">
	            	<button type="submit" id="btn_reply_submit" style="margin-right: 1rem;">댓글 작성</button>
	       		</c:if>
	        </div>
        </form>        
      <c:forEach items="${vo.comments}" var="item">
	      	<c:if test="${!empty sessionScope.user.id}">
		     	<div>
				   <div id="p_l_btn1">
				       <button type="button" class="buttons" onclick="openCModal()">신고</button>
				   </div>
				</div>
			</c:if>        
        	<div class="comment-list">
		    	<div class="comment">
			           <div style="text-align: left;">작성자 :${item.author}</div>
			           	<div class="comment-actions">
			            	<form action='<c:url value="/comment/cModify.do"/>' method="post">
			            		<input type="text"  readonly="readonly" style="text-align: left " name="cbody"value="${item.cbody}" >
			            		<input type="hidden" name="cno" value="${item.cno}">
			               		<button class="btn_comment_diplay" type="submit"  style="visibility: hidden;">작성</button>
			               		<button class="btn_comment_diplay" type="button" onclick="cancelReply(this)" style="visibility: hidden;" value="${item.cbody}">취소</button>	
			               	</form>
			               	<c:if test="${sessionScope.user.id == item.author}">		                
			                <button type="button" class="modifyReply" onclick="modifyReply(this)">수정</button>
			                <form  action='<c:url value="/comment/cOff.do"/>' method="post">
			            		<input type="hidden" name="cno" value="${item.cno}">
			                	<button type="submit" class="deleteReply" >삭제</button>
			                </form>
			                </c:if>
			             </div>	                   
				</div>    
    		</div>

        
			<div id="CpoliceModal" class="modal" style="display: none;">
			    <div class="modal-content">
			        	<h2>신고 사유 선택</h2>
			        <form id="policeForm" action='<c:url value="/cpolice/police.do"/>' method="post">
			            <input type="hidden" name="cno" value="${item.cno}">
			            <input type="hidden" name="policeMan" value="${sessionScope.user.id}">
						<input type="hidden" name="villain" value="${vo.author}">
			            <input type="radio" id="spam" name="policeReason" value="스팸">
			            <label for="spam">스팸</label><br>
			            <input type="radio" id="abusive" name="policeReason" value="욕설">
			            <label for="abusive">욕설</label><br>
			            <input type="radio" id="personal" name="policeReason" value="개인정보 노출">
			            <label for="personal">개인정보 노출</label><br>
			            <button type="submit">신고하기</button>
			            <button type="button" onclick="closeCModal()">취소</button>
			        </form>
			    </div>
			</div>
</c:forEach>		
</div>
<!-- 신고 모달 -->
<div id="policeModal" class="modal" style="display: none;">
    <div class="modal-content">
        <h2>신고 사유 선택</h2>
        <form id="policeForm" action='<c:url value="/bpolice/police.do"/>' method="post">
            <input type="hidden" name="bno" value="${vo.bno}">
            <input type="hidden" name="policeMan" value="${sessionScope.user.id}">
			<input type="hidden" name="villain" value="${vo.author}">
            <input type="radio" id="spam" name="policeReason" value="스팸">
            <label for="spam">스팸</label><br>
            <input type="radio" id="abusive" name="policeReason" value="욕설">
            <label for="abusive">욕설</label><br>
            <input type="radio" id="personal" name="policeReason" value="개인정보 노출">
            <label for="personal">개인정보 노출</label><br>
            <button type="submit">신고하기</button>
            <button type="button" onclick="closeModal()">취소</button>
        </form>
    </div>
</div>
<script>
function modifyReply(obj) {
    // "작성" 및 "취소" 버튼을 보이게 함
    $(obj).parent().children().children(".btn_comment_diplay").css("visibility", "visible");
    $(obj).parent().children().children("#cbody").css("visibility", "visible");
    $(obj).parent().children().children("input").attr("readonly",false);
    // "수정" 및 "삭제" 버튼을 숨김
    $(obj).css("visibility", "hidden");
    $(obj).siblings(".deleteReply").css("visibility", "hidden");
}
    function cancelReply(obj) {
        // "작성" 및 "취소" 버튼 숨김
        $(obj).parent().children(".btn_comment_diplay").css("visibility", "hidden");
        // "수정" 및 "삭제" 버튼 보임
        $(".modifyReply").css("visibility", "visible");
        $(".deleteReply").css("visibility", "visible");
    }
    
    function openModal() {
        document.getElementById('policeModal').style.display = 'block';
    }
    function openCModal() {
        document.getElementById('CpoliceModal').style.display = 'block';
    }
    function closeCModal() {
        document.getElementById('CpoliceModal').style.display = 'none';
    }
    function closeModal() {
        document.getElementById('policeModal').style.display = 'none';
    }

    window.onclick = function(event) {
        var modal = document.getElementById('policeModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>