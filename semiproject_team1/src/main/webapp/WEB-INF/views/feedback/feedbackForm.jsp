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
    <title>피드백 게시판 - 롤판.DOG</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackForm.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<div class="container">


    <%-- div안 무한스크롤 테스트--%>
    <%--    <div class="testList" style="overflow:scroll; width: 300px; height: 500px; margin-top:100px; margin-left: 40vw;">--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--        <div class="red" style=" background: red; width: 100px; height: 100px" ></div>--%>
    <%--    </div>--%>


    <%-- 헤더 영역--%>
    <div class="header" style="z-index: 2;">
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
							<li><a href="/log_out?page=feedback">로그아웃</a></li>
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
							<li><a href="/loginform?page=feedback">로그인</a></li>	
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
    </div>

    <%-- 바디 영역 --%>
    <div class="body_feedback">
        <div class="body_feedback_mar">

            <%-- main 컨테이너 --%>
            <div class="main_container">
                <%-- main 컨테이너의 위쪽 --%>
                <div class="feedback_header" style="z-index: 2;">

                    <div class="fd_hd_left" id="fd_hdu">
                        <ul class="fd_hd_list">
                            <li class="fd_hd_item">
                                <a href="/feedback">
                                    <img src="https://talk.op.gg/images/icon-new-on@2x.png" width="24"
                                         alt=""><span>최신</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="/feedback_viewssort">
                                    <img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"
                                         alt=""><span>조회수</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="/feedback_replysort">
                                    <img src="https://talk.op.gg/images/icon-top-on@2x.png" width="24"
                                         alt=""><span>댓글</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="feedback_likesort">
                                    <img src="https://talk.op.gg/images/icon-boost-on@2x.png" width="24"
                                         alt=""><span>좋아요</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="fd_hd_right">
                        <div class="fd_search_container">
                            <%--action의 경로는 컨트롤러 매핑이랑 같고, 아래 select name의 type은 dto랑 동일해야한다.--%>
                            <form class="search-form" id="boardform" method="get"
                                  action="/feedback_search">
                                <select class=""
                                        name="feedback_type">
                                    <option value="1">제목</option>
                                    <option value="2">작성자</option>
                                    <option value="3">내용</option>
                                </select>
                                <%-- input값 name도 동일해야한다--%>
                                <input type="search" class="form-control"
                                       placeholder="Search Here" title="Search here"
                                       name="feedback_keyword">
                                <label for="search_submit" style="cursor: pointer"><i
                                        class="fa-solid fa-magnifying-glass"></i></label>
                                <input type="submit" id="search_submit"/>
                            </form>
                        </div>
                        <c:choose>
                            <c:when test="${not empty mem_mno }">
                                <button type="button" class="request_btn" onclick="location.href='/feedbackwriteform' ">
                                    <div style="font-weight:bold; font-size:1.2em;">피드백 요청</div>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="request_btn" onclick="loginalert()">
                                    <div style="font-weight:bold; font-size:1.2em;">피드백 요청</div>
                                </button>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
                <%-- main 컨테이너의 아래쪽 (게시판이 들어갈 공간) --%>
                <div class="feedback_body">

                    <c:choose>
                        <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                            <section id="listForm">
                                <c:forEach var="article" items="${articleList}">
                                        <div class="each_post">
                                            <div class="each_board_likecount">
                                              <br>♥<br>${article.feedback_likecount }</div>
                                            <div class="each_board_content">
                                                <div class="each_board_sub">
                                                    <a href="./feedbackdetail?feedback_num=${article.feedback_num}">
                                                            ${article.feedback_subject}&nbsp;[${article.feedback_answercount}]
                                                    </a>
                                                </div>
                                                <div class="each_board_sub_bottom">
                                                    <div class="each_board_date"><br><fmt:formatDate
                                                            value="${article.feedback_date }"
                                                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                    <div class="each_board_nickname"><br>
                                                        § 닉네임 : ${article.feedback_nickname }</div>
                                                </div>
                                            </div>

                                            <div class="each_board_readcount">
                                                <br>▲<br>${article.feedback_readcount }</div>

                                                <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

                                            <c:choose>
                                                <c:when test="${article.feedback_thumbnail!=null }">
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="/fd_thumbnail_view/${article.feedback_thumbnail}"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="${pageContext.request.contextPath}/resources/asset/image/every/noimage.png"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                            </section>

                            <div class="attach_ajax_list"></div>
                            <div class="loading"> 로 딩 중 . . .</div>

                        </c:when>
                        <c:otherwise>
                            <section id="emptyArea" style="color:white; text-align: center; margin-top:100px;"><h3>등록된 글이 없습니다.</h3></section>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="fd_footer">
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%-- 무한스크롤 --%>
<script>
	function loginalert(){
		Swal.fire({
			title: "권한 없음",
			text: "로그인이 필요합니다.",
			icon: "error",
			confirmButtonText: "확인"
		})
		
	}

    let currentPage = 1;
    let isLoading = false;


    /* div 내 무한스크롤 시작 */
    $(".feedback_body").scroll(function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            return;
        }
        isLoading = true;
        $(".loading").show();
        setTimeout(loadNewPage, 1400);
    });
    /* div 내 무한스크롤 끝 */


    <%--$(window).on("scroll", function () {--%>
    <%--    let scrollTop = $(window).scrollTop();--%>
    <%--    let windowHeight = $(window).height();--%>
    <%--    let documentHeight = $(document).height();--%>
    <%--    let isBottom = scrollTop + windowHeight + 10 >= documentHeight;--%>

    <%--    if (isBottom) {--%>
    <%--        if (currentPage === ${pageInfo.maxPage } || isLoading) {--%>
    <%--            return;--%>
    <%--        }--%>
    <%--        isLoading = true;--%>
    <%--        $(".loading").show();--%>
    <%--        setTimeout(loadNewPage, 1400);--%>
    <%--    }--%>
    <%--});--%>

    function loadNewPage() {
        currentPage++;
        console.log("${sort_name}")
        if ("${sort_name}" === "feedbacklist") {
            getList(currentPage, "feedbacklist");
        } else if ("${sort_name}" === "viewssort") {
            getList(currentPage, "viewssort");
        } else if ("${sort_name}" === "replysort") {
            getList(currentPage, "replysort");
        } else if ("${sort_name}" === "likesort") {
            getList(currentPage, "likesort");
        }
    }

    const getList = function (currentPage, sortType) {
        console.log("inGetList : " + currentPage);
        $.ajax({
            type: "post",
            async: false,
            url: "http://localhost:8090/feedbackForm_ajax",
            data: {
                page: currentPage,
                sort: sortType
            },
            success: function (data) {
                $('.attach_ajax_list').append(data);
                $(".loading").hide();
                isLoading = false;
            }
        })
    }
</script>
<%-- 끝 : 무한스크롤 --%>


<script>
    $(function () {
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
    });
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