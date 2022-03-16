<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>로그인 - 롤판.DOG</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/signin.css">
	
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="text-center">
<div class="container">

	<main class="form-signin">

		<a href="/main"><img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
			alt="" width="80" height="80"></a>
		<h1 class="h1 mb-3 fw-normal">LOLPAN.DOG</h1>
		<form id="form" action="login" method="post">
			<div class="form-floating">
				<input type="email" class="form-control" id="mem_email_id" name="mem_email_id"
					placeholder="이메일 주소"> <label for="mem_email_id">이메일
					주소</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="mem_pw" name="mem_pw"
					placeholder="비밀번호"> <label for="mem_pw">비밀번호</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		
		<div class="my-2 d-flex justify-content-between align-items-center">
			<div class="form-check">
				<label class="form-check-label text-muted"> <input
					type="checkbox" id="remember-me" name="remember-me" class="form-check-input"> 로그인 상태 유지하기
				</label>
			</div>
			<a href="recoverForm1" class="auth-link text-black">비밀번호 찾기</a>
		</div>
</form>
		<!-- 카카오 로그인 구현부분  -->
		<a href="javascript:kakaoLogin();">
		<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"/></a>
	<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
	<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
	<div id="result"></div>
	
		<div class="text-center mt-4 fw-light">
			롤판.DOG에 처음이세요? <a href="/joinForm1" class="text-primary">회원가입</a>
		</div>
	</main>
	<script>
	/* 로그인 유효성 검사 */
$(function (){
	form.onsubmit = function (){
		let email = $('#mem_email_id').val();
		let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email==''){
			alert("이메일을 입력하세요");
			$('#mem_email_id').focus();
      return false;
		} else if (emailVal.match(regExp) == null){
			alert('이메일 형식이 올바르지 않습니다.');
			$('#email').focus();
			return false;
		}
		 let password = $('#mem_pw').val();
	        if(password=='') {
	        	alert("비밀번호를 입력하세요.");
	        	$('#mem_pw').focus();
	        	return false;
	}
	}
});
</script>

 <script>
window.Kakao.init('00263ffa1f8a32229866207737b5f29d');

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname, account_email',
		success: function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
			success:res =>{
				const kakao_account = res.kakao_account;
				console.log(kakao_account);
			}
		});
	}
}
}

<script type="text/javascript">
Kakao.init('00263ffa1f8a32229866207737b5f29d');
console.log(Kakao.isInitialized());
 
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          $('#result').append(kakao_account);
          resultdiv="<h2>로그인 성공 !!"
          resultdiv += '<h4>id: '+id+'<h4>'
          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
          email ="";
          gender = "";
          nickname = "";
          if(typeof kakao_account != 'undefined'){
        	  email = kakao_account.email;
        	  gender = kakao_account.gender;
          }
          resultdiv += '<h4>email: '+email+'<h4>'
          resultdiv += '<h4>gender: '+gender+'<h4>'
          
          $('#result').append(resultdiv);
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
<script type="text/javascript">
  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
    })
  }
</script>
 

</div>
</body>
</html>
