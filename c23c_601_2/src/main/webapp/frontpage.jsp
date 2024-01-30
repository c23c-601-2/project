<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
header {
	border: 2px solid #000;
}
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	border: 2px solid red;
}

.maincenter {
	width: 70%;
	justify-content: center;
	align-items: center;
	height: 100vh;
	border: 2px solid black;
	background-color: yellow;
}

.rowbox {
	margin: 10px;
	height: 300px;
	display: flex;
	flex-direction: row;
	/* justify-content: space-between; */
	background-color: ffffea;
}

.boxleft {
	width: 49%;
	margin: 0 4px 0 0; 
	background-color: #F8F8C1;
}

.boxright {
	width: 49%;
	margin: 0 0 0 4px;
	background-color: #F8F8C1;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Front Page</title>
</head>
<body>
	<header> 메뉴 헤더입니다. </header>
	<div class=container>
		<div class=incontainer>왼쪽 메뉴 부분</div>
		<div class="maincenter">
			<div class="rowbox">
				<div class="boxleft">
					<iframe width="100%" height="100%"
						src="https://www.youtube.com/embed/YkVyu_uXB3Y"></iframe>
				</div>
				<div class="boxright">
					<iframe width="100%" height="100%"
						src="https://www.youtube.com/embed/ti00Z0S-haE"></iframe>
				</div>
			</div>
			<div class="rowbox">
				<div class="boxleft">첫 번째 박스</div>
				<div class="boxright">두 번째 박스</div>
			</div>
			<div class="rowbox">
				<div class="boxleft">세 번째 박스</div>
				<div class="boxright">네 번째 박스</div>
			</div>
		</div>
		<div class=incontainer>오른쪽 메뉴 부분</div>
	</div>
</body>
</html>