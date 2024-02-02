<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<style>
#like{
	width: 100px;
}

</style>

</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<div>
			<div>
				<article>
					<h1>후기 쓰기</h1>
					<div>
						<form action="./write" method="post">
							제목 : <input type="text" id="title" name="title">
							평점 : <select name="grade"> 
										<optgroup label="평점">
											<option <c:if test="${row.grade eq 1}">selected="selected"</c:if> value="1">1/5</option>
											<option <c:if test="${row.grade eq 2}">selected="selected"</c:if> value="2">2/5</option>
											<option <c:if test="${row.grade eq 3}">selected="selected"</c:if> value="3">3/5</option>
											<option <c:if test="${row.grade eq 4}">selected="selected"</c:if> value="4">4/5</option>
											<option <c:if test="${row.grade eq 5}">selected="selected"</c:if> value="5">5/5</option>
										</optgroup>
								</select>
							<textarea id="summernote" name="content"></textarea>
							<button type="submit">등록하기</button>
						</form>
					</div>
				</article>
				<button onclick="url('./board')">게시판으로</button>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>
</html>