<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
    <title>회원가입 - 롤판.DOG</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form>
    	<a href="/main"><img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
			alt="" width="80" height="80"></a>
		<h1 class="h1 mb-3 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>
    <div class="my-2 d-flex justify-content-between align-items-center">
        <div class="form-check" style="padding:0;">
            <div style="padding-right:30px; float: left;">
            <label for="allagree" class="form-check-label text-white" style="text-align: left;">14세 이상이며 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
        </div>
        <div style="float:left">
            <input id="checkAll" type="checkbox"  class="form-check-input">
        </div>
        </div>
      </div>
		<!-- 이용약관 동의 체크박스 -->
		<div class="my-2 align-items-center">
			<div class="form-check d-flex justify-content-between" style="padding:0;">
            	<div style="padding-right:30px; float: left;">
          			<label for="agree1" class="form-check-label text-white" style="text-align: left;">롤판.DOG 이용약관 동의</label>
       			</div>
       			<div>
        			<input id="checkbox1" name="checkTmp" type="checkbox"  class="form-check-input">
    			</div>
       		</div>
      	</div>


    <div class="form-floating">
      <textarea style="width:100%; height: 100px; resize:none;">
이용약관
본 약관은 [2022년 3월 13일]일부터 적용됩니다.

목적
이 약관은 '롤판.DOG'(이하 "회사")에서 제공하는 게임 전적 서비스 및 이에 부수된 제반 서비스(이하 "서비스")의 이용과 관련하여, 회사와 회원 간에 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다.

약관의 게시와 효력, 개정
1. 회사는 서비스의 가입 과정에서 회원에게 본 약관을 제시하고, 서비스 홈페이지에 본 약관을 게시합니다.
2. 회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다.
3. 회사가 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 그 적용일자로부터 최소한 7일 이전(회원에게 불리하거나 중대한 사항의 변경은 30일 이전)부터 그 적용일자 경과 후 상당한 기간이 경과할 때까지 초기화면 또는 초기화면과의 연결화면을 통해 공지합니다.
4. 회사가 약관을 개정할 경우에는 개정약관 공지 후 개정약관의 적용에 대한 회원의 동의 여부를 확인합니다. 회원은 회사가 전항에 따라 변경하는 약관에 동의하지 않을 권리가 있으며, 이 경우 회원은 회사에서 제공하는 서비스 이용 중단 및 탈퇴 의사를 표시하고 서비스 이용 종료를 요청할 수 있습니다. 다만, 회사가 회원에게 변경된 약관의 내용을 공지하면서 회원에게 동의 또는 거부의 의사표시를 하지 않을 경우 승낙한 것으로 간주하겠다는 내용을 명확히 표시하였음에도 불구하고, 회원이 약관 시행일까지 거부의 의사표시를 하지 아니한 경우 회원이 변경된 약관에 동의하는 것으로 간주할 수 있습니다.

약관의 해석과 예외 준칙
1. 회사는 제공하는 개별 서비스에 대해서 별도의 이용약관 및 정책을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우 개별 서비스의 이용약관을 우선하여 적용합니다.
2. 본 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.

용어의 정의
1. 서비스: 개인용 컴퓨터 (PC), TV, 휴대형 단말기, 전기통신설비 등을 포함한 각종 유무선 장치와 같이 구현되는 단말기와 상관없이 회원이 이용할 수 있는 피드백 서비스 및 이에 부수된 제반 서비스를 의미합니다.
2. 회원: 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 모든 사용자를 의미합니다.
3. 아이디: 회원의 식별 및 서비스 이용을 위하여 회원이 선정하고 회사가 부여한 문자 및 숫자의 조합을 의미합니다.
4. 비밀번호: 회원의 개인 정보 보호 및 회원의 동일성 확인을 위해서 회원이 정한 문자 또는 숫자의 조합을 의미합니다.
5. 도메인: 회원의 서비스 이용을 위하여 회원이 신청하여 회사가 부여한 고유한 인터넷 주소를 의미합니다. 회사는 제공하는 제반 서비스를 위해서 서비스에 따라 별도의 도메인 주소를 추가적으로 회원에게 제공합니다.
6. 계정 정보: 회원이 아이디, 비밀번호, 성명 등 회원이 회사에 제공한 일반정보 및 게임 전적 정보 등 생성정보를 통칭합니다.
7. 게시물: 회원이 서비스를 이용함에 있어 회원이 서비스에 게시한 문자, 문서, 그림, 음성, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 정보나 자료를 의미합니다.

