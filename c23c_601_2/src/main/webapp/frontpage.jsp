<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.container {
	border: 1px solid red;
	margin: 0 auto;
	width: 60%
}

header {
	border: 1px solid black;
	height: 100px;
}
.verticalmain {
	border: 1px solid black;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}
.mainleft {
	border: 1px solid black;
	width: 10%
}
.menu {
	border: 1px solid black;
}
.maincenter {
	width: 100%;
}
.mainright {
	border: 1px solid black;
	width: 10%
}

.boxrow {
	margin: 10px;
	height: 300px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	background-color: ffffea;
}

.youtubeleftbox {
	width: 50%;
	margin-right: 2px;
}	

.youtubelink {
	height: 10%;
	display: flex;
	align-items: center;
    
}
.youtubelink a {
	color: inherit;
	text-decoration: none;
	font-weight: bold;
}

.youtubelink img {
    margin-right: 10px; /* 이미지와 텍스트 사이 여백을 조절 */
 }
.youtubeplay {
	height: 90%;
	width: 100%
	
}

.youtuberightbox{
	width: 50%;
	margin-left: 2px;
}

.boxleft {
	width: 50%;
	border: 1px solid blue;
	margin-right: 2px;
	background-color: #F8F8C1;
}

.boxright {
	width: 50%;
	border: 1px solid blue;
	margin-left: 2px;
	background-color: #F8F8C1;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header> 헤더부분 </header>
		<div class="verticalmain">
			<div class="mainleft">
			왼쪽 메뉴
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
					<div class="boxleft">첫 번째 박스</div>
					<div class="boxright">두 번째 박스</div>
				</div>
				<div class="boxrow">
					<div class="boxleft">세 번째 박스</div>
					<div class="boxright">네 번째 박스</div>
				</div>
			</div>
			<div class="mainright">오른쪽 메뉴</div>
		</div>
	</div>
</body>
</html>