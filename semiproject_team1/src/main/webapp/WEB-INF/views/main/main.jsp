<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 날짜변경 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
<title>메인 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css"> --%>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="/main"> <img class="mb-4"
                              src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
                              alt="" width="60" height="60"> LOLPAN.DOG
           		</a>	
			</h1>
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
											src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq null }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/ul.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'IRON' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'BRONZE' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'SILVER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GOLD' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'PLATINUM' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'DIAMOND' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'MASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GRANDMASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
									</c:when>
									<c:otherwise>
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
											alt="" width="30" height="30">${mem_nickname }님 환영합니다
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
		<div class="hero" style="margin-top:100px;">
			<h2>PAN DOG <span class="material-icons-outlined" style="font-size:1em;">thumb_up</span></h2>
			<p>Lorem Ipsum</p><br><br>
			<button type="button" onclick="location.href='#' ">상세보기</button>
		</div>
		<!-- <div class="card">
			<ul class="list">
				<li><a href="#">HOME</a>
					<ul class="list">
						<li><a href="/boardlist">ALL</a></li>
					</ul></li>
				<li><a href="#">LOL</a>
					<ul class="list">
						<li><a href="/boardlist_highlight">HIGHLIGHT</a></li>
						<li><a href="#">TIP.KNOIW-HOW</a></li>
					</ul></li>
				<li><a href="#">COMMUNITY</a>
					<ul class="list">
						<li><a href="#">FREE</a></li>
					</ul></li>
			</ul>
		</div> -->
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