이용계약의 체결
1. 이용계약은 회원이 서비스에서 제공하는 회원 가입 페이지에서 서비스 이용약관에 동의한 후 이용신청을 하고 신청한 내용에 대해서 회사가 승낙함으로써 체결됩니다.
2. 이용자는 제1항의 이용신청 시 본인의 실제 정보를 기재하여야 합니다. 식별정보를 허위로 기재하거나 타인의 정보를 도용한 경우 이 약관에 의한 회원의 권리를 주장할 수 없고, 회사는 환급 없이 이용계약을 취소하거나 해지할 수 있습니다.
3. 만 14세 미만의 아동에 대하여는 이용신청을 제한하며, 만 14세 미만의 아동에게는 서비스를 제공하지 않습니다.
4. 회사는 이용약관에 동의한 후 이용 신청한 사용자에 대해서 원칙적으로 접수 순서에 따라 서비스 이용을 승낙함을 원칙으로 합니다. 다만 회사의 설비에 여유가 없거나 기술적 장애가 있는 경우, 서비스 상의 장애가 발생한 경우, 그 밖에 이용신청의 승낙이 곤란한 경우 일정시간 가입승인을 유보할 수 있습니다.
5. 회사는 다음 각 호에 해당하는 신청에 대해서 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다.
1) 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
2) 제3자의 전자우편 주소를 이용하여 신청한 경우
3) 허위의 정보를 기재하거나, 회사가 필수적으로 입력을 요청한 부분을 기재하지 않은 경우
4) 부정한 용도로 서비스를 사용하고자 하는 경우
5) 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
6) 회사의 정책에 적합하지 않는 회원으로 판단되는 경우나 서비스 제공이 곤란한 경우
7) 회원의 이용 목적이나 서비스 이용 방법이 회사의 재산권, 영업권을 침해할 우려가 있는 경우
8) 회원의 이용 목적이나 서비스 이용 방법이 다른 회원의 서비스 이용에 영향을 미칠 경우
9) 비정상적인 방법을 통하여 아이디 및 도메인을 대량으로 생성하는 행위
10) 만 14세 미만의 아동이 이용신청을 한 경우
11) 최근 3개월 내 이용제한 기록이 있는 이용자가 이용신청을 하는 경우
12) 대한민국 이외의 국가 중 회사에서 아직 서비스를 제공할 것으로 결정하지 않은 국가에서 서비스를 이용하는 경우로 회사가 해외 서비스 업체와 체결한 계약이나 특정 국가에서 접속하는 회원에 대한 서비스 제공과 관련하여 서비스제공을 제한할 필요가 있는 경우
13) 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 그 밖의 관계 법령에서 금지하는 위법행위를 할 목적으로 이용신청을 하는 경우
14) 그 밖에 1호 내지 13호에 준하는 사유로서 승낙이 부적절하다고 판단되는 경우
6. 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
7. 회원은 회사에 언제든지 회원 탈퇴를 요청하여 이용계약을 해지할 수 있습니다.
8. 회원은 회원 가입이나 회원정보 수정을 통해 기재한 개인정보 및 모든 정보의 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 변경의 지체로 인하여 발생한 회원의 손해에 대해 회사는 책임을 지지 않습니다.
9. 회사는 관련 법률 및 회사의 개인정보처리방침에서 정한 바에 따라 회원에게 요청하는 회원정보 및 기타정보 항목을 추가, 삭제 등 변경하여 수집 및 이용할 수 있습니다.

