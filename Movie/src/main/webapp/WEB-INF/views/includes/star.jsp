<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/resources/css/star.css'/>" rel="stylesheet">
<div name="star_rating" id="star_rating">
    <fieldset>
        <input type="radio" name="star" value="5" id="star1"><label for="star1">⭐</label>
        <input type="radio" name="star" value="4" id="star2"><label for="star2">⭐</label>
        <input type="radio" name="star" value="3" id="star3"><label for="star3">⭐</label>
        <input type="radio" name="star" value="2" id="star4"><label for="star4">⭐</label>
        <input type="radio" name="star" value="1" id="star5"><label for="star5">⭐</label>
    </fieldset>
</div>