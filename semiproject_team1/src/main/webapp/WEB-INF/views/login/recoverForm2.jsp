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
    <title>비밀번호찾기</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form>
      <img class="mb-4" src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png" alt="" width="80" height="80">
    <h1 class="h3 mb-3 fw-normal">롤판.DOG</h1>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="로그인 이메일을 입력하세요">
      <label for="floatingInput">로그인 이메일을 입력하세요</label><br>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">인증코드 발송</button>
    <p></p>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호 확인</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">비밀번호 변경</button>
  </form>
</main>


    
  </body>
</html>
