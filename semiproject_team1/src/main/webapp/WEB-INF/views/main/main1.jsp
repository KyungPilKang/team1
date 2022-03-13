<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
<title>LOLPAN.DOG</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main1.css">
</head>
<body>
	<div class="box">
		<div class="txt">LOLPAN.DOG</div>
		<div class="txt1">LOLPAN.DOG</div>
		<div class="move">
			<!-- <button type="button" style="width: 150pt; height: 45pt;"
				onclick="location.href='http://localhost:8090/' ">START</button> -->
		</div>
		<img
			src="${pageContext.request.contextPath}/resources/asset/image/board/lol4.jpg"
			alt="" />
	</div>
	<script>
		setTimeout(function() {
			location.href='http://localhost:8090/main'
		}, 5200);
	</script>
</body>
</html>