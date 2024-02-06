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

.chatJinsu {
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(function() {
		$('#recommendBtn').click(function() {
			let no = 10;
			alert(no);
			$.ajax({
				url : './recommendFood',
				type : 'post',
				dataType : 'text',
				data : {
					'no' : no
				},
				success : function(result) {
					if (result == 1) {

					} else {
						alert("11문제가 발생햇습니다.");
					}
				},
				error : function(error) {
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
				<div>
					<form action="./food" method="post">
						<img alt="login" src="./img/search.png" width="24px;"> <input
							type="text" name="search" placeholder="음식점 상호를 입력하세요.">
						<button type="submit" id="searchTitle">후기 리스트 검색하기</button>
					</form>
					<div id="errorMSG"></div>
					<hr>
					<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					<hr>

					<div class="ad2">광고2</div>
					<hr>

					<h3>${sessionScope.mname }님을위한오늘의추천</h3>
					<button type="submit" id="recommendBtn" name="recommendBtn">추천메뉴
						클릭</button>
					<tr type="hidden">
						<td class="d3">${row.title }</td>
						<td class="d3">${row.content }</td>
						<td class="d2">${row.like }/${row.dislike }</td>
						<td class="d2">${row.grade }</td>
					</tr>
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


				<div class="map">
					<div id="map" style="width: 800px; height: 100vh;">
					<script>
						// 마커를 담을 배열입니다
						var markers = [];

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places();

						// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});

						// 키워드로 장소를 검색합니다
						searchPlaces();

						// [검색하기 버튼] 키워드 검색을 요청하는 함수입니다
						function searchPlaces() {

							var keyword = document.getElementById('keyword').value;

							if (!keyword.replace(/^\s+|\s+$/g, '')) {
								alert('키워드를 입력해주세요!');
								return false;
							}

							// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
							ps.keywordSearch(keyword, placesSearchCB);
						}

						// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
							if (status === kakao.maps.services.Status.OK) {

								// 정상적으로 검색이 완료됐으면
								// 검색 목록과 마커를 표출합니다
								displayPlaces(data);

								// 페이지 번호를 표출합니다
								displayPagination(pagination);

							} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

								alert('검색 결과가 존재하지 않습니다.');
								return;

							} else if (status === kakao.maps.services.Status.ERROR) {

								alert('검색 결과 중 오류가 발생했습니다.');
								return;

							}
						}

						// 검색 결과 목록과 마커를 표출하는 함수입니다
						function displayPlaces(places) {

							var listEl = document.getElementById('placesList'), menuEl = document
									.getElementById('menu_wrap'), fragment = document
									.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

							// 검색 결과 목록에 추가된 항목들을 제거합니다
							removeAllChildNods(listEl);

							// 지도에 표시되고 있는 마커를 제거합니다
							removeMarker();

							for (var i = 0; i < places.length; i++) {

								// 마커를 생성하고 지도에 표시합니다
								var placePosition = new kakao.maps.LatLng(
										places[i].y, places[i].x), marker = addMarker(
										placePosition, i), itemEl = getListItem(
										i, places[i]); // 검색 결과 항목 Element를 생성합니다

								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								// LatLngBounds 객체에 좌표를 추가합니다
								bounds.extend(placePosition);

								// 마커와 검색결과 항목에 mouseover 했을때
								// 해당 장소에 인포윈도우에 장소명을 표시합니다
								// mouseout 했을 때는 인포윈도우를 닫습니다
								(function(marker, title) {
									kakao.maps.event
											.addListener(marker, 'mouseover',
													function() {
														displayInfowindow(
																marker, title);
													});

									kakao.maps.event.addListener(marker,
											'mouseout', function() {
												infowindow.close();
											});

									itemEl.onmouseover = function() {
										displayInfowindow(marker, title);
									};

									itemEl.onmouseout = function() {
										infowindow.close();
									};
								})(marker, places[i].place_name);

								fragment.appendChild(itemEl);
							}

							// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
							listEl.appendChild(fragment);
							menuEl.scrollTop = 0;

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							map.setBounds(bounds);
						}

						// 검색결과 항목을 Element로 반환하는 함수입니다
						function getListItem(index, places) {

							var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
									+ (index + 1)
									+ '"></span>'
									+ '<div class="info">'
									+ '   <h5>'
									+ places.place_name + '</h5>';

							if (places.road_address_name) {
								itemStr += '    <span>'
										+ places.road_address_name + '</span>'
										+ '   <span class="jibun gray">'
										+ places.address_name + '</span>';
							} else {
								itemStr += '    <span>' + places.address_name
										+ '</span>';
							}

							itemStr += '  <span class="tel">' + places.phone
									+ '</span>' + '</div>';

							el.innerHTML = itemStr;
							el.className = 'item';

							return el;
						}

						// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
						function addMarker(position, idx, title) {
							var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
							imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
							imgOptions = {
								spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
								spriteOrigin : new kakao.maps.Point(0,
										(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
								offset : new kakao.maps.Point(13, 37)
							// 마커 좌표에 일치시킬 이미지 내에서의 좌표
							}, markerImage = new kakao.maps.MarkerImage(
									imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
									{
										position : position, // 마커의 위치
										image : markerImage
									});

							marker.setMap(map); // 지도 위에 마커를 표출합니다
							markers.push(marker); // 배열에 생성된 마커를 추가합니다

							return marker;
						}

						// 지도 위에 표시되고 있는 마커를 모두 제거합니다
						function removeMarker() {
							for (var i = 0; i < markers.length; i++) {
								markers[i].setMap(null);
							}
							markers = [];
						}

						// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
						function displayPagination(pagination) {
							var paginationEl = document
									.getElementById('pagination'), fragment = document
									.createDocumentFragment(), i;

							// 기존에 추가된 페이지번호를 삭제합니다
							while (paginationEl.hasChildNodes()) {
								paginationEl
										.removeChild(paginationEl.lastChild);
							}

							for (i = 1; i <= pagination.last; i++) {
								var el = document.createElement('a');
								el.href = "#";
								el.innerHTML = i;

								if (i === pagination.current) {
									el.className = 'on';
								} else {
									el.onclick = (function(i) {
										return function() {
											pagination.gotoPage(i);
										}
									})(i);
								}

								fragment.appendChild(el);
							}
							paginationEl.appendChild(fragment);
						}

						// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
						// 인포윈도우에 장소명을 표시합니다
						function displayInfowindow(marker, title) {
							var content = '<div style="padding:5px;z-index:1;">'
									+ title + '</div>';

							infowindow.setContent(content);
							infowindow.open(map, marker);
						}

						// 검색결과 목록의 자식 Element를 제거하는 함수입니다
						function removeAllChildNods(el) {
							while (el.hasChildNodes()) {
								el.removeChild(el.lastChild);
							}
						}

						/* // 지도 구현하기
						import { useEffect, useState } from "react";
						import * as S from "./WriteMap.styled";

						declare const window: typeof globalThis & {
						kakao: any;
						};

						export default function WriteMapPage(props: any) {
						useEffect(() => {
						const script = document.createElement("script");
						script.src =
						  "//dapi.kakao.com/v2/maps/sdk.js?appkey=f487080ea91748abbd2e3df735d5af4c&libraries=services&autoload=false";
						document.head.appendChild(script);

						script.onload = () => {
						  window.kakao.maps.load(function () {
						    var markers: any[] = [];

						    const container = document.getElementById("map");
						    const options = {
						      center: new window.kakao.maps.LatLng(37.5571, 126.9460),
						      level: 3,
						    };
									
						 // 지도를 생성합니다    
						    var map = new kakao.maps.Map(mapContainer, mapOption); 
						 
						 // 장소 검색 객체를 생성합니다
						    var ps = new kakao.maps.services.Places();  

						 // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
						    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

						 // 키워드로 장소를 검색합니다
						    searchPlaces();

						 // 키워드 검색을 요청하는 함수입니다
						    function searchPlaces() { */

						/* // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
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
						   } */
					</script>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>