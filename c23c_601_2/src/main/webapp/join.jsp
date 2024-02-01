<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="styleSheet" href="./css/join.css?ver=1.1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>회원 가입</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
	
	#joinComplete, #joinBack{
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
	.pw-alert{
		width: 626px;
	}
</style>

<script type="text/javascript">

$(function(){
	/*  */
	
	$('#address').click(function(){
		selectAddress();
	});
	$('.id-alert, .pw-alert, .name-alert, .idbox, .namebox').hide();
	
	//id focus가 벗어났을경우
	$('#mid').blur(function() {
		let id = $('#mid').val();
		
		if(id.length == 0){
			$('.id-alert,.idbox').show();
			$('#mid').focus();
			return false;
		} else {
			flag[0] = true;
			$('.id-alert').hide();
		}
    });
	
	//id focus가 벗어났을경우
	$('#mname').blur(function() {
		let name = $('#mname').val();
		
		if(name.length == 0){
			$('.id-alert,.namebox').show();
			$('#mname').focus();
			return false;
		} else {
			flag[1] = true;
			$('.id-alert').hide();
		}
    });
	
	//id focus가 벗어났을경우
	$('#mpw1').blur(function() {
		let pw1 = $('#mpw1').val();
		
		if(pw1.length == 0){
			$('.pw-alert').show();
			$('#mpw1').focus();
			return false;
		} else {
			flag[2] = true;
			$('.pw-alert').hide();
		}
    });
	
	//id focus가 벗어났을경우
	$('#mpw2').blur(function() {
		let pw2 = $('#mpw2').val();
		
		if(pw2.length == 0){
			$('.pw-alert').show();
			$('#mpw2').focus();
			return false;
		} else {
			flag[3] = true;
			$('.pw-alert').hide();
		}
    });
	
	if(flag[0]== true && flag[1]== true && flag[2]== true && flag[3]== true ){
		$('#joinComplete').removeAttr('disabled');
	} else {
		$('#joinComplete').attr('disabled','disabled');
	}
	
	$('#joinComplete').click(function(){
		let id = $('#mid').val();
		let pw1 = $('#mpw1').val();
		let pw2 = $('#mpw2').val();
		let name = $('#mname').val();
		
		if(id.length == 0){
			$('.id-alert').show();
			$('#mid').focus();
			return false;
		} else {
			$('.id-alert').hide();
		}
		
		if(pw1.length < 8){
			$('.pw-alert').show();
			$('#mpw1').focus();
			return false;
		} else {
			$('.pw-alert').hide();
		}
		
		
		if(pw2.length == 0){
			$('.id-alert').show();
		}
		if(name.length == 0){
			$('.id-alert').show();
		}
		
		//postCode" selectAddr detailAddr
		let join = {
			'id': $('#mid').val(),
			'pw': $('#mpw1').val(),
			'name': $('#mname').val(),
			'email' : $('#memail').val(),
			'phone' : $('#mphone').val(),
			'postCode' : $('#postCode').val(),
			'selectAddr' :$('#selectAddr').val(),
			'detailAddr' : $('#detailAddr').val()
		}
		
		
		$.ajax({
			url:'./join',
			type:'post',
			data:join,
			success:function(){
				alert("성공");
			},
			error:function(){
				alert("실패");
			}
		});
	});
	
	
	
})

//체크
function check(){
	let id = $('#mid').val();
	const regExp = /^[a-z0-9]{5,15}$/;
	
	if(id.length <= 5 || !regExp.test(id)){
		$('#mid').val("");
		$('#mid').html('<input type="text" class="form-control" placeholder="아이디는 영문자 5글자 이상이고 특수문자가 없어야합니다." id="mid">');
		
	} else{
		alert("hi");
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
		<div class="mainStyle">
			<article>
				<div class="join shadow-lg bg-body rounded">
					<div class="joinform">
					<div style="margin-bottom:20px"><h2 style ="font-weight:bold;float:left;margin: 5px 0px 20px 0px">회원가입</h2></div>
						<div class="idName">
							<div class="joinID">
								<label><font color="blue" style="font-weight:bold">*</font>아이디</label>
								<input type="text" class="form-control" placeholder="아이디" id="mid">
							</div>
							<div class="joinID joinName">
								<label><font color="blue" style="font-weight:bold">*</font>이름</label>
								<input type="text" class="form-control" placeholder="이름" id="mname">
							</div>
							<div class="id-alert box rounded mt-3">
								<p class="alert idbox">올바른 아이디를 입력해주세요</p>
								<p class="alert namebox">올바른 이름을 입력해주세요</p>
							</div>
						</div>
						
						<div class="idName">
							<div class="joinID">
								<label><font color="blue" style="font-weight:bold">*</font>비밀번호</label>
								<input type="password" class="form-control" placeholder="비밀번호" id="mpw1">
							</div>
							<div class="joinID joinName">
								<label><font color="blue" style="font-weight:bold">*</font>비밀번호 확인</label>
								<input type="password" class="form-control" placeholder="확인" id="mpw2">
							</div>
						</div>
						<div class="pw-alert box rounded mb-3">
							<p class="alert">올바른 비밀번호를 입력해주세요</p>
						</div>
						<div class="last">
							<div class = "mb-3">
							<label>이메일</label>
							  <input type="text" class="form-control" placeholder="c23c@example.com"  id="memail" >
							</div>
							
							<div class = "mb-3">
							  <label>휴대폰 번호</label>
							  <input type="text" class="form-control" id="mphone">
							</div>
							
							<div class = "mb-3">
							  <div class="address">							  
							  	<label>우편번호</label>
								<button class="btn btn-outline-primary btn-sm" id="address">찾기</button><br>
							  </div>							  
							  <input type="text" class="form-control" id="postCode" disabled="disabled">
							</div>
							
							<div class = "mb-3">
								  <label>주소</label>
							  <input type="text" class="form-control" disabled="disabled" id="selectAddr">
							</div>
							  
							<div class = "mb-3">
							  <label>상세 주소</label>
							  <input type="text" class="form-control" placeholder="상세주소" id="detailAddr">
							</div>
							<div class="box rounded mb-3">
								<p class="alert">필수 값을 입력해주세요.</p>
							</div>
							
							
							<button type="button" class="btn btn-primary mb-3" id="joinComplete" disabled="disabled">가입 완료</button>
							<br>
							<button type="button" class="btn btn-primary mb-4" id="joinBack">뒤로 가기</button>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>


</body>
</html>