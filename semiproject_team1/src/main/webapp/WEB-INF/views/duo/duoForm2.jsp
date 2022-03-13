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
	href="${pageContext.request.contextPath}/resources/css/duo/duoForm2.css">
</head>
<body>
	<div class="container">
		<div class="header" style="z-index: 2;">
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
		<div class="hero" style="z-index: 1;">
			<h2>DUO</h2>
			<button type="button" onclick="location.href='/duoform2' ">매칭등록/수정</button>
			<button type="button" onclick="location.href='/duoform1' ">매칭신청/조회</button>
		</div>
		<div class="user-container" style="vertical-align: middle;">
			<div class="duo_wr_subject">
				<span>닉네임</span>
				<input type="text" placeholder="닉네임">
			</div>
			<div class="duo_wr_subject">
				<span>롤 아이디</span>
				<input type="text" placeholder="롤 닉네임">
			</div>
			<div class="duo_wr_subject">
				<span>포지션(주/서브)</span>
				<input type="text" placeholder="주 포지션">
				<input type="text" placeholder="서브 포지션">
			</div>
			<div class="duo_wr_subject">
				<span>티어</span>
				<input type="text" placeholder="현재 티어">
			</div>
			<div class="duo_wr_subject">
				<span>승률</span>
				<input type="text" placeholder="현재 승률">
			</div>
			<div class="duo_wr_subject">
				<span>선호 챔피언</span> 
				<input type="text" placeholder="챔피언이름" style="width: 80px; height: 20px;">
				<input type="text" placeholder="챔피언이름" style="width: 80px; height: 20px;">
				<input type="text" placeholder="챔피언이름" style="width: 80px; height: 20px;">
				<input type="text" placeholder="챔피언이름" style="width: 80px; height: 20px;">
				<input type="text" placeholder="챔피언이름" style="width: 80px; height: 20px;">
			</div>
			<div class="duo_wr_subject">
				<span>플레이 방식</span>
				<input type="text" placeholder="한타 지향">
			</div>
			<div class="duo_wr_subject">
				<span>마이크 가능 여부</span>
				<input type="radio">
			</div>
			<div class="duo_wr_subject">
				<span>올챔 여부</span>
				<input type="radio">
			</div>
			<div class="duo_wr_subject">
				<span>소개글</span>
				<input type="text" placeholder="내용을 입력해주세요" style="width: 540px; height: 150px;">
			</div>
		</div>
			<div class="hero" style="margin-top:700px;">
			<button type="button" onclick="location.href='duoform1' ">돌아가기</button>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>