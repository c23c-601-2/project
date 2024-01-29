<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	.container {
	margin: 10px;
	height: 300px;
	display : flex;
	flex-direction: row;
	justify-content: space-between;
	background-color: ffffea;
	}
	
	.box {
	width: 48%;
	border: 1px solid black;
	padding: 10px;
	background-color: #F8F8C1;
	
	}	

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="box"> 첫 번째 박스 </div>
		<div class ="box"> 두 번째 박스</div>
	</div>
	<div class="container">
		<div class = "box">세 번째 박스</div>
		<div class = "box">네 번째 박스11</div>
	</div>

</body>
</html>