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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/frontmenu.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
		<div class="verticalmain">
			<div class="mainleft">
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
				<div>
					
    			</div>
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
				<div class="boxrow">
					<div class="boxleft">
						<img src="./assets/img/ad.png" alt="광고" width="100%" height="100%" > 
					</div>
					<div class="boxright">
						<div class="sixzeroonwstagram">
							제목	
						</div>
						<iframe src="https://tcpschool.com/ajax/intro" style="width:100%; flex: 1">
						</iframe>
					</div>
				</div>
				<div class="boxrow">
					<div class="boxleft">
						<div class="sixzeroonestagram">
							제목	
						</div>
						<iframe src="https://blog.naver.com/wisejia" style="width:100%; height:100%">
						</iframe>
					</div>
					<div class="boxright">
						<div class="sixzeroonwstagram">
							제목	
						</div>
						<iframe src="https://www.jumpit.co.kr/" style="width:100%; height:100%">
						</iframe>
					</div>
				</div>
			</div>
			<div class="mainright">
				<div class="account">
					<div>
						<input type="hidden" name="_csrf" value="1358311e-a772-408c-8f71-a0ba45d9107a"/>
						<input type="text" autocapitalize="off" placeholder="아이디" name="userId" value="" class="input_id" spellcheck="false">
						<input type="password" placeholder="비밀번호" name="userPassword" value="" class="input_pw" spellcheck="false">
						
					</div>
				</div>
				<div class = rightAd>
					<img src="./assets/img/ad_right.png" alt="오른쪽 광고 배너" width="100%" height="auto" >
				</div>
			</div>
		</div>
		<footer>
			<div class="footercontent">
				<div class="area_legal">
					<a href="/service/cs/privacy" target="_blank">개인정보처리방침</a>
					<a href="/service/cs/conditions" target="_blank">이용약관</a>
					<a href="/service/cs/policy" target="_blank">책임의 한계와 법적고지</a>
					<a href="/service/cs/teenager" target="_blank">청소년 보호정책</a>
				</div>
				<p style="margin: 8px">Copyright <strong>©601 2조</strong> All rights reserved.</p>
			</div>
		</footer>
	</div>
</body>
</html>