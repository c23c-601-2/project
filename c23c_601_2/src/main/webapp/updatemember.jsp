<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="styleSheet" href="./css/join.css?ver=1.1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>개인 정보 수정</title>
<link rel="styleSheet" href="./css/join.css?ver=1.3">
<link href="./css/frontpage.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

	.address{
		display: flex;
  		align-items: center;
  		gap: 0.5rem;
	}
	.joinID{
		width :300px;
		display: inline-block;
	}
	.joinform{
		padding : 5px 30px;
		text-align:left;
	}
	
	#joinName{
		margin-left:20px;
	}
	
	.idName{
		margin-bottom: 10px;
		display:inline-block;
		width:100%
	}
	
	.last{
		width:100%
	}
	
	#Complete, #joinBack{
		width:100%;
	}
	
	#address{
		margin-bottom: 5px;
	}
	
	.box{
		width: 100%;
		height: 40px;
		background:#F2F2F2;
	}
	
	.box p {
		font-weight: bold;
		color:red;
		padding:5px 0px 0px 5px;
	}
	.pw-alert .email-alert .phone-alert{
		width: 626px;
	}
	.mpwdiv input{
		width:100%;
	}
	.updatemainStyle{
		width:100%;
		height:100vh;
		background-color: #F2F2F2;
		
		/* 가운데정렬 */
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>


<!-- 수정 -->
<script type="text/javascript">

$(function(){
	
	$('#joinBack').click(function(){
		 history.back();
	})
	
	let flag = new Array();

	flag[0] = false;
	flag[1] = false;
	flag[2] = false;
	
	
	$('#address').click(function(){
		selectAddress();
	});
	$('.id-alert, .pw-alert, .name-alert, .email-alert, .phone-alert, .pw-alert1').hide();
		
	//기존 비밀번호
	$('#mpw').blur(function() {
		let pw = $('#mpw').val();
		let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
		
		if(!reg.test(pw)){
			$('.pw-alert1').show();
			$('.pw-alert1').html('<p class="alert">영문, 숫자, 특수문자 포함 8자리 이상을 입력해 주세요.</p>');
			$('#mpw').focus();
			return false;
		} else {
			$('.pw-alert1').hide();
			flag[0] = true;
			ableBtn(flag);
		}
    });
	
	//pw1 focus가 벗어났을경우
	$('#newpw1').blur(function() {
		let pw1 = $('#newpw1').val();
		let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
		
		if(!reg.test(pw1)){
			$('.pw-alert').show();
			$('.pw-alert').html('<p class="alert">영문, 숫자, 특수문자 포함 8자리 이상을 입력해 주세요.</p>');
			$('#newpw1').focus();
			return false;
		} else {
			$('.pw-alert').hide();
			flag[1] = true;
			ableBtn(flag);
		}
    });
	
	//pw2 focus가 벗어났을경우
	$('#newpw2').blur(function() {
		let pw2 = $('#newpw2').val();
		
		if(pw2.length == 0){
			$('.pw-alert').show();
			$('.pw-alert').html('<p class="alert">영문, 숫자, 특수문자 포함 8자리 이상을 입력해 주세요.</p>');
			$('#newpw2').focus();
			return false;
		} else {
			$('.pw-alert').hide();
			flag[2] = true;
			ableBtn(flag);
		}
    });
	
	//pw2 focus가 벗어났을경우
	$('#mphone').blur(function() {
		let phone = $('#mphone').val();
		 const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
		 
		if(!expHpText.test(phone)){
			$('.phone-alert').show();
			$('#mphone').focus();
			return false;
		} else {
			$('.phone-alert').hide();
		}
    });
	
	//pw2 focus가 벗어났을경우
	$('#memail').blur(function() {
		let email = $('#memail').val();
		const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;
		  
		if(!expEmailText.test(email)){
			$('.email-alert').show();
			$('#memail').focus();
			return false;
		} else {
			$('.email-alert').hide();
		}
    });
	
	
	$('#Complete').click(function(){
		let mid = $('#mid').val();
		let mpw = $('#mpw').val();
		let newpw1 = $('#newpw1').val();
		let newpw2 = $('#newpw2').val();
		
		
			$.ajax({
				url:'./pwCheck',
				type:'post',
				dataType:'text',
				data:{'mpw':mpw,'mid':mid},
				success:function(result){
					if(result ==0){
						/* 
							<div class="box rounded mb-3">
								<p class="alert">필수 값을 입력해주세요.</p>
							</div> */
						$('.pw-alert1').show();
						$('.pw-alert1').html("<p class='alert'>기존 비밀번호랑 다릅니다.</p>");
						$('#Complete').attr("disabled","disabled");
						$('#mpw').focus();
						
						return false;
						
					}else{
						
						if(newpw1 != newpw2){
							$('.pw-alert').show();
							$('.pw-alert').html("<p class='alert'>새 비밀번호가 서로 다릅니다.</p>");
							$('#Complete').attr("disabled","disabled");
							$('#newpw1').focus();
						}else{
							//postCode" selectAddr detailAddr
							let join = {
								'id': $('#mid').val(),
								'pw': $('#newpw1').val(),
								'name': $('#mname').val(),
								'email' : $('#memail').val(),
								'phone' : $('#mphone').val(),
								'postCode' : $('#postCode').val(),
								'selectAddr' :$('#selectAddr').val(),
								'detailAddr' : $('#detailAddr').val()
							}
							
							
							$.ajax({
								url:'./cancel',
								type:'post',
								data:join,
								success:function(){
									window.location.replace("./mypage");
								},
								error:function(){
									alert("실패");
								}
							});
						}
					}
					
				},
				error:function(){
					alert("실패");
				}
			});
		
		
	});
	
	
	
})

function ableBtn(flag){
	if(flag[0]== true && flag[1]== true && flag[2]== true){
		$('#Complete').removeAttr('disabled');
		/* 
							<div class="resultbox box rounded mb-3">
								<p class="alert">필수 값을 입력해주세요.</p>
							</div> */
		$('.resultbox').hide();
	} else {
		$('#Complete').attr('disabled','disabled');
	}
}


//주소창 팝업
function selectAddress() {
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("selectAddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddr").focus();
        }
    }).open();
}

