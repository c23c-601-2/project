<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="styleSheet" href="./css/join.css?ver=1.2">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>회원 가입</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<div class="main">
		<div class="mainStyle">
			<article>
				<div class="join">
					<div id="naver_id_login"></div>
				</div>
			</article>
		</div>
	</div>
	 <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("I6b1zRQviqPtKElQ2E9q", "http://localhost");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 3,40);
	  	naver_id_login.setDomain("http://localhost");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	  	
	    // 접근 토큰 값 출력
	    // alert(naver_id_login.oauthParams.access_token);
	    // 네이버 사용자 프로필 조회
	    naver_id_login.get_naver_userprofile("naverSignInCallback()");
	    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	    function naverSignInCallback() {

	    }
	    
	  	
	  	
  </script>
</body>
</html>