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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css"> --%>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="/"> <img 
					src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
					alt="" width="60" height="60"> LOLPAN.DOG
				</a>
			</h1>
			<div class="nav">
				<ul>
					<li><a href="#">FEEDBACK</a></li>
					<li><a href="/boardlist">FREEBOARD</a></li>
					<c:choose>
						<c:when test="${not empty mem_email_id }">
							<li><a href="">DUO</a></li>
							<li><a href="">MYPAGE</a></li>
							<li><a href="/logout?page=main">LOGOUT</a></li>
							<li style="color:white;">
								<img class="mb-4"
								src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
								alt="" width="30" height="30">${mem_nickname }님 환영합니다
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/login?page=main">LOGIN</a></li>	
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<div class="hero" style="margin-top:100px;">
			<h2>Today's Feedback</h2>
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
</body>
</html>