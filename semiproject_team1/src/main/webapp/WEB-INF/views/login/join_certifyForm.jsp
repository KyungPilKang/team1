<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
    <title>회원가입 인증 - 롤판.DOG</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="join_certify" method="post">
  	<input type="hidden" name="mem_mno" value="${mem_mno }">
   <a href="/main"><img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
			alt="" width="80" height="80"></a>
	<h1 class="h1 mb-3 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>
    <div class="mt-4 mb-4">
      <h5 class="text-white">입력하신 이메일로 인증코드가 발송되었습니다.</h5>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="mem_code" name="mem_code" placeholder="6자리 인증코드">
      <label for="floatingInput">6자리 인증코드</label><br>
    </div>
    <button class="w-100 btn btn-lg btn-secondary" type="submit">인증코드 제출</button>
  </form><br>
  <form action="re_join_certify" method="post">
  	<input type="hidden" name="mem_mno" value="${mem_mno }">
    <button class="w-100 btn btn-lg btn-secondary" type="submit" style="font-size:15px; height:48px;">메일을 받지 못하셨나요? 다시보내기</button>
  </form>
</main>


</body>
<script>
	let sweetalert=(icon,title,contents)=>{
    Swal.fire({
        icon: icon,
        title: title,
        text: contents,
        confirmButtonText: "확인"
    })
	};
	let ok="<c:out value='${ok}'/>";
	if(ok=="no"){
		Swal.fire({
			title: "인증번호 오류",
			text: "다시 입력하시기 바랍니다",
			icon: "error",
			confirmButtonText: "확인"
		})
	}
	let re="<c:out value='${re}'/>";
	if(re=="yes"){
		Swal.fire({
			title: "재발급 성공",
			text: "이메일을 확인하시기 바랍니다",
			icon: "success",
			confirmButtonText: "확인"
		})
	}
</script>
</html>
