<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/logincase.css'/>" rel="stylesheet">
<style type="text/css">
	#change{
            text-decoration: none;
            color: black;
        }
        #user{
            text-align: center;
            font-family: "Gowun Dodum", sans-serif;
            font-style: normal;
        }
        #user h2{
            color: black;
            border-bottom: 5px solid #a2a4dd;
            padding-bottom: 20px;
        }
        #user div{
            margin-bottom: 2rem;
        }
        #user a{
            cursor: pointer;
            font-size: 20px;
        }
        #user a:hover{
            background-color: #ffb6c1;
        }
</style>
</head>
<body>
	<div id="logincase" >
        <div id="user">
            <h2 id="name">${sessionScope.user.nick}님</h2>
            <div><a href="#" id="change">관리자페이지</a></div>
            <div><a href="<c:url value='/board/mypage.do'/>" id="change">마이페이지</a></div>
            <div><a href="<c:url value='/user/logout.do'/>" id="change">로그아웃</a></div>
        </div>
    </div>
</body>
</html>