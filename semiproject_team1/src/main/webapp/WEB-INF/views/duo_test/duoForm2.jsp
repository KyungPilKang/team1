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
			<h2>듀오 매칭</h2>
			<button type="button" onclick="location.href='/duoform2' ">매칭등록/수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='/duoform1' ">매칭신청/조회</button>
		</div>
		<form>
		<div class="user-container">
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">닉네임</div>
				<input type="text" placeholder="닉네임">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">롤 아이디</div>
				<input type="text" placeholder="롤 닉네임">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">포지션</div>
				<input type="text" placeholder="주 포지션">
				<input type="text" placeholder="서브 포지션">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">티어</div>
				<input type="text" placeholder="현재 티어">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">승률</div>
				<input type="text" placeholder="현재 승률">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px;">모스트 챔피언</div>
				<div>
				<select id="selectChamp">
	                <option value="no">챔피언 선택</option>
	                <option value="86">가렌</option>
	                <option value="3">갈리오</option>
	                <option value="41">갱플랭크</option>
	                <option value="79">그라가스</option>
	                <option value="104">그레이브즈</option>
	                <option value="887">그웬</option>
	                <option value="150">나르</option>
	                <option value="267">나미</option>
	                <option value="75">나서스</option>
	                <option value="111">노틸러스</option>
	                <option value="56">녹턴</option>
	                <option value="20">누누와 윌럼프</option>
	                <option value="76">니달리</option>
	                <option value="518">니코</option>
	                <option value="122">다리우스</option>
	                <option value="131">다이애나</option>
	                <option value="119">드레이븐</option>
	                <option value="13">라이즈</option>
	                <option value="497">라칸</option>
	                <option value="33">람머스</option>
	                <option value="99">럭스</option>
	                <option value="68">럼블</option>
	                <option value="">레나타 글라스크</option>
	                <option value="58">레넥톤</option>
	                <option value="89">레오나</option>
	                <option value="421">렉사이</option>
	                <option value="526">렐</option>
	                <option value="107">렝가</option>
	                <option value="236">루시안</option>
	                <option value="117">룰루</option>
	                <option value="7">르블랑</option>
	                <option value="64">리 신</option>
	                <option value="92">리븐</option>
	                <option value="127">리산드라</option>
	                <option value="876">릴리아</option>
	                <option value="11">마스터 이</option>
	                <option value="57">마오카이</option>
	                <option value="90">말자하</option>
	                <option value="54">말파이트</option>
	                <option value="82">모데카이저</option>
	                <option value="25">모르가나</option>
	                <option value="36">문도 박사</option>
	                <option value="21">미스 포츈</option>
	                <option value="432">바드</option>
	                <option value="110">바루스</option>
	                <option value="254">바이</option>
	                <option value="45">베이가</option>
	                <option value="67">베인</option>
	                <option value="711">벡스</option>
	                <option value="161">벨코즈</option>
	                <option value="106">볼리베이</option>
	                <option value="201">브라움</option>
	                <option value="63">브랜드</option>
	                <option value="8">블라디미르</option>
	                <option value="53">블리츠크랭크</option>
	                <option value="234">비에고</option>
	                <option value="112">빅토르</option>
	                <option value="78">뽀삐</option>
	                <option value="360">사미라</option>
	                <option value="14">사이온</option>
	                <option value="517">사일러스</option>
	                <option value="35">샤코</option>
	                <option value="235">세나</option>
	                <option value="147">세라핀</option>
	                <option value="113">세주아니</option>
	                <option value="875">세트</option>
	                <option value="37">소나</option>
	                <option value="16">소라카</option>
	                <option value="98">쉔</option>
	                <option value="102">쉬바나</option>
	                <option value="50">스웨인</option>
	                <option value="72">스카너</option>
	                <option value="15">시비르</option>
	                <option value="5">신 짜오</option>
	                <option value="134">신드라</option>
	                <option value="27">신지드</option>
	                <option value="412">쓰레쉬</option>
	                <option value="103">아리</option>
	                <option value="32">아무무</option>
	                <option value="136">아우렐리온 솔</option>
	                <option value="427">아이번</option>
	                <option value="268">아지르</option>
	                <option value="84">아칼리</option>
	                <option value="166">아크샨</option>
	                <option value="266">아트록스</option>
	                <option value="523">아펠리오스</option>
	                <option value="12">알리스타</option>
	                <option value="1">애니</option>
	                <option value="34">애니비아</option>
	                <option value="22">애쉬</option>
	                <option value="157">야스오</option>
	                <option value="245">에코</option>
	                <option value="60">엘리스</option>
	                <option value="62">오공</option>
	                <option value="516">오른</option>
	                <option value="61">오리아나</option>
	                <option value="2">올라프</option>
	                <option value="777">요네</option>
	                <option value="83">요릭</option>
	                <option value="77">우디르</option>
	                <option value="6">우르곳</option>
	                <option value="19">워웍</option>
	                <option value="350">유미</option>
	                <option value="39">이렐리아</option>
	                <option value="28">이블린</option>
	                <option value="81">이즈리얼</option>
	                <option value="420">일라오이</option>
	                <option value="59">자르반 4세</option>
	                <option value="498">자야</option>
	                <option value="143">자이라</option>
	                <option value="154">자크</option>
	                <option value="40">잔나</option>
	                <option value="24">잭스</option>
	                <option value="238">제드</option>
	                <option value="101">제라스</option>
	                <option value="221">제리</option>
	                <option value="126">제이스</option>
	                <option value="142">조이</option>
	                <option value="115">직스</option>
	                <option value="202">진</option>
	                <option value="26">질리언</option>
	                <option value="222">징크스</option>
	                <option value="31">초가스</option>
	                <option value="43">카르마</option>
	                <option value="164">카밀</option>
	                <option value="38">카사딘</option>
	                <option value="30">카서스</option>
	                <option value="69">카시오페아</option>
	                <option value="145">카이사</option>
	                <option value="121">카직스</option>
	                <option value="55">카타리나</option>
	                <option value="429">칼리스타</option>
	                <option value="85">케넨</option>
	                <option value="51">케이틀린</option>
	                <option value="141">케인</option>
	                <option value="10">케일</option>
	                <option value="96">코그모</option>
	                <option value="42">코르키</option>
	                <option value="133">퀸</option>
	                <option value="240">클레드</option>
	                <option value="246">키아나</option>
	                <option value="203">킨드레드</option>
	                <option value="44">타릭</option>
	                <option value="91">탈론</option>
	                <option value="163">탈리야</option>
	                <option value="223">탐 켄치</option>
	                <option value="48">트런들</option>
	                <option value="18">트리스타나</option>
	                <option value="23">트린다미어</option>
	                <option value="4">트위스티드 페이트</option>
	                <option value="29">트위치</option>
	                <option value="17">티모</option>
	                <option value="555">파이크</option>
	                <option value="80">판테온</option>
	                <option value="9">피들스틱</option>
	                <option value="114">피오라</option>
	                <option value="105">피즈</option>
	                <option value="74">하이머딩거</option>
	                <option value="120">헤카림</option>
             	 </select>
              </div>
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">플레이 타입</div>
				<select class="form-control" id="selectPlayStyle">
                  <option value="no">1개 선택</option>
                  <option value="1">한타 지향</option>
                  <option value="2">대한타지향</option>
                </select>
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">마이크 여부</div>
				<input type="radio">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:7px">올챔 여부</div>
				<input type="radio">
			</div>
			<div class="duo_wr_subject">
				<div style="width:120px; float:left; text-align:center; margin-top:73px">자기소개</div>
				<input type="text" placeholder="내용을 입력해주세요" style="width: 470px; height: 150px;">
			</div>
		</div>
		<div class="hero" style="margin-top:830px;">
			<button type="submit">등록하기</button>
		</div>
	</form>
	
	<!-- <div class="footer" style="margin-top:500px;">
	</div> -->
</body>
</html>