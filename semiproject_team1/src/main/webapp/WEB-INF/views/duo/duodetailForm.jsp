<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<img class="mb-4"
								src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
								alt="" width="30" height="30">${mem_nickname }님 환영합니다
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
		<div class="hero" style="z-index: 1;">
			<h2>듀오 매칭</h2>
			<c:choose>
				<c:when test="${mem_duo_reg_ok eq 'no'	 }">
					<button type="button" onclick="location.href='/duoregform' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='/duoregform?duo_reg_ok=no' ">매칭신청/조회</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='/duoeditform' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='/duosearchform' ">매칭신청/조회</button>
				</c:otherwise>
			</c:choose>
		</div>
		<form action="/duoupdate" method="post">
		<div class="user-container">
			<div style="text-align:center; margin-top:10px; margin-bottom:30px;">
				<h3>등록 정보를 업데이트 시 전적 정보가 최신 데이터로 갱신됩니다</h3>
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">닉네임</div>
				<input type="text" name="duo_nickname" value="${mem.mem_nickname }" readOnly style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center;">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">롤 아이디</div>
				<input type="text" name="duo_link_id" value="${mem.mem_link_id }" readOnly style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center;">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">포지션</div>
				<select class="form-control" id="duo_position" name="duo_position" style="height:30px; font-weight:bold; text-align:center; width:120px;">
					<option value="0" selected>주포지션</option>
                    <option value="1">탑</option>
                    <option value="2">정글</option>
                    <option value="3">미드</option>
                    <option value="4">원딜</option>
                    <option value="5">서포터</option>
                </select>
                <select class="form-control" id="duo_subposition" name="duo_subposition" style="height:30px; font-weight:bold; text-align:center; width:120px;" disabled>
                    <option value="0" selected>서브포지션</option>
                    <option value="1" id="p1">탑</option>
                    <option value="2" id="p2">정글</option>
                    <option value="3" id="p3">미드</option>
                    <option value="4" id="p4">원딜</option>
                    <option value="5" id="p5">서포터</option>
                    <option value="6">선택안함</option>
                </select>
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">티어</div>
				<input type="text" name="duo_lol_tier" value="${lol_tier }(${lol_rank })" readOnly style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center;">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">승률</div>
				<input type="text" name="duo_lol_ratio" value="${lol_rate }" readOnly style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center;">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">모스트 챔피언</div>
				<input type="text" name="duo_most1" value="${most1 }"readOnly  style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center; width:120px;">
				<input type="text" name="duo_most2" value="${most2 }"readOnly  style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center; width:120px;">
				<input type="text" name="duo_most3" value="${most3 }"readOnly  style="background-color: rgba(80,80,80,0.5); height:30px; color:white; font-weight:bold; text-align:center; width:120px;">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:13px">플레이 타입</div>
				<select class="form-control" id="duo_play_type" name="duo_play_type" style="height:30px; font-weight:bold; text-align:center;">
                  <option value="0">1개 선택</option>
                  <option value="1">한타 지향</option>
                  <option value="2">라인전 지향</option>
                  <option value="3">오브젝트 지향</option>
                  <option value="4">사이드 운영</option>
                  <option value="5">로밍 운영</option>
                </select>
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:73px">자기소개</div>
				<input type="text" placeholder="내용을 입력해주세요" style="width: 470px; height: 150px;"
				id="duo_info" name="duo_info">
			</div>
		</div>
		<div class="hero" style="margin-top:900px;">
			<button type="submit">업데이트</button>
		</div>
	</form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$('#duo_position').change(function(){
		$('#duo_subposition').attr('disabled', false);
		$('#duo_position>option').attr('disabled', false);
		$('#duo_subposition>option[value='+$("#duo_position").val()+']').attr('disabled', true);
		$('#duo_subposition').change(function(){
			$('#duo_subposition>option').attr('disabled', false);
			$('#duo_position>option[value='+$("#duo_subposition").val()+']').attr('disabled', true);
		});
	});


</script>
</body>
</html>