<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/typicons/typicons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/duo/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/image/duo/favicon.png" />

</head>
<body>

<div class="container-scroller">
    <div class="col-lg-4 d-flex flex-column">
      <div class="row flex-grow">
        <div class="col-12 grid-margin stretch-card">
          <div class="card card-rounded">
            <div class="card-body">
              <div class="row">
                <div class="col-lg-12">
                  <div>
                    <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                      <p class="text-success">25%</p>
                    </div>
                    <div class="progress progress-md">
                      <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="70"
                        aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>

                  <br />
                  <br />

                  <div class="d-flex justify-content-center align-items-center">
                    <h4 class="card-title card-title-dash">원하는 포지션을 선택하세요</h4>
                  </div>

                  <br />
                  <br />

                  <div class="list-wrapper">
                    <ul class="todo-list todo-list-rounded">

                      <li class="d-block">
                        <div class="form-check w-100">
                          <label class="">
                            <input class="checkbox" type="checkbox"> 탑
                          </label>
                        </div>
                      </li>

                      <li class="d-block">
                        <div class="form-check w-100">
                          <label class="">
                            <input class="checkbox" type="checkbox"> 정글
                          </label>
                        </div>
                      </li>

                      <li class="d-block">
                        <div class="form-check w-100">
                          <label class="">
                            <input class="checkbox" type="checkbox"> 미드
                          </label>
                        </div>
                      </li>

                      <li class="d-block">
                        <div class="form-check w-100">
                          <label class="">
                            <input class="checkbox" type="checkbox"> 원딜
                          </label>
                        </div>
                      </li>

                      <li class="border-bottom-0">
                        <div class="form-check w-100">
                          <label class="">
                            <input class="checkbox" type="checkbox"> 서폿
                          </label>
                        </div>
                      </li>

                    </ul>

                    <br />
                    <br />

                    <div class="d-flex justify-content-end align-items-center">
                      <button type="submit" class="btn btn-primary me-2">다음</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/js/duo/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/template.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/settings.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/js/duo/dashboard.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/duo/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->

</body>
</html>