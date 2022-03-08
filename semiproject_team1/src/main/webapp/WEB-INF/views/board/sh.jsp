<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/feedback/feed.css">
	<style>
		.card ul li h6 {
			text-decoration: none;
			color: white;
			padding: 15px 20px;
			font-family: abster;
			display: inline-block;
		}
		.card ul li a{
			margin-left:20px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="#"> <img class="mb-4"
					src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png"
					alt="" width="72" height="62">  LOLPAN.DOG
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
			<h2>BOARD</h2>
			<button type="button" onclick="location.href='/feedbackwriteform' ">REQUEST</button>
			<p>HOT NEW SUBJECT SERTCH</p>
		</div>
		<div class="card">
			<ul class="list">
				<li><h6>HOME</h6>
					<ul class="list">
						<li><a href="/boardlist">ALL</a></li>
					</ul></li>
				<li><h6>LOL</h6>
					<ul class="list">
						<li><a href="/boardlist_highlight">HIGHLIGHT</a></li>
						<li><a href="#">TIP.KNOIW-HOW</a></li>
					</ul></li>
				<li><h6>COMMUNITY</h6>
					<ul class="list">
						<li><a href="#">FREE</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</body>
</html>