개인정보보호 의무
1. 회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보 보호법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다.
2. 회사는 서비스를 중단하거나 회원이 개인정보 제공 동의를 철회한 경우에는 신속하게 회원의 개인정보를 파기합니다. 단, 개인정보처리방침에서 정하는 바에 따라 특정 정보는 일정 기간 동안 보관할 수 있습니다.
3. 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 관계 법령에서 정하는 바에 따라 추가적인 개인정보를 수집할 수 있습니다.
4. 회사는 법률에 특별한 규정이 있는 경우를 제외하고는 회원의 별도 동의 없이 회원의 계정정보를 포함한 일체의 개인정보를 제3자에게 공개하거나 제공하지 아니합니다.
5. 회사는 향후 제공하는 서비스에서 회원의 편의를 위해서 회원의 계정 정보를 사용할 수 있도록 링크 및 기타 방법을 제공할 수 있습니다.

회원의 아이디 및 비밀번호
1. 회원은 아이디와 비밀번호에 관해서 관리책임이 있습니다.
2. 회원은 아이디 및 비밀번호를 제3자가 이용하도록 제공하여서는 안됩니다.
3. 회사는 회원이 아이디 및 비밀번호를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 회사의 고의 또는 중대한 과실이 없는 제3자의 부정이용 등으로 인한 손해에 대해 책임을 지지 않습니다.
4. 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.

회사의 의무
1. 회사는 계속적이고 안정적인 서비스의 제공을 위하여 최선을 다하여 노력합니다.
2. 회사는 회원이 안전하게 서비스를 이용할 수 있도록 현재 인터넷 보안기술의 발전수준과 회사가 제공하는 서비스의 성격에 적합한 보안시스템을 갖추고 운영해야 합니다.
3. 회사는 서비스를 이용하는 회원으로부터 제기되는 불만이 정당하다고 인정할 경우, 시스템과 인력이 충분하다면 이를 처리하여야 합니다. 이 처리과정에 대해서 회원이 문의를 보낸 이메일의 회신 등의 방법으로 전달하거나, 서비스에 반영함으로써 회원은 이를 인지 할 수 있습니다.
4. 회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.

회원의 의무
1. 회원은 다음 각호에 해당하는 행위를 해서는 안 됩니다.
1) 이용 신청 또는 회원정보 변경 시 허위내용 등록
2) 타인의 정보 도용
3) 회사의 운영자, 임직원, 회사를 사칭하거나 관련 정보를 도용
4) 회사가 게시한 정보의 변경
5) 회사가 금지한 정보(컴퓨터 프로그램 등)의 송신 또는 게시
6) 회사가 제공 또는 승인하지 아니한 컴퓨터 프로그램이나 기기 또는 장치를 제작, 배포, 이용, 광고하는 행위
7) 회사와 기타 제3자의 저작권, 영업비밀, 특허권 등 지적재산권에 대한 침해
8) 회사와 다른 회원 및 기타 제3자를 희롱하거나, 위협하거나 명예를 손상시키거나, 업무를 방해하는 행위
9) 외설, 폭력적인 메시지, 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위
10) 해킹을 통해서 다른 사용자의 정보를 취득하는 행위
11) 회사의 동의 없이 영리, 영업, 광고, 정치활동 등을 목적으로 서비스를 사용하는 행위
12) 기타 현행 법령에 위반되는 불법적인 행위 및 선량한 풍속 기타 사회통념상 허용되지 않는 행위
2. 회사는 회원이 전항에서 금지한 행위를 하는 경우, 위반 행위의 경중에 따라 서비스의 이용정지/계약의 해지 등 서비스 이용 제한, 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있습니다.
3. 회원은 회사의 명시적 사전 동의가 없는 한 서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여할 수 없으며 이를 담보로 제공할 수 없습니다.
4. 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다.
5. 회원은 회사의 사전 허락 없이 회사가 정한 이용 목적과 방법에 반하여 영업/광고활동 등을 할 수 없고, 회원의 서비스 이용이 회사의 재산권, 영업권 또는 비즈니스 모델을 침해하여서는 안됩니다.
6. 회사는 회원이 게시하거나 등록하는 서비스 내의 게시물, 게시 내용이 제1항에서 규정하는 금지행위에 해당된다고 판단되는 경우, 사전통지 없이 이를 삭제하거나 이동 또는 등록을 거부할 수 있습니다.

