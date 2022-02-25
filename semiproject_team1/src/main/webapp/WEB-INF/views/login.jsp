<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/typicons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/style.css">
  <!-- endinject -->

</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-center py-5 px-4 px-sm-5">
              <div class="brand-logo">
               <img src="${pageContext.request.contextPath}/asset/image/login/bulldogimage.png"></img>
              </div>
              <h3>롤판.DOG</h3>
              <form class="pt-3">
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN IN</a>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      로그인유지하기
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">비밀번호 찾기</a>
                </div>
                
                <button type="button" style="padding: 0; border: none; background: none;" onclick="location.href='main.jsp'"> 
                     <img src="${pageContext.request.contextPath}/asset/image/login/kakao_login.png" alt=""></img>
                </button>
                <div class="text-center mt-4 fw-light">
                  Don't have an account? <a href="register.html" class="text-primary">Create</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="href=${pageContext.request.contextPath}/js/login/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="href=${pageContext.request.contextPath}/js/login/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="href=${pageContext.request.contextPath}/js/login/off-canvas.js"></script>
  <script src="href=${pageContext.request.contextPath}/js/login/hoverable-collapse.js"></script>
  <script src="href=${pageContext.request.contextPath}/js/login/template.js"></script>
  <script src="href=${pageContext.request.contextPath}/js/login/settings.js"></script>
  <script src="href=${pageContext.request.contextPath}/js/login/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
