<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="styleSheet" href="./css/mypage.css?ver=1.3">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
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
	
	$('#checkbtn').click(function(){
		let id = $('#id').val();
		let pw = $('#pw').val();
		
		if(pw.length ==0){

			$('.id-alert').show();
			$('.id-alert').html("<div>비밀번호를 입력해주세요.</div>");
			
		} else {
			$.ajax({
				url:'/cancelCheck',
				type:'post',
				dataType:'text',
				data:{'id':id,'pw':pw},
				success:function(result){
					if(result==1){
						$('.id-alert').hide();
						window.location.replace("./cancel");
					} else{
						$('.id-alert').show();
						$('.id-alert').html("<div>비밀번호를 잘못 입력했습니다.</div>");
					}
				},
				error:function(result){
					alert("실패");
				}
				
			});
		}
	});
})

</script>
<body>
	<div class="main">
		<div class="mainStyle">
			<article>
			<div class="everylogin">
				<div class="login shadow-lg bg-body rounded">
					<div class="loginform">
					<div style="margin-bottom:20px"><h2 style ="font-weight:bold;margin: 5px 0px 20px 0px">개인 정보 수정</h2></div>
						<div class="temp mb-3">
							<div class="loginID">
								<hr>
								<input type="text" class="form-control mb-3" disabled="disabled" value ="${sessionScope.mid }" id="id">
								
								<input type="password" class="form-control mb-3" placeholder="비밀번호" id="pw">
								
								
							</div>
							<div class="id-alert box rounded mt-3">
								<p class="alert idbox"></p>
							</div>
						<div class="btndiv">
							<button type="button" class="btn btn-primary" id="checkbtn" >확인</button>					
						</div>
						</div>
					</div>
				
				</div>
			</div>
			</article>
		</div>
	</div>
</body>
</html>