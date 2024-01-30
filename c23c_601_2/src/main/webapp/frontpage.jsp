<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.container {
	border: 1px solid black;
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
	width: 25%
}
.maincenter {
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header> 헤더부분 </header>
		<div class="verticalmain">
			<div class="mainleft">왼쪽 메뉴</div>
			<div class="maincenter">
				<div class="boxrow">
					<div class="boxleft">
						<iframe width="100%" height="100%" src="https://www.youtube.com/embed/YkVyu_uXB3Y" frameborder="0" allowfullscreen></iframe>
					</div>
					<div class="boxright">
						<iframe width="100%" height="100%" src="https://www.youtube.com/embed/ti00Z0S-haE" frameborder="0" allowfullscreen></iframe>
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