서비스의 제공 및 변경
1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.
1) 게임 관련 '전적 검색' 서비스
2) 게임 관련 '유저간 피드백' 서비스
3) 게임 관련 '랭킹' 및 '통계' 서비스
4) 동영상 링크 제공 서비스
5) 기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는, 그리고 제공 할 일체의 서비스
2. 회사는 다음 각 호의 어느 하나에 해당하는 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 회사는 회원에게 공지사항 및 페이지의 특정 공간에 잘 보이도록 표시하는 방법으로 통지합니다. 다만, 회사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
1) 컴퓨터 등 정보통신설비의 보수점검, 교체, 정기점검 또는 게임 내용이나 서비스의 수정을 위하여 필요한 경우
2) 해킹 등의 전자적 침해사고, 통신사고, 회원들의 비정상적인 게임 이용행태, 미처 예상하지 못한 서비스의 불안정성에 대응하기 위하여 필요한 경우
3) 관련 법령에서 특정 시간 또는 방법으로 서비스 제공을 금지하는 경우
4) 천재지변, 비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우
5) 회사의 분할, 합병, 영업양도, 영업의 폐지, 당해 서비스의 수익 악화 등 회사의 경영상 중대한 필요에 의한 경우
3. 회사는 회원과 별도로 서면 계약을 체결하여 게임 전적 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 회원에게 회사 또는 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다.
4. 회사가 제공하는 서비스의 형태와 기능, 디자인 등 필요한 경우 수시로 변경되거나, 중단될 수 있습니다. 회사는 이 경우 개별적인 변경에 대해서 회원에게 사전 통지하지 않습니다.
5. 전항에 의해서 제공되는 서비스가 변경 및 중단될 경우 무료로 제공되는 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다. 다만, 회사의 고의 또는 중대한 과실로 인하여 발생한 손해의 경우는 제외합니다.
6. 회사는 회원이 연동한 '내 소환사명'에 대한 소환사 정보를 게임 전적 서비스 및 제반 서비스에 이용·제공 할 수 있습니다.

게시물의 삭제 또는 이용 제한
1. 회원의 공개게시물의 내용이 다음 각 호에 해당하는 경우 회사는 해당 게시물을 삭제 또는 해당 회원의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
1) 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
2) 음란물, 욕설 등 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
3) 범죄행위와 관련이 있다고 판단되는 내용
4) 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
5) 종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 회사의 업무가 방해되거나 방해되리라고 판단되는 경우
6) 타인의 개인정보, 사생활을 침해하거나 명예를 손상시키는 경우
7) 동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우
8) 불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우
2. 회원의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예: 고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 회사는 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한하거나 수정, 삭제 권한을 임시로 제한할 수 있습니다.

광고의 게재
1. 회사는 서비스 운영과 관련하여 회원정보, 고객이 입력한 정보를 활용하여 광고를 게재할 수 있습니다. 회원은 서비스 이용 시 노출되는 맞춤 광고 게재에 대해 동의합니다.
2. 회사는 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.

