<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duodetailForm</title>

<!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/typicons/typicons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/select2/select2.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/image/duo/favicon.png" />

</head>
<body>

 <div class="container-scroller">
    <div class="col-md-6 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">

          <form class="forms-sample">

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">닉네임</label>
              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="닉네임">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">롤 아이디</label>
              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="롤 아이디">
              </div>
            </div>

            <!-- <div class="form-group row"> -->
            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="positionSelect" class="col-sm-3 col-form-label">포지션(주/서브)</label>


              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="주 포지션">
              </div>

              <div class="col-md-3 mx-1">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="서브 포지션">
              </div>

              <!-- 위 두개의 입력창에 따라  한칸 넚이 수정 예정 -->

            </div>
            <!-- </div>
                    </div> -->

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">티어</label>
              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="티어">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">승률</label>
              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="승률">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectChamp" class="col-sm-3 col-form-label">선호 챔피언</label>

      

              <div class="col-md-2">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="챔피언1">
              </div>

              <div class="col-md-2 mx-1">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="챔피언2">
              </div>

              <div class="col-md-2">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="챔피언3">
              </div>

              <div class="col-md-2 mx-1">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="챔피언4">
              </div>

            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectMic" class="col-sm-3 col-form-label">마이크 가능 여부</label>

              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="optionsRadios" id="selectMic" value="">
                </label>
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectAllChamp" class="col-sm-3 col-form-label">올챔 여부</label>

              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="optionsRadios" id="selectAllChamp" value="">
                  
                </label>
              </div>
            </div>

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectPlayStyle" class="col-sm-3 col-form-label">플레이 방식</label>
              <div class="col-md-3">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="플레이 방식">
              </div>
            </div>


            <div class="form-group">
              <label for="textarea" class="col-sm-3 col-form-label">소개글</label>
              <textarea class="form-control h-25" id="textarea" rows="7"></textarea>
            </div>

           
            <br />
            <button type="submit" class="btn btn-primary me-2">돌아가기</button>

          </form>
        </div>
      </div>
    </div>
  </div>
 
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/typeahead.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/select2/select2.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/template.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/settings.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/js/duo/file-upload.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/typeahead.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/select2.js"></script>
  <!-- End custom js for this page-->

</body>
</html>