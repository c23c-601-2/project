<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
.mainsearch {
	border: 1px solid black;
	width: 25%
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
<!-- 부트스트랩 -->
<title>Map</title>
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	<h1>지도 입니다.</h1>
	<%@ include file="menu.jsp"%>
	<div class="mainsearch">
		검색창
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>