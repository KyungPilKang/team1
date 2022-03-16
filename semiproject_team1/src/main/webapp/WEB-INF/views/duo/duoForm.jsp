<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
<title>듀오 메인 - 롤판.DOG</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/duo/duoForm1.css">
</head>
<body>
	<div class="container">
		<div class="header" style= "z-index:2;">
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
							<li style="color:white;">
								<c:choose>
									<c:when test="${my_tier eq 'none' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq null }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/ul.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'IRON' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'BRONZE' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'SILVER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GOLD' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'PLATINUM' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'DIAMOND' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'MASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GRANDMASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:otherwise>
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:otherwise>
								</c:choose>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/loginform?page=main">로그인</a></li>	
						</c:otherwise>
					</c:choose>
				</ul>
            </div>
       		</div>
		</div>
		<div class="hero" style= "z-index:1;">
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
</body>
</html>