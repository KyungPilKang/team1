<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<c:forEach items="${duoList}" var="duo">
					<div style="width:300px; height:300px; float:left;">
						<c:choose>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'iron')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'bronze')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'silver')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'gold')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'platinum')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'diamond')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'master')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:when test="${fn:contains(duo.duo_lol_tier, 'grandmaster')}">
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png"
									alt="" width="150" height="150">
								</div>
							</c:when>
							<c:otherwise>
								<div style="margin-left:77px;">
									<img class="mb-5"
									src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
									alt="" width="150" height="150">
								</div>
							</c:otherwise>
						</c:choose>
						<div style="color:white; font-weight:bold; text-align:center; font-size:1.5em;">
							${duo.duo_link_id }
							<c:choose>
								<c:when test="${duo.duo_position eq 1 }">
									[탑]	
								</c:when>
								<c:when test="${duo.duo_position eq 2 }">
									[정글]
								</c:when>
								<c:when test="${duo.duo_position eq 3 }">
									[미드]
								</c:when>
								<c:when test="${duo.duo_position eq 4 }">
									[원딜]
								</c:when>
								<c:otherwise>
									[서폿]
								</c:otherwise>
							</c:choose>
						</div>
						<button type="button" onclick="location.href='/duodetail?duo_nickname=${duo.duo_nickname}' ">상세보기</button>
					</div>
				</c:forEach>
				<%-- <li><a href="#">&nbsp&nbsp&nbsp <img class="mb-5"
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
					<button type="button" onclick="location.href='/duoForm2' ">상세보기</button> --%>
			</ul>
		</div>
	</div>
	<div class="footer">
	<div style="margin-left:20px; margin-top:10px">
       		<ul class="footer-List">
			<li>© 2022 LOLPAN.DOG LOLPAN.DOG isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.</li>
				<ul class="footer-CSList">
				<li>고객센터 C/S Center</li>
				<li>전화: 02.1234.5678</li>
				<li>이메일: lolpan.dog@gmail.com</li>
				<li>오전 9시부터 오후 6시까지 상담가능합니다.</li>
				</ul> 
			</ul>
			<br>
	</div>
	</div>
</body>
</html>