전자우편을 통한 정보의 제공
1. 회사는 회원이 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원이 제공한 전자우편 주소로 제공할 수 있습니다.
2. 회사는 사전에 회원으로부터 광고성 전자우편 수신에 대한 동의를 받은 경우에 한하여, 서비스 운영을 위해 회원정보를 활용하여 영리목적의 광고성 전자우편을 전송할 수 있습니다. 회원이 이를 원하지 않는 경우에는 언제든지 서비스 홈페이지 또는 서비스 내부 설정페이지 등을 통하여 수신거부를 할 수 있습니다.
3. 회사는 다음 각호에 해당하는 경우 회원의 동의여부와 상관없이 전자우편으로 발송할 수 있습니다.
1) 이용 신청에서 입력한 전자우편 주소의 소유를 확인하기 위해서 인증메일을 발송하는 경우
2) 회원의 정보가 변경되어 확인하기 위해서 인증메일을 발송하는 경우
3) 기타 서비스를 제공함에 있어 회원이 반드시 알아야 하는 중대한 정보라고 회사가 판단하는 경우
4) 회원이 계속해서 1주일 이상 로그인하지 않는 경우
5) 아이디/비밀번호 분실로 인한 정보 찾기 기능을 이용하여 인증메일을 발송하는 경우 (단, 가입 신청한 회원 본인 뿐 아니라 누구든지 이 기능으로 인증메일 발송을 요구 할 수 있음)

서비스 이용의 제한
1. 회사는 천재지변이나 국가비상사태, 해결이 곤란한 기술적 결함 또는 서비스 운영의 심각한 변화 등 불가항력적인 경우가 발생 또는 발생이 예상될 때는 서비스의 전부 또는 일부를 예고 없이 제한하거나 중지할 수 있습니다.
2. 서비스를 이용하게 됨으로써 서비스 영역에서 발생하는 회원 사이의 문제에 대해 회사는 책임을 지지 않습니다.
3. 회원의 관리 소홀로 인하여 ID 및 비밀번호의 유출로 인해 회원에게 서비스 이용상의 손해가 발생하거나 제3자에 의한 부정이용 등으로 회원의 의무조항을 위반한 경우 ID 및 해당 도메인의 이용이 제한되거나 이용 계약이 해지될 수 있습니다.
4. 회사가 본 약관 '회원의 의무'의 위반 행위를 조사하는 과정에서 당해 회원 ID 및 도메인이 특정 위반행위에 직∙간접적으로 관련되어 있는 경우 등 다른 회원의 권익 보호 및 서비스의 질서유지를 위해 불가피할 경우에는 해당 ID 및 도메인의 이용을 일시적으로 정지할 수 있습니다.
5. 회원이 본 조에 따른 회사의 이용제한에 불복하고자 할 때에는 통보를 받은 날로부터 15일 이내에 회사의 이용제한에 불복하는 이유를 기재한 이의신청서를 서면, 전자우편 또는 이에 준하는 방법으로 회사에 제출하여야 합니다. 이의신청서를 접수한 회사는 접수한 날로부터 15일 이내에 회원의 불복 이유에 대하여 서면, 전자우편 또는 이에 준하는 방법으로 답변하고 답변 내용에 따라 상응하는 조치를 취하여야 합니다. 다만, 회사는 15일 이내에 답변이 곤란한 경우 회원에게 그 사유와 처리일정을 통보하여야 합니다.


