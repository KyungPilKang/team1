<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>듀오매칭</title>

<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/typicons/typicons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />

</head>
<body>

	<div class="container-scroller">

		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row justify-content-center">

			<div class="navbar-menu-wrapper d-flex align-items-top">

				<div
					class="d-sm-flex justify-content-center d-inline-flex align-items-center">
					<div>
						<h1>
							<a href="/"> <img class="mb-4"
								src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
								alt="" width="60" height="60"> LOLPAN.DOG
							</a>
						</h1>
					</div>
				</div>

				<ul class="navbar-nav ms-auto">

					<div class="nav-item dropdown">
						<span class="nav-link count-indicator" id="countDropdown" href="#"
							data-bs-toggle="dropdown" aria-expanded="false">
							<div>
								<img src="images/lol-symbol/gm.png" alt="image"
									class="img-sm profile-pic">
							</div> <br />
							<div>
								<h4
									class="preview-subject ellipsis font-weight-medium text-dark">memotome2
									님 환영합니다.</h4>
								</divn>
						</span>

					</div>

				</ul>

			</div>
		</nav>

		<div
			class="container-fluid page-body-wrapper justify-content-center bg-white">
			<div class="main-panel">
				<div class="content-wrapper bg-white">
					<!-- 클래스 묶음 -->
					<div class="row">
						<!-- 행 -->
						<div class="col-sm-12">
							<!-- 홈페이지의 오른쪽 가운데 왼쪽 위치 코드 -->
							<div class="home-tab">
								<div
									class="d-sm-flex align-items-center justify-content-between border-bottom">
									<!-- d-sm-flex / align-items-center / justify-content-between / border-bottom 따로따로임 -->
									<!-- justify -content ( 가로축 - 중심축 ) / align-items ( 세로축 - 교차축 ) -->

									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a class="nav-link active ps-0"
											id="home-tab" data-bs-toggle="tab" href="#overview"
											role="tab" aria-controls="overview" aria-selected="true">피드백</a>
										</li>
										<li class="nav-item"><a class="nav-link" id="profile-tab"
											data-bs-toggle="tab" href="#audiences" role="tab"
											aria-selected="false">듀오 매칭</a></li>
										<li class="nav-item"><a class="nav-link" id="contact-tab"
											data-bs-toggle="tab" href="#demographics" role="tab"
											aria-selected="false">자유 게시판</a></li>
										<!-- <li class="nav-item">
                      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#more" role="tab" aria-selected="false">More</a>
                    </li> -->
									</ul>

									<div>
										<div class="btn-wrapper">
											<a href="#" class="btn btn-otline-dark align-items-center"></i>
												마이페이지</a> <a href="#" class="btn btn-otline-dark"></i> 로그아웃</a>
											<!-- <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Export</a> -->
										</div>
									</div>
								</div>

								<div class="tab-content tab-content-basic">
									<div class="tab-pane fade show active" id="overview"
										role="tabpanel" aria-labelledby="overview">
										<div class="row">
											<div class="col-sm-12">
												<div
													class="d-sm-flex statistics-details justify-content-center d-inline-flex align-items-center">
													<!-- div로 감싸고 d-sm-flex로 매칭 등록, 매칭 신청 가운데 정렬  -->

													<div class="d-none d-md-block px-3 btn btn-otline-dark">

														<h3 class="rate-percentage">매칭 등록/수정</h3>

													</div>
													<div class="d-none d-md-block px-3 btn btn-otline-dark">

														<h3 class="rate-percentage">매칭 신청/조회</h3>

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
	</div>

	<!-- plugins:js -->
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/chart.js/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/progressbar.js/progressbar.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/off-canvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/hoverable-collapse.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/template.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/settings.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/duo/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->

</body>
</html>