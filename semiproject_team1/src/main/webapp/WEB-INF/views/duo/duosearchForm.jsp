<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="header" style="z-index: 2;">
			<h1>
				<a href="/main"> <img class="mb-4"
					src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
					alt="" width="60" height="60"> LOLPAN.DOG
				</a>
			</h1>
			<div class="nav">
				<div class="nav">
					<ul>
						<li><a href="/feedback">피드백</a></li>
						<li><a href="/boardlist">자유게시판</a></li>
						<c:choose>
							<c:when test="${not empty mem_mno }">
								<li><a href="/duoform">듀오</a></li>
								<li><a href="/mypage">마이페이지</a></li>
								<li><a href="/log_out?page=main">로그아웃</a></li>
								<li style="color: white;"><img class="mb-4"
									src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
									alt="" width="30" height="30">${mem_nickname }님 환영합니다</li>
							</c:when>
							<c:otherwise>
								<li><a href="/loginform?page=main">로그인</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div class="hero" style="z-index: 1;">
			<h2>듀오 매칭</h2>
			<c:choose>
				<c:when test="${mem_duo_reg_ok eq 'no' }">
					<button type="button" onclick="location.href='/duoregform' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='/duoregform?duo_reg_ok=no' ">매칭신청/조회</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='/duoeditform' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='/duosearchform' ">매칭신청/조회</button>
				</c:otherwise>
			</c:choose>
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
		<ul class="footer-List">
			<li>About LOLPAN.DOG</li>
			<li>개인정보처리방침</li>
			<li>도움말</li>
			<li>문의/피드백</li>
			<li>광고</li>
			<li>제휴</li>
		</ul>
		<ul class="footer-CSList">
			<li>고객센터 C/S Center</li>
			<li>전화: 02.1234.5678</li>
			<li>팩스: 02.1234.5678</li>
			<li>이메일: lolpan.dog@gmail.com</li>
			<li>카카오톡 ID: LOLPANDOG</li>
			<li>오전 9시부터 오후 6시까지 상담가능합니다.</li>
		</ul>
	</div>
</body>
</html>