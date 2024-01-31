<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 글쓰기 페이지</title>
<!-- <link href="./css/menu.css" rel="stylesheet"> -->
<script type="text/javascript" src="./js/menu.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	
	$(document).ready(function() {
		  // 저장 버튼 클릭 이벤트
		  $("#write_button").click(function() {
			// `data` 변수를 초기화한다.
			    var data = {
			      content: $("#summernote").summernote('code'),
			      image_url: images[0].match(/"(.*)"/)[1],
			      created_at: new Date()
			    };
		    // 글과 이미지 데이터를 가져온다.
		    var content = $("#summernote").summernote('code');

		    // 글과 이미지 데이터를 `write-content` 영역에 출력한다.
		    $("#write-content").html(content);

		    // 이미지 태그를 찾아서 `write-content-body` 영역에 추가한다.
		    var images = content.match(/<img[^>]*src="([^"]+)"[^>]*>/g);
		    for (var i = 0; i < images.length; i++) {
		      var image = images[i];
		      $("#write-content-body").append(image);
		    }

		    // 제목과 작성자 ID를 가져온다.
		    var title = $("#title").val();
		    var author = $("#author").val();

		    // 제목과 작성자 ID를 `write-content-header` 영역에 출력한다.
		    $("#write-content-header h1").text(title);
		    $("#write-content-header-info p").eq(0).text(author);

		    // 데이터베이스에 저장할 데이터를 준비한다.
		    var data = {
		      content: content,
		      image_url: images[0].match(/"(.*)"/)[1],
		      created_at: new Date()
		    };

		    // 데이터베이스 연결을 얻는다.
		    var conn = DBConnection.getInstance().getConnection();

		 // 데이터베이스에 게시물을 저장한다.
		    var writeDTO = new WriteDTO(); // WriteDTO 객체 생성
		    writeDTO.setContent(data.content);
		    writeDTO.setImageUrl(data.imageUrl);
		    writeDTO.setCreatedAt(data.createdAt);

		    var writeDAO = new WriteDAO();
		    writeDAO.savePost(writeDTO);
		  }
		    // TODO: 데이터베이스에 게시물을 저장하는 코드를 작성한다.

		    // 데이터베이스 연결을 닫는다.
		    conn.close();
		  });
		});

  </script>


<style type="text/css">
.writeFORM{
	width: 500px;
}


#title{
	width: 100%;
	height: 30px;
	margin-bottom: 10px;
}

#write_button{
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
</head>
<body>
		<div class="main">
			<div class="mainStyle">
				<article><br><br>
					<h1>글쓰기</h1>
					<div class="writeFORM">
						<form action="./write" method="post">
							<input type="text" id="title" name="title">
							<textarea id="summernote" name="content"></textarea>
							<button type="submit" id="write_button" name="write_button">저장하기</button><br><br>
						</form>
					</div>


				</article>
        </div>
    </div>
    <div id="posts-container"></div>

<div id="summernote1"></div>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 100
		});
		
});
</script>

  
</body>
</html>