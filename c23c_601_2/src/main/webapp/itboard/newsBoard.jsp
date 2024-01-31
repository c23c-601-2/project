<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT뉴스 게시판</title>
<link href="../cssNK/newsboard.css?ver=0.12" rel="stylesheet" />
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
			<th>조회수</th>
		</tr>
		<c:forEach items="${headlines }" var="h">
			<tr>
				<td>${index }</td>
				<td class="newssource" onclick="window.location.href='https://n.news.naver.com/mnews/article/138/0002166010'">${h}</td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>