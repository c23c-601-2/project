<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link href="./css/.css?ver=0.12" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>

<script>
$(function() {
		var mid = "${sessionScope.mid}";
	function toLogin() {
        alert("로그인 후 이용해 주세요");
        location.href = "./login";
    }
	
	$('#searchBtn').click(function() {
		let search = $('#search').val();
		if (search.length < 1) {
			alert("한글자 이상으로 적어주세요");
			$("#search").focus();
		} else {
			location.href = "./board?search=" + search;
		}
	});
	
	$('.checkmid').click(function() {
        if (mid === null || mid === "") {
        	toLogin();
        } else {
            window.location.href = "./write";
        }
    });
	
	$('.likeBtn1').click(function() {
		let no = $(this).siblings('.likeBtnno').val();
	    if (mid == null || mid == "") {
	        toLogin();
	    } else {
	        $.ajax({
	            url: './likeUp',
	            type: 'post',
	            dataType: 'text',
	            data: {'no' : no},
	            success: function(result) {
	                if (result == 1) {
	                	location.reload();
	                } else {
	                    alert("이미 추천하셨습니다!");
	                }
	            },
	            error : function(error){
		            alert("문제가 발생했습니다. 관리자에게 문의하세요.");
		            }   
	            }); 
	        }
	});
	
	$('.dislikeBtn1').click(function() {
		let no = $(this).siblings('.dislikeBtnno').val();
	    if (mid == null || mid == "") {
	        toLogin();
	    } else {
	        $.ajax({
	            url: './disLikeUp',
	            type: 'post',
	            dataType: 'text',
	            data: {'no' : no},
	            success: function(result) {
	                if (result == 1) {
	                	location.reload();
	                } else {
	                    alert("또 싫어할 수 없습니다.관리자에게 문의하세요.");
	                }
	            },
	            error : function(error){
		            alert("문제가 발생했습니다. 관리자에게 문의하세요.");
		            }   
	            }); 
	        }
	});
	
	
	$(".contentupdate").click(function(){
		//alert("수정하시겠습니까?");
		if(confirm('수정하시겠습니까?')){
			//필요한 값 cno 잡기 / 수정한 내용 + 로그인 --> 서블릿에서 정리
			let no = $(this).parents("tr").find(".d1").text();
			alert(no);
			let edit = $(this).parents(".chead").next(); //나중에 html변경 태그는 무조건 object라고 뜸
			alert(cno + ":" + comment);
				  function addBR(str) {
                return str.replaceAll("<br>", "\r\n" );
            } // 개행태그 문자로 바꿔주기
            $(this).prev().hide();
			$(this).hide();
			comment.css('height','110');
			comment.css('padding-top','10px');
			comment.css('backgroundColor','#c1c1c1');
			let recommentBox = '<div class="recommentBox">';
			recommentBox += '<textarea class="commentcontent" name="comment">' + addBR(comment.html()) + '</textarea>';
			recommentBox += '<input type ="hidden" name = "cno" value ="' +cno+ '">';
			recommentBox += '<button class="comment-btn" type = "submit">댓글 수정</button>';
			recommentBox += '</div>';
			
			comment.html(recommentBox);
		}
	});
	
	//댓글수정  .comment-btn버튼 눌렀을 때 .cno값, .commentcontent값 가져오는 명령 만들기
	// 2024-01-25
	$(document).on('click',".comment-btn", function (){
		if(confirm('수정하시겠습니까?')){
			let cno = $(this).prev().val();
			let recomment = $('.commentcontent').val();
			let comment = $(this).parents(".ccomment");//댓글 위치
			$.ajax({
				url : './recomment',
				type : 'post',
				dataType : 'text',
				data : {'cno': cno, 'comment': recomment},
				success : function(result){
					//alert('통신 성공 : ' + result);
					if(result == 1){
						//수정된 데이터를 화면에 보여주면 되요.
						$(this).parent(".recommentBox").remove();
						comment.css('backgroundColor','#brown');
						comment.css('min-height','100px');
						comment.css('height','auto');
						comment.html(recomment.replace(/(?:\r\n|\r|\n)/g, '<br>'));
						$(".commentDelete").show();
						$(".commentEdit").show();
					} else {
						alert("문제가 발생했습니다. 화면을 갱신합니다.");
						//실패 화면 재 로드.
						//location.href ='./detail?page=${param.page}&no=${param.no}'; 
						//param url에 나오는 주소 그대로 가져오기
						location.href='./detail?page=${param.page}&no=${detail.no}';
					}
				},
				error : function(error){
					alert('문제가 발생했습니다. : ' + error);
				}
			});
		}
	});
});
</script>
<style>
.d1, .likeBtn, .dislikeBtn {
	width: 10%;
}

