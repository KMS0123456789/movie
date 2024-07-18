<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/resources/css/logincase.css'/>" rel="stylesheet">
	<div id="logincase" >
       <div id="login">
           <h2>로그인</h2>
           <form action="<c:url value='/user/login.do'/>" method="post">
               <div class="information">
                   <div id="label"><label for="id">아이디</label></div>
                   <input type="text" name="id" placeholder="id를 입력하세요." id="id"><br>
               </div>
               <div class="information">
                   <div id="label"><label for="pw">비밀번호</label></div>
                   <input type="password" name="pw" placeholder="비밀번호를 입력하세요." id="pw">
               </div>
               <div id="btn">
                   <button type="submit" id="sub">로그인</button>
               </div>
           </form>
           <div id="user">
	           <div class="join">
	          		<a href="<c:url value="/user/join.do"/>" id="join">회원가입</a>
	           </div>
	           <div id="find">
	          		<a href="<c:url value="/user/findId.do"/>" id="findid">아이디 찾기</a>
	          		<a href="<c:url value="/user/findPw.do"/>"id="findpw">비밀번호 찾기</a>
	           </div>
           </div>
       </div>
	</div>