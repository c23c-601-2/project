<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 지도</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411"></script>
</head>
<body>
	<h1>식당 지도 입니다.</h1>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<!-- <div class="mainsearch">검색창</div> -->
			<div class="mainsearch">
						<form action="./login" method="post">
							<img alt="login" src="./img/search.png" width="24px;">
							<input type="text" name="id" placeholder="상호명을 입력하세요.">
							<button type="reset">지우기</button>
							<button type="submit">입력하기</button>
							
							<div id="errorMSG"></div>
						</form>
			</div>
		<div id="map" style="width: 1200px; height: 100vh;">
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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