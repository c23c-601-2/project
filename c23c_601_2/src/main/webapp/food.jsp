<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<style>
.container {
	margin: 0 auto;
	width: 1500px;
	background-color: #F5ECE4;
}

.verticalmain {
	display: flex;
	flex-direction: row;
	width: 1300px;
	/* justify-content: space-between; */
	/* border-collapse: collapse; */
}
.chatJinsu{
	width: 20%;
	border-collapse: collapse;
	/* border: 5px solid red; */
}

.mainsearch {
	left: 170px;
	width: 80%;
	border: 5px solid back;	
	/* border-collapse: collapse; */
	display: flex;
	flex-direction: row;
}

#map {
	width: 50%;
}

.mainright {
	border: 1px solid black;
	width: 25%
}

.d1{
	width: 10%;
}

.d2{
	width: 20%;
}

.d3{
	width: 30%;
}

</style>

<head>
<meta charset="UTF-8">
<title>식당 지도</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07c74fda752bcdd18b45e54e39e95411=services,clusterer,drawing"></script>
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<link href="./css/add.css?ver=0.12" rel="stylesheet" />
<link href="./css/frontpage.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
</head>

<script type="text/javascript">
$(function() {
	$('#searchTitle').click(function() {
		let search = $('#search').val();
		location.href = "./food?search=" + search;
		window.location.href = "https://map.kakao.com/link/search/카카오";

	});
	
	$('.recommendBtn').click(function() {
		let no = $(this).val();
		alert("123");
		$.ajax({
			url : './recommendFood',
			type     : 'post',
			dataType : 'text',
			data     : {'no' : no },
			success  : function(result){
				if(result == 1){
					
				}else{
					alert("11문제가 발생햇습니다.");
				}
			},
			error    : function(error){
				alert("에러 : " + error);
			}
		});
	});
	
});
</script>

<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>

		<div class="verticalmain">
			<div class="chatJinsu">
				<%@ include file="chat.jsp"%>
			</div>
			<div class="mainsearch">
				<div><form action="./food" method="post">
						<img alt="login" src="./img/search.png" width="24px;"> <input
							type="text" name="search" placeholder="음식점 상호를 입력하세요.">
						<button type="submit" id="searchTitle">검색하기</button>
					</form>
					<div id="errorMSG"></div>
					<hr>
					<div class="ad1">광고1</div>
					<hr>
					<div class="ad2">광고2</div>
					<hr>
					<h3>${sessionScope.mname }님을위한 오늘의 추천</h3>
					<button id="recommendBtn" var="row">추천메뉴 클릭</button>
					<hr>
					<div>
						<table class="write">
							<h2>후기 리스트</h2>
							<div>
								<button onclick="url('./board')">후기 게시판으로</button>
							</div>
							<thead>
								<tr style="font-size: 16px">
									<th>가게 이름</th>
									<th>후기 내용</th>
									<th>좋아요 / 싫어요</th>
									<th>별점</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="row">
									<tr>
										<td class="d3">${row.title }</td>
										<td class="d3">${row.content }</td>
										<td class="d2">${row.like }/${row.dislike }</td>
										<td class="d2">${row.grade }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="map" style="width: 800px; height: 100vh;">
				<script>
     // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.5571, 126.9460), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  
	
        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places(); 

        // 키워드로 장소를 검색합니다
        ps.keywordSearch('이대역 맛집', placesSearchCB); 

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB (data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i=0; i<data.length; i++) {
                    displayMarker(data[i]);    
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }       

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            } 
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {
            
            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x) 
            });

            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
            });
        }
        
         </script>
			</div>
			</div>
			
		</div>
	</div>
</body>
</html>