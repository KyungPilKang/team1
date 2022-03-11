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
		<div class="user-container">
			<ul>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
						alt="" width="150" height="150"> <br>넌죽었다 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
					<button type="button" onclick="location.href='/duoForm2' ">쪽지</button></li>
			</ul>
		</div>
	</div>
</body>
</html>