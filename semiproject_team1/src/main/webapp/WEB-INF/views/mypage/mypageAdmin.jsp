<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
          href="/resources/asset/image/login/dog1.png"/>
    <title>관리자 페이지 - 롤판.DOG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageAdmin.css">
</head>
<body>
<div class="container" style="background-attachment: fixed;">
    <%-- 헤더 영역--%>
    <div class="header">
        <h1>
            <a href="/main_admin"> <img class="mb-4"
                              src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
                              alt="" width="60" height="60"> LOLPAN.DOG
            </a>
        </h1>
        <div class="nav">
            <div class="nav">
                <ul>
					<c:choose>
						<c:when test="${not empty mem_mno }">
							<li><a href="/mypage_admin">관리자페이지</a></li>
							<li><a href="/log_out?page=main">로그아웃</a></li>
							<li style="color:white;">
								<img class="mb-4"
								src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
								alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
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

    <%-- 바디 영역 --%>
    <div class="body_feedback">
    	<div class="body_feedback_mar">
            <%-- main 컨테이너 --%>
            <div class="main_container">
            	<div class="board_header">
            		<div style="margin-top: 10px;">
	                    <center><h3 style="color:white">리그오브레전드 아이디 연동 요청 계정</h3></center><br>
	                    <center><h4 style="color:orangered">관리자께서는 관리자 아이디로 리그오브레전드 클라이언트에 접속하시어</h4></center>
	                    <center><h4 style="color:orangered">아래의 요청 아이디로 발급 코드를 전송하시기 바랍니다</h4></center>
            		</div>
                </div>
                <div class="feedback_body">
                    <c:choose>
                            <c:when test="${memList!=null }">
                                <section id="listForm">
                                    <c:forEach var="mem" items="${memList }">
                                        <div class="each_post">
                                        	<c:choose>
                                        		<c:when test="${not empty mem.mem_email_id }">
		                                            <div class="each_board_likecount">
		                                            	LOLPAN.DOG 아이디<br>
		                                            	${mem.mem_email_id}
		                                            </div>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<div class="each_board_likecount">
		                                            	LOLPAN.DOG 아이디<br>
		                                            	${mem.mem_kakao_id}
		                                            </div>
                                        		</c:otherwise>
                                        	</c:choose>
                                            <div class="each_board_likecount">
                                            	리그오브레전드 아이디<br>
                                            	${mem.mem_link_id }
                                            </div>
                                            <div class="each_board_likecount">
                                            	연동 발급 코드<br>
                                            	${mem.mem_link_code }
                                            </div>
                                            <div class="each_board_readcount">
                                            	<div class="hero"">
                                            		<c:choose>
		                                        		<c:when test="${not empty mem.mem_email_id }">
				                                            <form action="/admin_confirm" method="post">
		                                            			<input type="hidden" name="mem_email_id" value="${mem.mem_email_id }"/>
																<button type="submit">확인</button>
		                                            		</form>
		                                        		</c:when>
		                                        		<c:otherwise>
		                                        			<form action="/admin_confirm" method="post">
		                                            			<input type="hidden" name="mem_kakao_id" value="${mem.mem_kakao_id }"/>
																<button type="submit">확인</button>
		                                            		</form>
		                                        		</c:otherwise>
		                                        	</c:choose>
												</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </section>

                                <div class="attach_ajax_list"></div>
                                <div class="loading"> 로 딩 중 . . .</div>

                            </c:when>
                            <c:otherwise>
                                <section id="emptyArea">등록된 글이 없습니다.</section>
                            </c:otherwise>
                        </c:choose>
                </div><br><br><br>
            </div>
        </div>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- 무한스크롤 --%>
<script>
    /* let currentPage = 1;
    let isLoading = false; */


    /* div 내 무한스크롤 시작 */
    /* $(".feedback_body").scroll(function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            return;
        }
        isLoading = true;
        $(".loading").show();
        setTimeout(loadNewPage, 1400);
    }); */
    /* div 내 무한스크롤 끝 */
</script>
<%-- 끝 : 무한스크롤 --%>


<script>
    /* $(function () {
        let fixx = $(".feedback_header").offset().top;
        $(window).scroll(function () {
            let window = $(this).scrollTop() + 80;
            if (fixx <= window) {
                $(".feedback_header").addClass("fixed");
                $(".feedback_body").addClass("fixed");
            } else {
                $(".feedback_header").removeClass("fixed");
                $(".feedback_body").removeClass("fixed");
            }
        })
    }); */
</script>


<%--div내 무한스크롤 테스트 스크립트--%>
<script>
    // $(".testList").scroll(function () {
    //     if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
    //         $(".red").append("<div class='blue' style='background: blue; width: 100px; height: 100px'' ></div>");
    //     }
    // });
</script>


</body>
</html>