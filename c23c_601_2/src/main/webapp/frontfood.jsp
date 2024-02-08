<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/food.css" rel="stylesheet"/>
<script>
</script>
</head>
<body>
	<table class="write">
	<form 
		<div style="font-size: 30px; text-align: center;"> ★☆ 후기 리스트 ☆★ </div>
		<div style="text-align: right;">
			<button onclick="url('./board')">후기 게시판으로</button>
		</div>
		<thead>
			<tr style="font-size: 16px">
				<th class="d1">가게 이름</th>
				<th class="d2">좋아요 / 싫어요</th>
				<th class="d2">평점</th>
			</tr>
		</thead>
		<tbody class="asd">
			<c:forEach items="${list }" var="row" varStatus="status" end="6">
				<!-- tr은 리무브 시켜서 없애고, tbody는 appendtrtd를 foreach문으로 돌린다. -->
				<tr class="dfg">
					<td class="d1">${row.food_title }</td>
					<td class="d2">${row.food_like }/ ${row.food_dislike }</td>
					<td class="d2">${row.grade }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>