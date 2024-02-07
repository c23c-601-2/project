<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp"%>
<link href="./css/imageList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
.container {
	margin: 0 auto;
	/* width: 1115px; */
		width: 70%;
	background-color: #F5ECE4;
}

.verticalmain {
	display: flex;
	flex-direction: row;
	justify-content: center;
	margin-top: 10px;
	margin-left: 5px;
}

.mainleft {
	width: 30%;
	text-align: left;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>
		<div class="verticalmain">
			<div class="mainleft">
				<%@ include file="chat.jsp"%>
			</div>
			<div class="post-div">
			<div class="listheader">
			<!-- 본문시작 pdsList.jsp-->
			<h3 class="h3">Instagram 601</h3>
			<p>
				<a href="./imgForm">글쓰기</a>
			</p>
			</div>
			<script>
    function addComment(pdsno) {
        var commentContent = document.getElementById('commentcontent'+pdsno).value;
        // AJAX를 사용하여 서버에 댓글 추가 요청 보내기
         $.ajax({
            type: "post",
            url: "./commentServlet", // CommentServlet 또는 CommentController와 같은 서버 측 핸들러 URL
            dataType : 'json',
            data: {"pdsno": pdsno, "commentContent": commentContent
            },
            success: function (result) {
                // 서버에서 성공적으로 응답을 받았을 때 실행되는 코드
                // 새로운 댓글을 목록에 추가
                
	            var newContents = "<li>"+result.mid+" : " +result.comment+"</li>";
	            $('#comment-list'+pdsno).append(newContents);
	          
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
	
	//id="commentcontent"
	//id="comment-btn"
	//댓글쓰기 창에 쓸 수 있는 글자 표시해주고 넘어가면 더이상 입력 불가로 바꾸기
	$("#commentcontent").keyup(function(){
        let text = $(this).val();
        if(text.length > 100){alert("100자 넘었어요.");$(this).val(text.substr(0, 100));}
        $("#comment-btn").text("글쓰기 " + text.length +  "/100");
     });
	

</script>
	<%
	CommentDAO cdao = new CommentDAO();
	List<CommentDTO> ccomment = null;
	ArrayList<PdsDTO> list = dao.list();
	if (list == null || list.isEmpty()) {
		out.println("관련 자료 없음");
	} else {
		/* PdsDTO dto; */
		// 반복문 밖에서 선언
	%>
	전체 글 개수 :
	<%=list.size()%>
	<br>
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
			
			String imgstr = dto.getBase64ImageData();
			request.setAttribute("imgstr", imgstr);
	%>

	<div class="post">
		<div class="post-image-container">
		<div class="post-writer">😀<%=dto.getWname()%> 😀</div>
			<img class="post-image"
				src="data:image/jpeg;base64,${imgstr}"
				alt="Post Image">
		</div>
		<div class="post-info">
			<div class="post-icons">
				<img src="./img/heart.png" alt="Heart Icon"> <img
					src="./img/speech-bubble.png" alt="말풍선"> <img
					src="./img/send.png" alt="dm"> 
					<img id="bookmark" src="./img/bookmark.png" alt="bookmark"><br>
			</div>
			
			<div class="post-content"><%=dto.getSubject()%></div>
		</div>
		<div class="post-comment">
			<ul id="comment-list<%=dto.getPdsno()%>">
				<!-- 댓글 목록을 출력하는 부분 -->
				<!-- dao.getCOMMECT -->

				<%
				ccomment = cdao.getCommentList(dto.getPdsno());
				%>
				<c:forEach items="<%=ccomment%>" var="comment">
					<li>${comment.mid}님:${comment.comment}</li>
				</c:forEach>
			</ul>

			<!-- 댓글쓰는 창 -->
			<c:if test="${sessionScope.mid ne null}">
				<!-- 로그인해야 댓글창 보임 -->
				<div class="comment-write">
					<div class="comment-form">

						<textarea id="commentcontent<%=dto.getPdsno()%>"
							name="commentcontent" placeholder="댓글을 작성해주세요."></textarea>
						<button id="comment-button"
							onclick="addComment(<%=dto.getPdsno()%>)">댓글쓰기</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>


	<%
	}
	} // for end
		// out.println("</table>");

	} // if
	%>
		</div>
	</div>
	</div>
		
</body>
</html>