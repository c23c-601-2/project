<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지입니다.</title>
<script type="text/javascript" src="./js/menu.js"></script>


<style type="text/css">
#title{
	width: 100%;
	height: 30px;
	margin-bottom: 10px;
}

#update_button {
  width: 100px;
  padding: 7px;
  border: none;
  border-radius: 5px;
  color: white;
  font-weight: bold;
  background-color: #8E44EC;
  cursor: pointer;
  outline: none;
  margin: 10px;
}

</style>

<script type="text/javascript"> // 제목,내용 없이 입력했을 때 경고창 팝업
	function check(){
		var title = document.getElementById("title");
		if (title.value.length < 5) {
			alert("제목은 5글자 이상이어야 합니다.");
			title.focus();
			return false;
		}
		

		var content = document.getElementsByClassName("content");
		if(content[0].value.length < 3) {
			alert("내용은 3글자 이상 작성해주세요.");
			content[0].focus();
			return false;
		}
	}
</script>


</head>
<body>
	<div class="container1">
		<div class="main">
			<div class="mainStyle">
				<article><br>
					<h1>글 수정하기</h1>
					<div class="writeFORM">
						<form action="./update" method="post">
							<input type="text" id="title" name="title" value="${update.title }"><br>
							<textarea id="summernote" name="content">${update.content }</textarea>
							<input type="hidden" name="no" value="${update.no }">
							<button type="submit" id="update_button" name="update_button">수정하기</button>
						</form>
					</div>
				</article>
        </div>
    </div>
</div>
</body>
</html>