게시물의 권리와 책임
1. 회원이 서비스 내에 작성한 텍스트, 이미지, 동영상, 링크 등의 기타 정보(이하 "게시물")에 대한 책임 및 권리는 게시물을 등록한 회원에게 있습니다.
2. 회사는 회원이 작성한 컨텐츠에 대해서 감시 및 관리할 수 없으며 이에 대해서 책임지지 않습니다. 회사는 회원이 등록하는 게시물의 신뢰성, 진실성, 정확성 등에 대해서 책임지지 않으며 보증하지 않습니다.
3. 서비스에 대한 저작권 및 지적재산권, 회사가 작성한 게시물의 저작권은 회사에 귀속됩니다. 단, 회원이 단독 또는 공동으로 작성한 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
4. 회원은 자신이 서비스 내에 게시한 게시물을 회사가 국내·외에서 다음 목적으로 사용하는 것을 허락합니다.
1) 서비스(제3자가 운영하는 사이트 또는 미디어의 일정 영역 내에 입점하여 서비스가 제공되는 경우를 포함합니다)내에서 게시물을 사용하기 위하여 게시물의 크기를 변환하거나 단순화하는 등의 방식으로 수정하는 것
2) 회사에서 운영하는 다른 사이트 또는 다른 회사가 운영하는 사이트에 게시물을 복제·전송·전시하는 것
3) 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 게시물의 내용을 보도, 방영하게 하는 것. 단, 이 경우 회사는 회원의 개별 동의 없이 미디어, 통신사 등에게 게시물 또는 회원정보를 제공하지 않습니다.
5. 회원이 회원탈퇴를 한 경우에는 본인 도메인에 기록된 저작물 일체에 대한 수정·삭제 권한을 잃게 됩니다. 탈퇴될 경우 해당 저작물이 자동으로 삭제 될 수 있습니다. 단, 저작물이 공동 저작을 통해 작성된 경우에는 공동 저작자의 도메인에 해당 게시물이 남을 수 있고, 제3자에 의하여 보관되거나 무단복제 등을 통하여 복제됨으로써 해당 저작물이 삭제되지 않고 재 게시된 경우에 대하여 회사는 책임을 지지 않습니다. 또한, 본 약관 및 관계 법령을 위반한 회원의 경우 다른 회원을 보호하고, 법원, 수사기관 또는 관련 기관의 요청에 따른 증거자료로 활용하기 위해 회원탈퇴 후에도 관계 법령이 허용하는 한도에서 회원의 아이디 및 회원정보를 보관할 수 있습니다.
6. 회원의 게시물 또는 저작물이 회사 또는 제3자의 저작권 등 지적재산권을 침해함으로써 발생하는 민∙형사상의 책임은 전적으로 회원이 부담하여야 합니다.

게시물의 관리
1. 회원의 게시물이 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다.
2. 회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 본 약관 및 기타 회사 정책, 관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.
3. 회원이 비공개로 설정한 게시물에 대해서는 회사를 포함한 다른 사람이 열람할 수 없습니다. 단, 법원, 수사기관이나 기타 행정기관으로부터 정보제공을 요청 받은 경우나 기타 법률에 의해 요구되는 경우에는 회사를 포함한 다른 사람이 해당 게시물을 열람할 수 있습니다.

서비스 이용의 중지 및 해지
1. 회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며, 회사는 이와 같은 요청을 받았을 경우, 회사가 별도로 고지한 방법에 따라 신속하게 처리합니다.
2. 회원이 서비스의 이용중지를 원하는 경우에는 회사가 제공하는 서비스 페이지를 통해 회사에 중지신청을 할 수 있습니다. 회사는 이와 같은 요청을 받았을 경우, 회사가 별도로 고지한 방법에 따라 신속하게 처리합니다.
3. 회사는 회원이 본 약관 '회원의 의무'를 위반한 경우 및 서비스의 정상적인 운영을 방해한 경우에는 사전 통보 후 회원 자격을 제한, 이용계약을 해지하거나 또는 기간을 정하여 서비스의 이용을 중지할 수 있습니다.
4. 회사는 전항에도 불구하고, 저작권법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다.
5. 회사는 회원이 계속해서 1년 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
6. 회원이 본 조에 따른 회사의 이용제한에 불복하고자 할 때에는 통보를 받은 날로부터 15일 이내에 회사의 이용제한에 불복하는 이유를 기재한 이의신청서를 서면, 전자우편 또는 이에 준하는 방법으로 회사에 제출하여야 합니다. 이의신청서를 접수한 회사는 접수한 날로부터 15일 이내에 회원의 불복 이유에 대하여 서면, 전자우편 또는 이에 준하는 방법으로 답변하고 답변 내용에 따라 상응하는 조치를 취하여야 합니다. 다만, 회사는 15일 이내에 답변이 곤란한 경우 회원에게 그 사유와 처리일정을 통보하여야 합니다.

