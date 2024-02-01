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
	width: 600px;
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

</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Map</title>
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<link href="./css/add.css?ver=0.12" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
			<div class="mainsearch">
						<form action="./login" method="post">
							<img alt="login" src="./img/search.png" width="24px;">
							<input type="text" name="id" placeholder="상호명을 입력하세요.">
							<button type="reset">지우기</button>
							<button type="submit">입력하기</button>
							<div id="errorMSG"></div>
						<div class="ad1">광고1</div><hr>
						<div class = "youtubeleftbox">
						<div class="youtubelink">
							<img src="./assets/img/youtube.png" alt="유투브"> <a href="https://www.youtube.com/@poseidon5349/featured" target="_blank">선생님 유투브</a>
						</div>
						<div class ="youtubeplay">
							<iframe  width="100%" height="100%" src="https://www.youtube.com/watch?v=s6KlHFI9fBY" frameborder="0" allowfullscreen></iframe>
						</div>
					</div>
						<div class="ad2">광고2</div><hr>
						<h3>ㅁㅁ님을 위한 오늘의 추천 Pick !</h3>
						</form>
			</div>
			
		<div id="map" style="width: 1200px; height: 100vh;">
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.5571, 126.9460), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
			</script>
		</div>
	</div>
</body>
</html>