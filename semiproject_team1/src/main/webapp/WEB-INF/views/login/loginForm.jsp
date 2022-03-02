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
    <title>Signin Template · Bootstrap v5.1</title>

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
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">롤판.DOG</h1>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="이메일 주소">
      <label for="floatingInput">이메일 주소</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
    <div class="my-2 d-flex justify-content-between align-items-center">
      <div class="form-check">
        <label class="form-check-label text-muted">
          <input type="checkbox" class="form-check-input">
          로그인 상태 유지하기
        </label>
      </div>
      <a href="#" class="auth-link text-black">비밀번호 찾기</a>
    </div>

        <!-- 카카오 로그인 구현부분  -->
    <button type="button" style>
      <img src="${pageContext.request.contextPath}/asset/image/login/kakao.png" style="width:100%"></img>  
    </button>
    <div class="text-center mt-4 fw-light">
      롤판.DOG에 처음이세요? <a href="" class="text-primary">회원가입</a>
    </div>
  </form>
</main>


    
  </body>
</html>
