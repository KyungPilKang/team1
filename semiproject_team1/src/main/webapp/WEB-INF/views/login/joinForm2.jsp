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
  <div class="col-md-3 grid-margin stretch-card container">
 
    <!-- 롤판.dog 기본 이미지 및 폰트 -->
  
  <form>
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">롤판.DOG</h1>

    <div style="float:left">
      <h5>기본정보입력</h5>
    </div>

    <div style="clear:left;">
      <textarea style="background-color:ivory; resize:none; width: 100%; height: 80px;  font: size 14px;">회원가입을 위해서 이메일 인증이 진행되며, 인증이 완료되기 전까지 회원가입이 완료가 되지 않습니다.</textarea>
    </div>

    <!-- <div class="form-floating" >
      <input type="email" class="form-control" id="floatingInput" placeholder="이메일 주소" style="width:70%; float:left;">
      <label for="floatingInput">이메일 주소</label>
      <button class="btn btn-lg btn-primary" type="submit" style="width:30%; border-color:white; font-size: 11px; color: black; background-color: grey; ">중복체크</button>
    </div>
    
    <div>
    <div class="form-floating" style="max-width:300px; max-height:58px;" >
      <input type="text" class="form-control" id="floatingInput" placeholder="이메일 주소" style="width:70%; float:left;">
      <label for="floatingInput" style="top:25px;">이메일 주소</label>
      <button class="btn btn-lg btn-primary" type="submit" style="width:30%; border-color:white; font-size: 11px; color: black; background-color: grey; ">중복체크</button>
    </div>
  </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword" style="top:45px;">비밀번호</label>
    </div> -->
    
    <!-- 인풋테크 및 버튼 안먹힘 0227 16:57 -->
    <div>
  <!--   <div class="form-floating" style="width:70%; float:left;">
      <input type="email" class="form-control" id="emailinput" placeholder="이메일 주소">
      <label for="emailinput">이메일 주소</label>
    </div>
    <div>
        <div style="width:30%; float:right; padding-top:10px;">
        <button class="btn btn-lg btn-primary" type="submit" style=" width:90%; border-color:white; font-size: 11px; color: black; background-color: grey; ">중복체크</button>
    </div>
    </div>
    
  </div> -->
  
  				  <div class="form-group mb-2">
                    <div class="input-group">
                      <input id="emailinput" type="text" class="form-control" placeholder="이메일 주소를 입력하세요" aria-label="이메일 주소를 입력하세요">
                      &nbsp;&nbsp;
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button">중복 확인</button>
                      </div>
                    </div>
                  </div>
                  <div class="form-group mb-2">
                    <div class="input-group">
                      <input id="nicknameinput" type="text" class="form-control" placeholder="닉네임을 입력하세요" aria-label="닉네임을 입력하세요">
                      &nbsp;&nbsp;
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button">중복 확인</button>
                      </div>
                    </div>
                  </div>
                  <div class="form-group mb-2">
                    <div class="input-group">
                      <input id="passwardinput" type="text" class="form-control" placeholder="비밀번호를 입력하세요" aria-label="비밀번호를 입력하세요">
                    </div>
                  </div>
                  <span id="#" class="form-group mb-2" style="display:none;">
                  </span>

<!--   <div>
    <div class="form-floating" style="width:70%; float:left;">
      <input type="text" class="form-control" id="nicknameinput" placeholder="name@example.com">
      <label for="nicknameinput">닉네임</label>
    </div>
    <div>
        <div style="width:30%; float:right; padding-top:10px;">
        <button class="btn btn-lg btn-primary" type="submit" style=" width:90%; border-color:white; font-size: 11px; color: black; background-color: grey; ">중복체크</button>
    </div>
    </div>
  </div>
  <div>
  <div class="form-floating">
    <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
    <label for="floatingPassword" style="top: 112px;">비밀번호</label>
  </div>
</div> -->

<div style="padding-top: 10px;">
  <div style="width:50%; float:left;">
  <button class="btn btn-lg btn-primary" type="submit" style="border-color:white; float:center; width: 80%; color: black; background-color: grey; ">취소</button>
</div>
<div style="width:50%; float:right;">    
<button class="btn btn-lg btn-primary" type="submit" style="float:center; width: 80%;">가입하기</button>
</div>
</div>  
</div>
  </form>
</div>


    
  </body>
</html>
