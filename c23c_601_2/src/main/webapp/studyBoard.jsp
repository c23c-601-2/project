<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- core = c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/board.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="header.jsp"%>
			<!-- 먼저 board.jsp파일에다 menu.jsp가져오고 자바 실행 가져오고 정리-->
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<table class="table">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.studyboard_no}</td>
								<td>${row.studyboard_title}</td>
								<td>${row.studyboard_write}</td>
								<td>${row.studyboard_date}</td>
								<td>${row.studyboard_count}</td>
							</tr>
						</c:forEach>
					</table>
					<button onclick="url('./studyWrite')">글쓰기</button>
				</article>
			</div>
		</div>
		<footer> </footer>
	</div>
</body>
</html>