<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>실시간 익명 채팅</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
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
</script>
</head>
<body>
<div class="container">
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4 style="color: #ED7458;"><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
						</div>
						<div class="clearfix"></div> 
					</div>
					<div id="chat" class="panel-collase collase in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; height:600px;">
						</div>
						<div class="portlet-footer" style="height: 200px;">
							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="8">
								</div>
							</div>
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
								</div>
								<div class="form-group col xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>								
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display: none;">
		<strong>메세지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		<strong>이름과 내용을 모두 입력해 주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>		
</div>
<script type="text/javascript">
	$(document).ready(function() {
		chatListFunction('ten');
		getInfiniteChat();
	});
</script>
<!-- <button type="button" class="btn btn-default pull-right" onclick="chatListFunction('ten');">추가</button> -->
</body>
</html>