.d2 {
	width: 20%;
}

.d3 {
	width: 30%;
}


.container {
	display: flex;
}

.chat {
	width: 200px;
	overflow: hidden;
}
.table {
	text-align: center;
	width: 50%;
	margin: 0 auto;
	border-collapse: collapse;
	border-bottom: 1px solid gray;
}

.paging{
	margin: 0 auto;
	width: 500px;
	height: 30px;
	/* background-color: gray; */
	margin-top: 10px;
	line-height: 30px;
	text-align: center;
}

.main{
	width: 80%;
}
</style>
</head>
<body>
	<div>
		<%@ include file="header.jsp"%>
	</div>
	<div>
		<%@ include file="nav.jsp"%>
	</div>
	<div class="container">
		<div class="chat">
			<%@ include file="chat.jsp"%>
		</div>

		<div class="main">
			<div class="mainStyle">
					<form action="./board">
						<div class="search">
							가게이름 검색하기 :<input type="text" name="search">
							<button id="searchBtn">검색</button>
						</div>
					</form>
					<c:choose>
						<c:when test="${fn:length(list1) gt 0 }">
							<table class="table">
								<thead>
									<tr>
										<th class="d1">번호</th>
										<th class="d1">가게 이름</th>
										<th class="d3">후기 내용</th>
										<th class="d1">작성자</th>
										<th class="d1">날짜</th>
										<th class="d1">좋아요</th>
										<th class="d1">싫어요</th>
										<th class="d2">평점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list1}" var="row" varStatus="s">
										<tr>
											<td class="d1">${s.index+1 }</td>
											<td class="d1">${row.title }</td>
											<td class="d3">${row.content }</td>
											<td class="d1">${row.write }
											<img alt="edit" src="./img/edit.png" class="contentupdate">
											</td>
											<td class="d1">${row.date }</td>

											<td class="likeBtn">${row.like }<input type="hidden"
												class="likeBtnno" value="${row.no}">
												<button class="likeBtn1">
													<img alt="up" src="./img/up.jpg" width="15px;">
												</button>
											</td>

											<td class="dislikeBtn">${row.dislike }<input
												type="hidden" class="dislikeBtnno" value="${row.no}">
												<button class="dislikeBtn1">
													<img alt="down" src="./img/down.jpg" width="15px;">
												</button>
											</td>

											<td class="d1">${row.grade }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<c:set var="totalPage" value="${totalCount / 10 }" />
							<fmt:parseNumber integerOnly="true" value="${totalPage }"
								var="totalPage" />

							<c:if test="${totalCount % 10 gt 0}">
								<c:set var="totalPage" value="${totalPage + 1 }" />
							</c:if>

							<c:set var="startPage" value="1" />
							<c:if test="${page gt 5 }">
								<c:set var="startPage" value="${page - 5 }" />
							</c:if>

							<c:set var="endPage" value="${startPage + 9 }" />${endPage }
							<c:if test="${endPage gt totalPage  }">
								<c:set var="endPage" value="${totalPage }" />
							</c:if>

							<div class="paging">
								<button onclick="paging(1)"
									<c:if test="${page lt 2}">disabled="disabled"</c:if>>⏮️</button>
								<button
									<c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if>
									onclick="paging(${page - 10 })">◀️</button>
								<c:forEach begin="${startPage }" end="${endPage }" var="p">
									<button <c:if test="${page eq p }"> class ="currentBtn" </c:if>
										onclick="paging(${p})">${p }</button>
								</c:forEach>
								<button
									<c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if>
									onclick="paging(${page + 10 })">▶️</button>
								<button onclick="paging(${totalPage })">⏭️</button>
							</div>
						</c:when>
						<c:otherwise>
							<h1>출력할 값이 없습니다.</h1>
						</c:otherwise>
					</c:choose>
					<button class="checkmid" onclick="url('./write')">글쓰기</button>
					<c:if test="${sessionScope.mid ne null }">
						<br> ${sessionScope.mid}님 반갑습니다.
					</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function paging(no){
		location.href="./board?page="+no;
	}
</script>
</body>
</html>