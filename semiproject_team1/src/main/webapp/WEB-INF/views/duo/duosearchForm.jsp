<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duosearchForm</title>

<!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/typicons/typicons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/image/duo/favicon.png" />

</head>
<body>

 <div class="modal fade" id="myModal" role="dialog">
    <!-- 사용자 지정 부분① : id명 -->

    <div class="modal-dialog">

      <!-- Modal content-->

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">×</button>

          <h4 class="modal-title">모달 창 타이틀</h4> <!-- 사용자 지정 부분② : 타이틀 -->

        </div>

        <div class="modal-body">

          <p>여기에 필요한 텍스트 메시지 넣기</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->

        </div>

        <div class="modal-footer">

          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

        </div>
      </div>
    </div>
  </div>

  <div class="content-wrapper">
    <div class="row">

      <div class="card">
        <div class="row">

          <div class="col-md-6">
            <div class="card-body">
              <!-- 위 클래스가 없으면 버튼 전체 완전 왼쪽 위로 이동 -->

              <div class="btn-group-vertical">
                <!-- 위 클래스가 없으면 버튼 사이 간격 이 변함 -->
                &nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#myModal"
                  class="btn btn-primary col-sm-7">포지션으로 등록</button>
                <br />
                <!-- 위 테그가 있으면 줄 바꿈이 됨 -->
                <button type="button" class="btn btn-primary col-sm-7">옵션별 상세 매칭</button>
                <!-- 클래스에 col-sm-7을 추가하면 옆으로 늘어난다. -->

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/resources/js/duo/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/template.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/settings.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/todolist.js"></script>
  <!-- endinject -->

</body>
</html>