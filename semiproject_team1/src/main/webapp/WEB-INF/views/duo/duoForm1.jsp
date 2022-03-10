<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
<title>듀오매칭</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/duoForm1.css">
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="#"> <img class="mb-4"
					src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
					alt="" width="60" height="60"> LOLPAN.DOG
				</a>
			</h1>
			<div class="nav">
				<ul>
					<li><a href="#">FEEDBACK</a></li>
					<li><a href="#">DUOMATCHING</a></li>
					<li><a href="#">FREEBOARD</a></li>
					<li><a href="#">MYPAGE</a></li>
					<li><a href="#">LOGOUT</a></li>
				</ul>
			</div>
		</div>
		<div class="hero">
			<h2>DUO</h2>
			<button type="button" onclick="location.href='/duoForm2' ">매칭등록/수정</button>
			<button type="button" onclick="location.href='/feedbackwriteform' ">매칭신청/조회</button>
		</div>
	</div>
</body>
</html>