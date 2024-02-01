<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<style>
.container {
	/* border: 1px solid black; */
	display: flex;
	flex-direction: row;
	width: 100%;
}

.verticalmain {
	border: 1px solid black;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.mainsearch {
	border: 1px solid black;
	margin-left: 200px;
	width: 400px;
	display: flex;
	flex-direction: row;
}

#map {
	width: 100%;
}

.mainmap {
	width: 50%;
}

.mainright {
	border: 1px solid black;
	width: 25%
}

.boxrow {
	margin: 10px;
	height: 300px;
	border: 1px solid red;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	background-color: ffffea;
}

.boxleft {
	width: 49%;
	border: 1px solid blue;
	/* margin-right: 2px; */
	background-color: #F8F8C1;
}

.boxright {
	width: 49%;
	border: 1px solid blue;
	/* margin-left: 2px; */
	background-color: #F8F8C1;
}

.write {
	width: 280px;
}

.writeBtn {
	margin-right: 0;
	margin-left: auto;
}
</style>

<head>
<meta charset="UTF-8">
<title>식당 지도</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411"></script>
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<link href="./css/add.css?ver=0.12" rel="stylesheet" />
</head>
<body>
	<h1>식당 지도 입니다.</h1>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="mainsearch">
			<div>
				<form action="./board" method="post">
					<img alt="login" src="./img/search.png" width="24px;"> <input
						type="text" name="id" placeholder="음식점 상호를 입력하세요.">
					<button type="submit">검색하기</button>
					<!-- <button type="submit">등록하기</button> -->
					<div id="errorMSG"></div>
					<hr>
					<div class="ad1">광고1</div>
					<hr>
					<div class="ad2">광고2</div>
					<hr>
					<h3>ㅁㅁ님을 위한 오늘의 추천 Pick !</h3>
					<hr>
					
					<div>
						<table class="write">
							<h2>음식점 리스트</h2>
							<div>
								<button type="write1()">후기 등록하기</button>
								<script type="text/javascript">
									function write1() {
										if (confirm("영수증 지참하신거 맞으시죠?")) {
											alert("아앗.")
											location.href = "./board.jsp";
										} else {
											alert("휴, 다행입니다. 원복합니다.")
										}
									}
								</script>
							</div>
							<thead>
								<tr>
									<th>가게 이름</th>
									<th>후기 내용</th>
									<th>좋아요 / 싫어요</th>
									<th>별점</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="row">
									<tr>
										<td class="d2">${row.food_title }</td>
										<td class="d3">${row.food_content }</td>
										<td class="d1">${row.food_like }/ ${row.food_dislike }</td>
										<td class="d1">${row.food_degree }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>

				</form>
			</div>
		</div>
		<div id="map" style="width: 1200px; height: 100vh;">
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.5571, 126.9460), // 지도의 중심좌표
					level : 2
				// 지도의 확대 레벨
				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
			</script>
		</div>
	</div>
</body>
</html>