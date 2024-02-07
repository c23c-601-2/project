<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
</head>
<style>
.frontinstarow {
	display: flex;
	flex-direction: row;
	//justify-content: space-between;
	height: 400px;
}
.imgbody {
}
</style>
<body>
	<div class="frontinstarow">
		<div class="imgbody">
			<img src="data:image/jpeg;base64,${img1}" alt="Image 1" height="160">
		</div >
		<div class="imgbody">
			<img src="data:image/jpeg;base64,${img2}" alt="Image 2" height="160">
		</div>
	</div>
	<div class="frontinstarow">
		<div class="imgbody">
			<img src="data:image/jpeg;base64,${img3}" alt="Image 3" height="160">
		</div>
		<div class="imgbody">
			<img src="data:image/jpeg;base64,${img4}" alt="Image 4" height="160">
		</div>
	</div>
</body>
</html>