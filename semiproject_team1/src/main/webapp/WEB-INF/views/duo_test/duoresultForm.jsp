<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>duoresultForm</title>

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
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="row">
          <div class="col-sm-12">
            <div class="home-tab">
              <div class="d-sm-flex align-items-center justify-content-between border-bottom">
              </div>
              <div class="tab-content tab-content-basic">
                <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                  <div class="row">
                    <div class="col-sm-12">

                      <div class="d-sm-flex align-items-center justify-content-between">
                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png" class="img-fluid" alt="b">

                          <h4 class="">너는 죽엇다<span>[브론즈]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png" class="img-fluid" alt="c">

                          <h4 class="">초초딩<span>[챌린저]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png" class="img-fluid" alt="i">

                          <h4 class="">대대딩<span>[아이언]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png" class="img-fluid" alt="gm">

                          <h4 class="">아이킬유<span>[그랜드마스터]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>
                        
                      </div>

                      <br />
                      <br />

                      <div class="d-sm-flex align-items-center justify-content-between">
                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png" class="img-fluid" alt="g">

                          <h4 class="">오키라이방<span>[골드]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png" class="img-fluid" alt="s">

                          <h4 class="">아이돈라이크유<span>[실버]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png" class="img-fluid" alt="p">

                          <h4 class="">꺼져라<span>[플래티넘]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
                        </div>

                        <div class="btn-group-vertical d-sm-flex justify-content-center align-items-center">
                          <img src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png" class="img-fluid" alt="d">

                          <h4 class="">강법규<span>[다이아몬드]</span></h4>
                          <a href="#" class="btn btn-primary text-white me-0"> 상세보기</a>
                          <a href="#" class="btn btn-primary text-white me-0"> 쪽지</a>
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
    </div>
  </div>
  
  <c:forEach begin="0" end="10" var="i" varStatus="stat">
	${stat.count }
	<c:if test="${stat.count%4==0 }">
		<br><br>
	</c:if>
	</c:forEach>



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