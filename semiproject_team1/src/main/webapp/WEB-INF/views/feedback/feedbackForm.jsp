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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackForm.css">
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
            <a href="/"> <img class="mb-4"
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
                            <%--                        <c:when test="${empty mem_mno }">--%>
                            <li><a href="">DUO</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/login?page=board">로그인</a></li>
                            <li><a href="/loginform?page=board">로그인</a></li>
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
                <%-- main 컨테이너의 위쪽 --%>
                <div class="feedback_header" style="z-index: 2;">

                    <div class="fd_hd_left" id="fd_hdu">
                        <ul class="fd_hd_list">
                            <li class="fd_hd_item">
                                <a href="/boardlist">
                                    <img src="https://talk.op.gg/images/icon-new@2x.png" width="24"
                                         alt=""><span>최신</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="/board_all_viewssort">
                                    <img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"
                                         alt=""><span>조회수</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="/board_all_replysort">
                                    <img src="https://talk.op.gg/images/icon-top@2x.png" width="24"
                                         alt=""><span>댓글</span>
                                </a>
                            </li>
                            <li class="fd_hd_item">
                                <a href="board_all_likesort">
                                    <img src="https://talk.op.gg/images/icon-boost@2x.png" width="24"
                                         alt=""><span>좋아요</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="fd_hd_right">
                        <div class="fd_search_container">
                            <%--action의 경로는 컨트롤러 매핑이랑 같고, 아래 select name의 type은 dto랑 동일해야한다.--%>
                            <form class="search-form" id="boardform" method="get"
                                  action="/board_search">
                                <select class=""
                                        name="board_type">
                                    <option value="1">제목</option>
                                    <option value="2">작성자</option>
                                    <option value="3">내용</option>
                                </select>
                                <input type="search" class="form-control"
                                       placeholder="Search Here" title="Search here"
                                       name="board_keyword">
                                <label for="search_submit" style="cursor: pointer"><i
                                        class="fa-solid fa-magnifying-glass"></i></label>
                                <input type="submit" id="search_submit"/>
                            </form>
                        </div>
                        <button type="button" class="request_btn" onclick="location.href='/feedbackwriteform' ">
                            REQUEST
                        </button>
                    </div>
                </div>
                <%-- main 컨테이너의 아래쪽 (게시판이 들어갈 공간) --%>
                <div class="feedback_body">

                    <c:choose>
                        <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                            <section id="listForm">
                                <c:forEach var="article" items="${articleList }">
                                    <div class="each_post">
                                        <c:choose>
                                            <c:when test="${article.board_thumbnail != null }">
                                                <div class="each_board_thumbnail"
                                                     id="each_board_thumbnail"><img
                                                        src="/thumbnail_view/${article.board_thumbnail}"
                                                        alt="thumbnail" class="thumbnail_size"/>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="each_board_thumbnail"
                                                     id="each_board_thumbnail"><img
                                                        src="https://talk.op.gg/images/thumbnail/post_hidden.png"
                                                        alt="thumbnail" class="thumbnail_size"/>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="each_board_likecount"><br>
                                            ♥<br>${article.board_likecount }</div>
                                        <div class="each_board_content">
                                            <div class="each_board_sub">
                                                <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                                                        ${article.board_subject}&nbsp;[${article.board_replycount}]
                                                </a>
                                            </div>
                                            <div class="each_board_sub_bottom">
                                                <div class="each_board_date"><br><br><br><fmt:formatDate
                                                        value="${article.board_date }"
                                                        pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                <div class="each_board_nickname"><br><br><br>
                                                    닉네임${article.board_nickname }</div>
                                            </div>
                                        </div>

                                        <div class="each_board_readcount">
                                           <br>▲<br>${article.board_readcount }</div>

                                            <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

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
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="fd_footer"></div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- 무한스크롤 --%>
<script>
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
        if ("${sort_name}" === "boardlist") {
            getList(currentPage, "boardlist");
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
            url: "http://localhost:8090/boardForm_all_ajax",
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