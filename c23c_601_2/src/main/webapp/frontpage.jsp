<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style>
</style>
<head>
<meta charset="UTF-8">
<title>601 FrontPage</title>
<link href="./css/frontpage.css" rel="stylesheet"/>
<link href="./css/food.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/frontmenu.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
		<div class="verticalmain">
			<div class="mainleft">
				<%@ include file="chat.jsp" %>
				<!-- <div class="menu">
					<nav>
						<ul class = no-bullet>
							<li onclick="url('./instagram.jsp')"><img src="./assets/img/instagram.png" alt="601스타그램" width="40" height="auto" > 601스타그램</li>
							<li onclick="url('./food')"><img src="./assets/img/restaurant.jpg" alt="601맛집" width="40" height="auto" > 601맛집</li>
							<li onclick="url('./jobinfo.jsp')"><img src="./assets/img/jobnews.png" alt="601취업 정보" width="40" height="auto" > 601취업정보</li>
							<li onclick="url('./join')"><img src="./assets/img/login.png" alt="로그인" width="40" height="auto" > 로그인</li>
							<li></li>
							<li></li>
							
						</ul>
					</nav>
				</div> -->
			</div>
			<div class="maincenter">
				<div class="boxrow">
					<div class = "youtubeleftbox">
						<div class="youtubelink">
							<img src="./assets/img/youtube.png" alt="유투브"> <a href="https://www.youtube.com/@poseidon5349/featured" target="_blank">선생님 유투브</a>
						</div>
						<div class ="youtubeplay">
							<iframe  width="100%" height="100%" src="https://www.youtube.com/embed/YkVyu_uXB3Y" frameborder="0" allowfullscreen></iframe>
						</div>
					</div>
					
					<div class="youtuberightbox">
						<div class="youtubelink">
							<img src="./assets/img/youtube.png" alt="유투브"> <a href="https://www.youtube.com/@codingnoodle" target="_blank">추천 유투브</a>
						</div>
						<div class ="youtubeplay">
							<iframe width="100%" height="100%" src="https://www.youtube.com/embed/ti00Z0S-haE" frameborder="0" allowfullscreen></iframe>
						</div>
					</div>
				</div>
				<div class="boxrow2">
					<a href="/newsBoard" target="_self">
						<div class="boxrow2title">
							<img src="./assets/img/jobnews.png" alt="뉴스" height="20" style="margin-right: 10px; vertical-align: middle;">뉴스
							<i style="float: right;">
								>
							</i>
						</div>
					</a>
					<div class="boxrow2content">
						<%@ include file="frontNewsBoard.jsp" %>
					</div>
				</div>
				<div class="thirdboxrow">
					<div class="restaurant">
						<div class="boxlink" >
							<img src="./assets/img/restaurant.jpg" alt="" height="20" style="margin-right: 10px; vertical-align: middle;"><a href="/food" target="_self">601맛집</a>
						</div>
						<div style="background-color: white">
							<table class="write" style="padding: 0">
								<div style="font-size: 30px; text-align: center;">
									<img alt="reviewlist1" src="./img/reviewlist1.png" width="30px;">&nbsp; 후기 리스트
								</div>
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
									<c:forEach items="${foodlist }" var="row2" varStatus="status" end="5">
										<tr class="dfg">
											<td class="d1">${row2.food_title }</td>
											<td class="d2">${row2.food_like }/ ${row2.food_dislike }</td>
											<td class="d2">${row2.grade }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="sixzeroonwstagram" style="border: 1px solide red;">
						<div class="boxlink">
							<img src="./assets/img/instagram.png" alt="" height="20" style="margin-right: 10px; vertical-align: middle;"><a href="/imgList" target="_self">601스타그램</a>
						</div>						
						<div class="instarow-container">
							<div class= "instarow">
								<div class="insta-image-container">
								 	<img src="data:image/jpeg;base64,${img1}" alt="Image 1">
								</div>
								<div class="insta-image-container">
									<img src="data:image/jpeg;base64,${img2}" alt="Image 2">
								</div>
							</div>
							<div class= "instarow">
								<div class="insta-image-container">
									<img src="data:image/jpeg;base64,${img3}" alt="Image 3">
								</div>								
								<div class="insta-image-container">
									<img src="data:image/jpeg;base64,${img4}" alt="Image 4">
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mainright">
				<div class = rightAd>
					<img src="./assets/img/ad_right.png" alt="오른쪽 광고 배너" width="100%" height="auto" >
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>
</body>
</html>