</script>

</head>
<body>
	<div class="main">
				<div>
					<%@ include file="header.jsp" %>
					<%@ include file="nav.jsp" %>
				</div>
		<div class="updatemainStyle">
				<div class="join shadow-lg bg-body rounded">
					<div class="joinform">
					<div style="margin-bottom:20px"><h2 style ="font-weight:bold;float:left;margin: 5px 0px 20px 0px">개인 정보 수정</h2></div>
						<div class="idName">
							<div class="joinID">
								<label>아이디</label>
								<input value="${dto.mid }" disabled="disabled" type="text" class="form-control" placeholder="아이디" id="mid">
							</div>
							<div class="joinID joinName">
								<label>이름</label>
								<input value="${dto.mname }" disabled="disabled" type="text" class="form-control" placeholder="이름" id="mname">
							</div>
							<div class="id-alert box rounded mt-3">
								<p class="alert idbox"></p>
							</div>
						</div>
						
						<div class="idName">
							<div class="mpwdiv">
								<label><font color="blue" style="font-weight:bold">*</font>기존 비밀번호</label>
								<input type="password" class="form-control" placeholder="비밀번호" id="mpw">
							</div>
						</div>
						<div class="pw-alert1 box rounded mb-3">
						</div>
						
						<div class="idName">
							<div class="joinID">
								<label><font color="blue" style="font-weight:bold">*</font>새 비밀번호</label>
								<input type="password" class="form-control" placeholder="비밀번호" id="newpw1">
							</div>
							<div class="joinID joinName">
								<label><font color="blue" style="font-weight:bold">*</font>새 비밀번호 확인</label>
								<input type="password" class="form-control" placeholder="확인" id="newpw2">
							</div>
						</div>
						<div class="pw-alert box rounded mb-3">
						</div>
						<div class="last">
							<div class = "mb-3">
							<label>이메일</label>
							  <input value="${dto.memail }" type="text" class="form-control mb-2" placeholder="c23c@example.com"  id="memail" >
							  <div class="email-alert box rounded mb-3">
								<p class="alert">올바른 이메일을 입력해주세요.</p>
							  </div>	
							</div>
							
							<div class = "mb-3">
							  <label>휴대폰 번호</label>
							  <input value="${dto.mphone }" type="text" class="form-control mb-2" id="mphone" placeholder="010-XXXX-XXXX" >
							  <div class="phone-alert box rounded mb-3">
								<p class="alert">올바른 전화번호를 입력해주세요.</p>
							  </div>	
							</div>
							
							<div class = "mb-3">
							  <div class="address">							  
							  	<label>우편번호</label>
								<button class="btn btn-outline-primary btn-sm" id="address">찾기</button><br>
							  </div>							  
							  <input value="${dto.postcode }" type="text" class="form-control" id="postCode" disabled="disabled">
							</div>
							
							<div class = "mb-3">
								  <label>주소</label>
							  <input value="${dto.selectaddr }" type="text" class="form-control" disabled="disabled" id="selectAddr">
							</div>
							  
							<div class = "mb-3">
							  <label>상세 주소</label>
							  <input value="${dto.detailaddr }" type="text" class="form-control" placeholder="상세주소" id="detailAddr">
							</div>
							<div class="resultbox box rounded mb-3">
								<p class="alert">필수 값을 입력해주세요.</p>
							</div>
							
							
							<button type="button" class="btn btn-primary mb-3" id="Complete" disabled="disabled">확인</button>
							<br>
						</div>
					</div>
				</div>
		</div>
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>


</body>
</html>