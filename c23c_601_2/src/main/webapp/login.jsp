<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="styleSheet" href="./css/join.css?ver=1.3">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>로그인</title>
<link href="./css/frontpage.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
	.temp {
		width:250px;
		margin: 0 auto;
	}
	
	.loginID{
		margin-left : 10px;
		margin: 0 auto;
		text-align: left;
		margin-bottom: 20px;
	}
	
	.loginID label {
		font-weight: bold;
	}
	
	#id #pw{
		
	}
	
	.everylogin{
	margin: 0 auto;
	text-align: center;
	width: 460px;
	
	}
	
	.login{
	background-color: white;
	padding-top:15px;
	
	}
	.btndiv{
		padding-bottom: 20px;
	}
	.box{
		width: 100%;
		height: 40px;
		background:#F2F2F2;
	}
	
	#loginbtn{
		width:100%;
	}
	.joindiv a {
 	 text-decoration-line: none;
	}
	
	.joindiv a:link {
 	 color : #2E64FE;
	}
	.joindiv a:visited {
	  color : #2E64FE;
	}
	.joindiv a:active {
	  color : #2E64FE
	}
	
	.id-alert{
		margin-bottom: 10px;
		font-weight: bold;
		color:red;
		font-size:15px;
		/* 가운데정렬 */
		display: flex;
		justify-content: center;		
		align-items: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('.id-alert').hide();
		
		var key = getCookie("idChk"); //user1
		if(key!=""){
			$("#id").val(key); 
		}
		 
		if($("#id").val() != ""){ 
			$("#idSaveCheck").attr("checked", true); 
		}
		
		
		
		
		$("#join").click(function(){
			window.location.replace("./join");
		})
		
		$("#loginbtn").click(function(){
			if($("#idSaveCheck").is(":checked")){ 
				setCookie("idChk", $("#id").val(), 7); 
			}else{ 
				deleteCookie("idChk");
			}
			
			
			let id = $('#id').val();
			let pw = $('#pw').val();
			
			if(id.length ==0){
				
				$('.id-alert').show();
				$('.id-alert').html("<div>아이디를 입력해주세요.</div>");
				
				
			}else if(pw.length ==0){

				$('.id-alert').show();
				$('.id-alert').html("<div>비밀번호를 입력해주세요.</div>");
				
			} else {
				$.ajax({
					url:'/login',
					type:'post',
					dataType:'text',
					data:{'id':id,'pw':pw},
					success:function(result){
						if(result==1){
							$('.id-alert').hide();
							window.location.replace("./frontpage");
						} else{
							$('.id-alert').show();
							$('.id-alert').html("<div>아이디 또는 비밀번호를 잘못 입력했습니다.</div>");
						}
					},
					error:function(result){
						alert("실패");
					}
					
				});
			}
			
			
			
		})
		
	});
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
		 
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	
</script>
</head>
<body>
	<div class="main">
	<div>
		<%@ include file="header.jsp" %>
		<%@ include file="nav.jsp" %>
	</div>
		<div class="mainStyle">
			<div class="everylogin">
				<div class="login shadow-lg bg-body rounded">
					<div class="loginform">
					<div style="margin-bottom:20px"><h2 style ="font-weight:bold;margin: 5px 0px 20px 0px">로그인</h2></div>
						<div class="temp mb-3">
							<div class="loginID">
								<hr>
								<input type="text" class="form-control mb-3" placeholder="아이디" id="id">
								
								<input type="password" class="form-control mb-3" placeholder="비밀번호" id="pw">
								<input type="checkbox" id="idSaveCheck">
								<label for="idSaveCheck">아이디 저장</label>
							</div>
							<div class="id-alert box rounded mt-3">
								<p class="alert idbox"></p>
							</div>
						<div class="btndiv">
							<button type="button" class="btn btn-primary" id="loginbtn" >로그인</button>					
						</div>
						
						
						
						</div>
					</div>
				
				</div>
				<div class="joindiv">
					<p>처음이세요? <a href="./join" style="font-weight:bold;">회원가입</a></p>		
				</div>
			</div>
		</div>
		
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>


</body>
</html>