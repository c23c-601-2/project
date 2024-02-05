<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp"%>
<link href="./css/imageList.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<%-- <header>
	<%@ include file="header.jsp"%>
</header> --%>

	<!-- 본문시작 pdsList.jsp-->
	<h3 class="h3">Instagram 601</h3>
	<p>
		<a href="./imgForm">글쓰기</a>
	</p>

	<script>
    function addComment(pdsno) {
    	alert("댓글쓰기??");
        var commentContent = document.getElementById("commentcontent").value;

        // AJAX를 사용하여 서버에 댓글 추가 요청 보내기
        $.ajax({
            type: "post",
            url: "./commentServlet", // CommentServlet 또는 CommentController와 같은 서버 측 핸들러 URL
            dataType : 'text',
            data: {"pdsno": pdsno, "commentContent": commentContent
            },
            success: function (commentList) {
                // 서버에서 성공적으로 응답을 받았을 때 실행되는 코드
                // 새로운 댓글을 목록에 추가
                for (var i = 0; i < commentList.length; i++) {
                    var comment = commentList[i];
                    var newComment = '<li>' + comment.mid + '님: ' + comment.comment + '</li>';
                    $("#comment-list").append(newComment);
                }
            },
            error: function (error) {
                // 서버에서 오류 응답을 받았을 때 실행되는 코드
                alert("문제 발생?!?! 도대체 왜?!?!? " + error);
                // 사용자에게 오류 메시지를 표시할 수 있습니다.
            }
        });
    }
</script>

<script>
// 2024-01-24
	$("#comment-button").click(function(){
		let comment = $("#commentcontent").val();
		/* let bno = ${detail.no }; */
		if(content.length < 5){
			alert("댓글은 다섯글자 이상으로 적어주세요.");
			$("#commentcontent").focus();
		} else {
			let form = $('<form></form>');
			form.attr('name', 'form');
			form.attr('method', 'post');
			form.attr('action', './imgList'); /* 어디로..? */
			form.append($('<input/>', {type:'hidden', name:'commentcontent', value:comment}));//json
			/* form.append($('<input/>', {type:'hidden', name:'bno', value:bno})); */
			form.appendTo("body");
			form.submit();
		}
	});//댓글쓰기 동적생성 끝
	
	//id="commentcontent"
	//id="comment-btn"
	//댓글쓰기 창에 쓸 수 있는 글자 표시해주고 넘어가면 더이상 입력 불가로 바꾸기
	$("#commentcontent").keyup(function(){
        let text = $(this).val();
        if(text.length > 100){alert("100자 넘었어요.");$(this).val(text.substr(0, 100));}
        $("#comment-btn").text("글쓰기 " + text.length +  "/100");
     });
	
});

</script>
	<%
	ArrayList<PdsDTO> list = dao.list();
	if (list == null || list.isEmpty()) {
		out.println("관련 자료 없음 T.T");
	} else {
		/* PdsDTO dto; */ // 반복문 밖에서 선언
	%>
	전체 글 개수 :
	<%=list.size()%>
	<br>
	<!-- <table class="list_table">
    <tr>
        <th>제목</th>
        <th>사진</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
    </tr> -->
	<%
	for (int idx = 0; idx < list.size(); idx++) {
		dto = list.get(idx); // 이미 선언된 변수를 사용
		String formattedRegdate = "";
		if (dto.getRegdate() != null) {
			try {
		formattedRegdate = new SimpleDateFormat("yyyy-MM-dd").format(dto.getRegdate());
			} catch (IllegalArgumentException e) {
		// 다른 형식으로 시도
		if (dto.getRegdate() != null && dto.getRegdate().matches("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}")) {
			formattedRegdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dto.getRegdate());
		} else {
			formattedRegdate = "";
		}
			}
		}
		if (dto.getFilename() != null) {
	%>

	<div class="post">
		<div class="post-image-container">
			<img class="post-image"
				src="<%=request.getContextPath() + "/webapp/storage/" + dto.getFilename()%>"
				alt="Post Image">
		</div>
		<div class="post-info">
			<div class="post-icons">
				<img src="./img/heart.png" alt="Heart Icon"> <img
					src="./img/speech-bubble.png" alt="말풍선"> <img
					src="./img/send.png" alt="dm"> <img src="./img/bookmark.png"
					alt="bookmark"><br>
			</div>
			<div class="post-writer"><%=dto.getWname()%></div>
			<div class="post-content"><%=dto.getSubject()%></div>
		</div>
		<div class="post-comment">
			<ul id="comment-list">
				<!-- 댓글 목록을 출력하는 부분 -->
				<c:forEach items="${commentList}" var="comment">
					<li>${comment.mid}님:${comment.comment}</li>
				</c:forEach>
			</ul>
			<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 댓글내용, 누가, 어느, 2024-01-22 -->
			<div class="comment-write">
				<div class="comment-form">
				
					<textarea id="commentcontent" name="commentcontent"></textarea>
					<button id="comment-button"
						onclick="addComment(<%=dto.getPdsno()%>)">댓글쓰기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 댓글 출력창 -->
	<div class="comments">
		<c:forEach items="${commentList}" var="comment">
			<div class="comment">
				<div class="chead">
					<div class="cname">${comment.mid}님</div>
				</div>
				<div class="ccomment">${comment.comment}</div>
			</div>
		</c:forEach>
	</div>

	<%
	}
	} // for end
		// out.println("</table>");

	} // if
	%>
</body>
</html>