책임제한
1. 회사는 회원의 약관, 서비스 이용 방법 및 이용 기준을 준수하지 않는 등 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.
2. 회사는 서비스를 통하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 보증하지 않습니다.
3. 회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
4. 회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
5. 회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지, 제3자가 제공하는 오픈아이디의 인증 장애, 해결이 곤란한 기술적 결함 기타 불가항력으로 인하여 서비스를 제공할 수 없는 경우 책임이 면제됩니다.
6. 회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대하서는 책임이 면제됩니다.
7. 회원은 자신의 결정에 의하여 회사의 서비스를 사용하여 특정 프로그램이나 정보 등을 다운받거나 접근함으로써 입게 되는 컴퓨터 시스템상의 손해나 데이터, 정보의 상실에 대한 책임을 집니다.
8. 회사는 기간통신사업자가 전기통신서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우에는 책임이 면제됩니다.
9. 회원의 컴퓨터 오류, 신상정보 및 전자우편 주소의 부정확한 기재, 비밀번호 관리의 소홀 등 회원의 귀책사유로 인해 손해가 발생한 경우 회사는 책임을 지지 않습니다.
10. 회사는 회원의 컴퓨터 환경이나 회사의 관리 범위에 있지 아니한 보안 문제로 인하여 발생하는 제반 문제 또는 현재의 보안기술 수준으로 방어가 곤란한 네트워크 해킹 등 회사의 귀책사유 없이 발생하는 문제에 대해서 책임을 지지 않습니다.
11. 회사는 서비스가 제공한 내용에 대한 중요 정보의 정확성, 내용, 완전성, 적법성, 신뢰성 등에 대하여 보증하거나 책임을 지지 않으며, 사이트의 삭제, 저장실패, 잘못된 인도, 정보에 대한 제공에 대한 궁극적인 책임을 지지 않습니다. 또한, 회사는 회원이 서비스 내 또는 웹사이트상에 게시 또는 전송한 정보, 자료, 사실의 신뢰도, 정확성, 완결성, 품질 등 내용에 대해서는 책임을 지지 않습니다.
12. 회사는 회원 상호간 또는 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.
13. 회사는 회원이 서비스를 이용하여 기대하는 효용을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
14. 회사는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 않습니다.
15. 회사는 관련 법령, 정부 정책 등에 따라 서비스 또는 회원에 따라 서비스 이용시간 등을 제한할 수 있으며, 이러한 제한사항 및 제한에 따라 발생하는 서비스 이용 관련 제반 사항에 대해서는 책임이 면제됩니다.

준거법 및 재판관할

1. 본 약관은 대한민국법을 준거법으로 합니다.
2. 회사와 회원간 발생한 분쟁에 관한 소송의 관할법원은 민사소송법 상의 관할법원으로 합니다.
    </textarea>
    </div>

    <!-- 개인정보동의 체크박스-->
    <div class="my-2 align-items-center">
        <div class="form-check d-flex justify-content-between" style="padding:0;">
            <div style="padding-right:30px; float: left;">
          <label for="agree2" class="form-check-label text-white" style="text-align: left;">개인정보 수집 및 이용에 관한 동의</label>
        </div>
        <div>
        <input id="checkbox2" name="checkTmp" type="checkbox"  class="form-check-input">
    </div>
        </div>
      </div>
      
    <div class="form-floating">
        <textarea style="width:100%; height: 100px; resize:none;">
개인정보 수집∙이용 동의서

'롤판.DOG'의 홈페이지 회원 가입을 신청하시는 분께 아래와 같이 개인정보의 수집·이용목적, 수집하는 개인정보의 항목, 개인정보의 보유 및 이용기간을 안내하여 드리오니 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.

다만, 만 14세 미만의 아동은 홈페이지 회원 가입 신청이 제한되며, '롤판.DOG'은(는) 만 14세 미만 아동의 개인정보를 수집·이용하지 않습니다.

개인정보의 수집·이용 목적
'롤판.DOG'은(는) 개인정보를 다음의 목적을 위해 수집·이용합니다. 수집한 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.

