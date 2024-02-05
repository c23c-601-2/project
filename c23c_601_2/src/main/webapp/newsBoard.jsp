<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT뉴스 게시판</title>
<link href="./css/board.css?ver=0.12" rel="stylesheet"/>
<link href="./css/menu.css?ver=0.12" rel="stylesheet"/>
<style>
body {
	background-color: black;
	color: white;
}

.alltitle {
	width: 50%;
	margin: 0 auto;
	margin-top: 50px;
}
</style>

</head>
<body>
<div class="container">
		<%@ include file="./header.jsp"%>
		<%@ include file="nav.jsp" %>
		</div>
	<div class="maintitle">
		<h1>601하하</h1>
		</div>
	<table class="table" border="1">
	<caption class="caption">전체 뉴스</caption>
	<caption class="caption1">출처 : 네이버</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${headlines}" var="h" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td class = "newssource"onclick="window.location.href='${headlines2[status.index]}'">${h}</td>
    	<td >${headlines3[status.index]}</td>
    </tr>
</c:forEach>
	</table>
</body>
</html>