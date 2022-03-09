<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/typicons/typicons.css">
  <link rel="stylesheet" href="../../vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />

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







  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->

</body>
</html>