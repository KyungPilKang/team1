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
		<div class="header" style= "z-index:2;">
			<h1>
				<a href="#"> <img class="mb-4"
					src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
					alt="" width="60" height="60"> LOLPAN.DOG
				</a>
			</h1>
			<div class="nav">
				<ul>
					<li><a href="#">피드백</a></li>
					<li><a href="#">듀오매칭</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div class="hero" style= "z-index:1;">
			<h2>듀오 매칭</h2>
			<button type="button" onclick="location.href='/duoform2' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='/duoform1' ">매칭신청/조회</button>
		</div>
		<div class="user-container">
			<ul>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
						alt="" width="150" height="150"> <br>넌죽었다 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
				<li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
						src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
						alt="" width="150" height="150"> <br>아이킬유 [포지션]
				</a><br>
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button>
			</ul>
		</div>
	</div>
		<div class="footer">
        
    </div>
</body>
</html>