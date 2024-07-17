<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="<c:url value='/resources/css/write.css'/>" rel="stylesheet">
    </head>
    <body>
        <div class="container">
		    <h1>게시글 수정</h1>
		    <form action="modify.do" method="post" enctype="multipart/form-data">
		        <input type="hidden" name="bno" value="${vo.bno}">
		        <div class="form-group">
		            <label for="title">제목</label>
		            <input type="text" id="title" name="title" value="${vo.title}">
		        </div>
		        <div class="form-group">
		            <label for="body">본문</label>
		            <textarea id="body" name="body">${vo.body}</textarea>
		        </div>
		        <div class="form-group" id="fileDiv">
		            <label for="file">첨부파일</label>
		            <input type="file" accept="image/*" multiple id="file" name="file">
		        </div>
		        <div>
		            <img id="previewImg" onclick="popImage(this.src)">
		        </div>
		        <div class="footer">
		            <button type="submit" class="button">수정</button>
		            <a onclick="history.back()" class="button">취소</a>
		        </div>
		    </form>
		</div>
    </body>
</html>