1. 홈페이지 회원가입 및 관리
회원 가입의사 확인, 회원자격 유지•관리, 서비스 부정이용 방지, 각종 고지•통지, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 수집·이용합니다.

2. 민원사무 처리
민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 수집·이용합니다.

3. 재화 또는 서비스 제공
서비스 제공, 콘텐츠 제공 등을 목적으로 개인정보를 수집·이용합니다.

4. 마케팅 및 광고에의 활용
신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 수집·이용합니다.

수집하는 개인정보의 항목
'롤판.DOG'은(는) 다음의 개인정보 항목을 수집합니다.

1) 홈페이지 회원가입 및 관리
수집 정보: 이메일 주소, 닉네임, 비밀번호

2) 민원사무 처리
수집 정보: 이메일 주소

3) 재화 또는 서비스 제공
수집 정보 : 이메일 주소, 닉네임, 비밀번호, 리그오브레전드 아이디
4) 마케팅 및 광고에의 활용
선택: 이메일 주소
5) 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 기록 및 수집될 수 있습니다.
접속 IP정보, 쿠키, 접속로그, 서비스 이용기록, 이용제한 기록 등

개인정보의 보유 및 이용 기간
1. '롤판.DOG'은(는) 법령에 따른 개인정보 보유∙이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유∙이용기간 내에서 개인정보를 처리, 보유합니다.
2. 각각의 개인정보 보유 및 이용 기간은 다음과 같습니다.

1) 홈페이지 회원가입 및 관리: 홈페이지 탈퇴일로부터 1개월이 경과하는 날까지. 다만, 관계 법령 위반에 따른 수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시까지.

2) 민원사무 처리: 민원사무 처리 완료 시까지.

3) 재화 또는 서비스 제공: 재화·서비스 공급 완료 시까지.

4) 마케팅 및 광고에의 활용: 홈페이지 탈퇴 시까지.

기타 사항
1. 개인정보 수집 및 이용에 대해서는 거부할 수 있으며, 거부 시에는 회원가입이 불가합니다.
2. 서비스 제공을 위해서 반드시 필요한 최소한의 개인정보이므로 동의를 하셔야 서비스 이용이 가능합니다.
3. 이 외 서비스 이용과정에서 별도 동의를 통해 추가정보 수집이 있을 수 있습니다.</textarea>

<div style="padding-top: 10px;">
    <div style="width:50%; float:left;">
    <button  class="btn btn-lg btn-secondary" type="button" style="float:center; width: 80%;" onclick = "history.back()">취소</button>
</div>
<div style="width:50%; float:right;">    
<button id="next" class="btn btn-lg btn-secondary" type="button" disabled onclick="location.href = '/joinform2_kakao?id=${id}';" style="float:center; width: 80%;">동의</button>
</div>
</div>    
  </form>
</main>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
     $('#checkAll').change(function () { 
    	 var checked = $(this).prop('checked'); 
    	 $('input[name="checkTmp"]').prop('checked', checked); });
     
$('input[name="checkTmp"]').change(function () { 
	var tmpLength = $('input[name="checkTmp"]').length; 
	var checkedLength = $('input[name="checkTmp"]:checked').length; 
	var selectAll = (tmpLength == checkedLength); $('#checkAll').prop('checked', selectAll); selectAll ? $('#next').removeAttr('disabled'):$('#next').attr('disabled','disabled'); });

$('#checkAll').change(function () {
    $(this).prop('checked') ? $('#next').removeAttr('disabled'):$('#next').attr('disabled','disabled'); });
let sweetalert=(icon,title,contents)=>{
    Swal.fire({
        icon: icon,
        title: title,
        text: contents,
        confirmButtonText: "확인"
    })
	};
	let kakao="<c:out value='${kakao}'/>";
	if(kakao=="yes"){
		Swal.fire({
			title: "가입 요망",
			text: "카카오 연동으로 회원가입을 진행합니다",
			icon: "warning",
			confirmButtonText: "확인"
		})
	}
</script>
 </body>
</html>
