<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<style>
.d1 {
	width: 10%;
}

.d2 {
	width: 20%;
}

.d3 {
	width: 30%;
}
</style>


<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link href="./css/add.css?ver=0.12" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style>
tbody>tr>td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<div class="main">
			<div class="mainStyle">
				<article>
					<table>
						<thead>
							<tr>
								<th class="d1">번호</th>
								<th class="d3">가게 이름</th>
								<th class="d3">후기 내용</th>
								<th class="d1">좋아요</th>
								<th class="d1">싫어요</th>
								<th class="d1">별점</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="row">
								<tr>
									<td class="d1">${row.no }</td>
									<td class="d3">${row.food_title }</td>
									<td class="d3">${row.food_content }</td>
									<td class="d1">${row.food_like }</td>
									<td class="d1">${row.food_dislike }</td>
									<td class="d1">${row.food_degree }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button onclick="url('./write')">후기 쓰기</button>
					님 반갑습니다.
				</article>
			</div>
		</div>
	</div>
</body>
</html>