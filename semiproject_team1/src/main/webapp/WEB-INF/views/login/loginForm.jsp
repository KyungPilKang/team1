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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
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
	
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="text-center">
<div class="container">

	<main class="form-signin">

		<a href="/main"><img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
			alt="" width="80" height="80"></a>
		<h1 class="h1 mb-3 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>
		<form id="loginForm">
			<input type="hidden" name="page" value="${page }">
			<div class="form-floating">
				<input type="email" class="form-control" id="mem_email_id" name="mem_email_id"
					placeholder="이메일 주소"> <label class="text-bold" for="mem_email_id">이메일
					주소</label>
			</div>
			<div class="form-floating mt-2">
				<input type="password" class="form-control" id="mem_pw" name="mem_pw"
					placeholder="비밀번호"> <label for="mem_pw">비밀번호</label>
			</div>
			<button class="w-100 btn btn-lg btn-secondary" id="next" type="submit">로그인</button>
		
		<div class="text-center mt-2 fw-light text-white">
			<div class="form-check">
			</div>
			
			<!-- <a href="recoverForm1" class="auth-link text-white">비밀번호 찾기</a> -->
		</div>
</form>
		<!-- 카카오 로그인 구현부분  -->
		<div class="mt-4">
		<!-- <a id="kakao-login-btn"></a> -->
		</div>
		<a href="javascript:kakaoLogin();">
		<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"/></a>
	<!-- <button class="w-7 btn btn-secondary" onclick="unlinkApp()">앱 탈퇴하기</button>
	<button class="w-7 btn btn-secondary" onclick="kakaoLogout()">로그아웃</button> -->
	<div id="result"></div>
		<div class="text-center mt-4 fw-light text-white">
			롤판.DOG에 처음이세요?&nbsp;&nbsp;&nbsp;<a href="/joinForm" class="text-white">회원가입</a>
		</div>
	</main>

<script>
	/* 로그인 유효성 검사 */
	let sweetalert=(icon,title,contents)=>{
        Swal.fire({
            icon: icon,
            title: title,
            text: contents,
            confirmButtonText: "확인"
        })
    };
	$('#next').click(function(){
		var email = $('#mem_email_id').val();
		if (email==''){
				Swal.fire({
					title: "입력 오류",
					text: "이메일을 입력하세요",
					icon: "error",
					confirmButtonText: "확인"
				})
				return false
		}else{
			let password = $('#mem_pw').val();
       		if(password=='') {
	        	Swal.fire({
					title: "입력 오류",
					text: "비밀번호를 입력하세요",
					icon: "error",
					confirmButtonText: "확인"
				})
				return false
        	}
        }
	});

	$('#loginForm').submit(function(){
        function objectifyForm(formArray){		
        	var returnArray={};
        	for(var i=0;i<formArray.length;i++){
        		returnArray[formArray[i]['name']]=formArray[i]['value'];
        	}
        	return returnArray;
        }
        let formdata=objectifyForm($("#loginForm").serializeArray());
        console.log(formdata);
        $.ajax({
			type:"POST",
			async:true,
			url:"http://localhost:8090/login",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(formdata),
			success: function(data, textStatus){
				if(data.mem.mem_code_confirm=="no"){
					Swal.fire({
						title: "미인증 계정",
						text: "인증페이지로 이동합니다",
						icon: "warning",
						confirmButtonText: "확인"
					}).then((result)=>{
						if(result){
	        				window.location.href="/join_certifyForm?mem_mno="+data.mem.mem_mno;
						}
					})
				} else{
					Swal.fire({
						title: "로그인 성공",
						text: data.mem.mem_nickname+"님 환영합니다",
						icon: "success",
						confirmButtonText: "확인"
					}).then((result)=>{
						if(result){
							console.log(data.mem);
							if(data.mem.page=="main"){
		        				window.location.href="/main";
							} else if(data.mem.page=="board"){
								window.location.href="/boardlist";
							} else if(data.mem.page=="admin"){
								window.location.href="/main_admin";
							} else {
								window.location.href="/feedback";
							}
						}
					})
				}
			},
			error: function(data, textStatus){
				Swal.fire({
					title: "로그인 실패",
					text: data.responseText,
					icon: "error",
					confirmButtonText: "확인"
				})
			},
			complete: function(data, textStatus){
			}
		});
        return false;
	})
</script>

<script>
let data_page="<c:out value='${page}'/>";
window.Kakao.init('00263ffa1f8a32229866207737b5f29d');

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname, account_email',
		success: function(authObj){
			window.Kakao.API.request({
				url:'/v2/user/me',
			success:res =>{
				let kakao_account = res.kakao_account;
				console.log("성공");
				console.log(kakao_account.email);
				console.log(typeof kakao_account.email);
				let jsonData={
						"mem_email_id":kakao_account.email,
						"page":data_page
				};
				console.log(jsonData);
				window.location.href="/kakao_login?mem_email_id="+kakao_account.email+"&page="+data_page;
				/*  $.ajax({
						type:"POST",
						async:true,
						url:"http://localhost:8090/kakao_login",
						contentType:"application/json; charset=utf-8",
						data:{"key":JSON.stringify(jsonData)}, //테스트 해보기
						success: function(data, textStatus){
							if(data.mem.mem_code_confirm=="no"){
								Swal.fire({
									title: "미인증 계정",
									text: "인증페이지로 이동합니다",
									icon: "warning",
									confirmButtonText: "확인"
								}).then((result)=>{
									if(result){
				        				window.location.href="/join_certifyForm?mem_mno="+data.mem.mem_mno;
									}
								})
							} else{
								Swal.fire({
									title: "로그인 성공",
									text: data.mem.mem_nickname+"님 환영합니다",
									icon: "success",
									confirmButtonText: "확인"
								}).then((result)=>{
									if(result){
										console.log(data.mem);
										if(data.mem.page=="main"){
					        				window.location.href="/main";
										} else if(data.mem.page=="board"){
											window.location.href="/boardlist";
										} else if(data.mem.page=="admin"){
											window.location.href="/main_admin";
										}
									}
								})
							}
						},
						error: function(data, textStatus){
							Swal.fire({
								title: "로그인 실패",
								text: data.responseText,
								icon: "error",
								confirmButtonText: "확인"
							})
						},
					}); */
				 return false;
			}
		});
		}
	})
}
</script>
<!-- <script type="text/javascript">
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
  }) -->
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
