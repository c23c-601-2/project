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
<script type="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="js/bootstrap.js"></script>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>