<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>실시간 익명 채팅</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	function submitFunction() {
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
		alert(chatName);
		alert(chatContent);
		$.ajax({
			type: "POST",
			url: "./chatSubmitServlet",
			data: {
				chatName: chatName,
				chatContent: chatContent
			},
			success: function(result) {
				if (result == 1) {
					alert('전송에 성공했습니다.');
				} else if (result == 0){
					alert('이름과 내용을 정확히 입력하세요.');
				} else {
					alert('데이터베이스 오류가 발생했습니다.');
					alert(result);
				}
			}
		});
		$('#chatContent').val('');
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
								<h4><i class="fa fa-circle text-green">실시간 채팅방</i></h4>
							</div>
							<div class="clearfix"></div> 
						</div>
						<div id="chat" class="panel-collase collase in">
							<div class="portlet-body chat-widget" style="overflow-y: auto; height:300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted samll">2024년 2월 </p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="images/icon.png">
 											</a>
 											<div class="media-body">
 												<h4 class="media-heading">홍길동
 													<span class="small pull-right">오후 8:53</span>
 												</h4>
 											</div>
 											<p>hello 오랜만입니다. 홍길동입니다.</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="images/icon.png">
 											</a>
 											<div class="media-body">
 												<h4 class="media-heading">이순신
 													<span class="small pull-right">오후 8:53</span>
 												</h4>
 											</div>
 											<p>hello 오랜만입니다. 이순신입니다.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20">
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
	</div>
</body>
</html>