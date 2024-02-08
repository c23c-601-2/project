<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/chat.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>후기 쓰기</title>
<style type="text/css">
.container1 {
	width: 1408px;
	margin : 0 auto;
}

#content {
	margin: 0;
	padding: 0;
	margin: auto;
	width: 500px;
	height: 200px;
	text-align: center;
}

.write {
	display: block;
}

.writeall {
	margin: 0;
	padding: 0;
	margin: auto;
	height: 719px;
	text-align: center;
	background-color: #F2E3CF;
	text-align: center;
}

#title {
	width: 400px;
	margin-left: 2px;
}

footer {
	margin: auto;
	background-color: #F2E3CF;
}

.footercontent {
	text-align: center;
	padding: 5px;
}

#title2 {
	font-family: "Arial", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

#review {
	font-size: 36px;
}

#grade {
	width: 50px;
}

.contentarea {
	margin-left: 5px;
}

.buttonarea {
	margin-left: 5px;
}

.chatcontainer {
	padding: 0 0 0 0;
}
</style>
<script type="text/javascript">
var lastID = 0;
function submitFunction() {
	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	$.ajax({
		type: "POST",
		url: "./chatSubmitServlet",
		data: {
			chatName: encodeURIComponent(chatName),
			chatContent: encodeURIComponent(chatContent)
		},
		success: function(result) {
			if (result == 1) {
				autoClosingAlert('#successMessage', 2000);
			} else if (result == 0){
				autoClosingAlert('#dangerMessage', 2000);
			} else {
				autoClosingAlert('#warningMessage', 2000);
			}
		}
	});
	$('#chatContent').val('');
}
function autoClosingAlert(selector, delay) {
	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() {alert.hide()}, delay);
}
function chatListFunction(type) {
	$.ajax({
		type: "POST",
		url: "./chatListServlet",
		data: {
			listType: type,
		},
		success: function(data) {
			console.log(data);
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value, result[i][2].value);
			}
			lastID = Number(parsed.last);
		}
	});	
}
function addChat(chatName, chatContent, chatTime) {
	$('#chatList').append('<div class="row">' + 
				'<div class="col-lg-12">' + 
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" src="images/icon1.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 style="color: #8E7C68" class="media-heading">' +
				chatName +
				'<span style="font-size: 0.8em; " class="float-end">' +
				chatTime + 
				'</span>' +
				'</h4>' +
				'<p style="font-size: 1.2em; font-weight: bold; color: #ED7458;">' +
				chatContent +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
function getInfiniteChat() {
	setInterval(function() {
		chatListFunction(lastID);
	},1000);
}

	$(document).ready(function() {
		$(document).on('keyup', '#title', function() {
			let text = $(this).val().replace(/\s/g, "");
			if (text.length > 10) {
				alert("10자 넘었어요.");
				$(this).val(text.substr(0, 10));
			}
			$(".title1").text("제목 " + text.length + "/10");
		});

		$(document).on('keyup', '#content', function() {
			let text = $(this).val().replace(/\s/g, "");
			if (text.length > 50) {
				alert("50자 넘었어요.");
				$(this).val(text.substr(0, 50));
			}
			$(".textarea1").text("글쓰기 " + text.length + "/50");
		});

	});

	function titlecheck() {
		let title = document.getElementById("title").value.replace(/\s/g, "");
		if (title.length < 1) {
			alert("제목은 최소 1글자 이상 입력해주세요.");
			$("#title").focus();
			return false;
		}
		return true;
	}

	function contentcheck() {
		let content = document.getElementById("content").value.replace(/\s/g,
				"");
		if (content.length < 5) {
			alert("내용은 최소 5글자 이상 입력해주세요.");
			$("#content").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container1">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>
		<div>
			<div class="chatcontainer" >
				<div class="container bootstrap snippet">
					<div class="row">
						<div class="col-xs-12" style="padding: 5px;">
							<div class="portlet portlet-default">
								<div class="portlet-heading">
									<div class="portlet-title">
										<h4 style="color: #ED7458;">
											<i class="fa fa-circle text-green"></i>실시간 익명 채팅방
										</h4>
									</div>
									<div class="clearfix"></div>
								</div>
								<div id="chat" class="panel-collase collase in">
									<div id="chatList" class="portlet-body chat-widget"
										style="overflow-y: auto; height: 540px;"></div>
									<div class="portlet-footer" style="height: 200px;">
										<div class="row">
											<div class="form-group col-xs-4">
												<input style="height: 40px;" type="text" id="chatName"
													class="form-control" placeholder="이름" maxlength="8">
											</div>
										</div>
										<div class="row" style="height: 90px">
											<div class="form-group col-xs-10">
												<textarea style="height: 100px;" id="chatContent"
													class="form-control" placeholder="메시지를 입력하세요."
													maxlength="100"></textarea>
											</div>
											<div class="form-group col xs-2">
												<button type="button" class="btn btn-default pull-right"
													onclick="submitFunction();">전송</button>
												<div class="clearfix"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="alert alert-success" id="successMessage"
					style="display: none;">
					<strong>메세지 전송에 성공했습니다.</strong>
				</div>
				<div class="alert alert-danger" id="dangerMessage"
					style="display: none;">
					<strong>이름과 내용을 모두 입력해 주세요.</strong>
				</div>
				<div class="alert alert-warning" id="warningMessage"
					style="display: none;">
					<strong>데이터베이스 오류가 발생했습니다.</strong>
				</div>
			</div>
			<div>
				<article class="writeall">
					<br><span id="review">후기 쓰기</span><br>
			<br><h2 class="h2">🧡 여러분의 소중한 후기 감사드립니다. 🧡</h2><br><br>
					<form action="./write" method="post"
						onsubmit="return titlecheck() && contentcheck()">
						<div class="write">
							<span id="title2"></span><input type="text" id="title"
								name="title" placeholder="가게이름은 10자 이하로 입력 해 주세요."> 평점 : <select id="grade" name="grade">
							<optgroup label="  평점">
								<option
									<c:if test="${row.grade eq 1}">selected="selected"</c:if>
									value="1">1/5</option>
								<option
									<c:if test="${row.grade eq 2}">selected="selected"</c:if>
									value="2">2/5</option>
								<option
									<c:if test="${row.grade eq 3}">selected="selected"</c:if>
									value="3">3/5</option>
								<option
									<c:if test="${row.grade eq 4}">selected="selected"</c:if>
									value="4">4/5</option>
								<option
									<c:if test="${row.grade eq 5}">selected="selected"</c:if>
									value="5">5/5</option>
							</optgroup>
						</select><br><label
								class="title1"></label>
						</div>
						<div class="contentarea">
							<input type="text" id="content" name="content"
								placeholder="50자 이하로 입력 해 주세요."><br><label
								class="textarea1"></label><br>
							<button class="textarea" type="submit">등록하기</button>
						</div>
					</form><br>
					<div class="buttonarea">
						<button onclick="url('./board')">게시판으로</button>
					</div>
					
				</article>
			</div>
		</div>
		<footer class="footer">
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500
		});

	});
	$(document).ready(function() {
		chatListFunction('ten');
		getInfiniteChat();
	});
</script>
</html>