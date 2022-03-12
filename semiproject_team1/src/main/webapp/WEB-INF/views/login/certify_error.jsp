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
    <div>
      <h4>이메일 인증오류</h4>
    </div>
    <textarea style="background-color:ivory; resize:none; width: 100%; height: 80px;  font: size 14px;">인증이 정상적으로 완료되지 않았습니다.인증코드를 재발급 받아 인증을 다시 시도하시기 바랍니다.</textarea>
    <p></p>
    <button class="w-100 btn btn-lg btn-primary" type="submit">인증코드 재발급 받기</button>
    <p></p>
    <button class="w-100 btn btn-lg btn-primary" type="submit">메인으로 가기</button>
    
  </form>
</main>


    
  </body>
</html>
