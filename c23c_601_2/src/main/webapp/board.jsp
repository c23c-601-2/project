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
		if(confirm('수정하시겠습니까?')){
			let no = $(this).prev().val();
			let edit = $(this).closest('tr').find('.d3');
			//alert(edit);
			//alert(no + ":" + edit);
				  function removeBR(str) {
    return str.replaceAll('<br>', '');
}
            $(this).prev().hide();
			$(this).hide();
			edit.css('height','10');
			edit.css('padding-top','10px');
			edit.css('backgroundColor','white');
			let updateBox = '<div class="updateBox">';
			updateBox += '<textarea class="updateBox1" name="content1">' + removeBR(edit.html()) + '</textarea><br>';
			updateBox += '<span class="update-count"></span>';
			updateBox += '<input type ="hidden" name = "no" value ="' +no+ '"><br>';
			updateBox += '<button class="update-btn" type = "submit">글 수정</button>';
			updateBox += '<button id="cancelButton" type="button">취소</button>';
			updateBox += '</div>';
			
			edit.html(updateBox);
			
			$(document).on('keyup', '.updateBox1', function() {
			    let text = $(this).val();
			    let max = 35;
			    let remaining = max - text.length;
			    if (remaining < 0) {
			    	remaining = 0;
			        $(this).val(text.substr(0, 35));
			        alert("35자를 초과했습니다.");
			    }
			    $(this).siblings('.update-count').text("남은 글자: " + remaining);
			});
			
			$('#cancelButton').click(function() {
				location.reload();
			});
		}
	});
	
	$(document).on('click',".update-btn", function (){
		if(confirm('수정하시겠습니까?')){
			let no = $(this).closest('.updateBox').find('input[name="no"]').val();
			let edit = $(this).closest('.updateBox').find('.updateBox1').val();
			let updateBox = $(this).parents('.d3').find('.updateBox'); //태그부모위치
			//let updateEdit = $(this).parents('.updateBox').siblings('.d3');
			let updateEdit = $(this).parents('.d3');
			$.ajax({
				url : './contentUpdate',
				type : 'post',
				dataType : 'text',
				data : {'no': no, 'edit': edit},
				success : function(result){
					//alert('통신 성공 : ' + result);
					if(result == 1){
						updateBox.remove();
						updateEdit.css('backgroundColor','#brown');
						updateEdit.css('min-height','100px');
						updateEdit.css('height','auto');
						updateEdit.append(edit.replace('<br>', ''));
						$(".contentupdate").show();
					} else {
						alert("문제가 발생했습니다. 화면을 갱신합니다." + result);
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
	width: 230px;
	height: 900px;
	overflow: hidden;
}

.table {
	text-align: center;
	width: 50%;
	margin: 0 auto;
	border-collapse: collapse;
	border-bottom: 1px solid gray;
	background-color: white;
}

.paging {
	margin: 0 auto;
	width: 500px;
	height: 30px;
	/* background-color: gray; */
	margin-top: 10px;
	line-height: 30px;
	text-align: center;
}

.main {
	width: 80%;
}
</style>
</head>
<body style="background-color: #F5ECE4">
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
										<td class="d1">${row.write }<c:if
												test="${sessionScope.mid ne null && row.write eq sessionScope.mid }">
												<input type="hidden" class="no" value="${row.no}">
												<img alt="edit" src="./img/edit1.png" class="contentupdate">
											</c:if>
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