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
    <title>전체 게시판 - 롤판.DOG</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardForm_all.css">
</head>
<body>
<div class="container">
    <%-- 헤더 영역--%>
    <div class="header">
        <h1>
            <a href="#"> <img class="mb-4"
                              src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
                              alt="" width="72" height="62"> LOLPAN.DOG
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

    <%-- 바디 영역 --%>
    <div class="body_board">
        <div class="body_board_mar">
            <%-- 좌측 메뉴 --%>
            <div class="card_left">
                <div class="card_outline">
                    <div class="user_info_box">회원 로그인시 정보가 입력될 공간</div>
                    <div class="card">
                        <ul class="list">
                            <li><h6>HOME</h6>
                                <ul class="list">
                                    <li><a href="/boardlist">ALL</a></li>
                                </ul>
                                <hr>
                            </li>
                            <li><h6>LOL</h6>
                                <ul class="list">
                                    <li><a href="/boardlist_highlight">HIGHLIGHT</a></li>
                                    <li><a href="#">TIP.KNOW-HOW</a></li>
                                </ul>
                            </li>
                            <hr>
                            <li><h6>COMMUNITY</h6>
                                <ul class="list">
                                    <li><a href="#">FREE</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- main 컨테이너 --%>
            <div class="main_container">
                <%-- main 컨테이너의 위쪽 --%>
                <div class="board_header">
                    <h3 class="">전체</h3>
                    <div><a href="/boardwriteform">게시판글쓰기</a></div>
                    <div class="sub-link" id="sub-menu">
                        <ul class="sub-link__list">
                            <li class="sub-link__item ">
                                <a href="/boardlist">
                                    <img src="https://talk.op.gg/images/icon-new@2x.png" width="24"
                                         alt=""><span>최신</span>
                                </a>
                            </li>
                            <li class="sub-link__item sub-link__item--active">
                                <a href="/board_all_viewssort">
                                    <img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"
                                         alt=""><span>조회수</span>
                                </a>
                            </li>
                            <li class="sub-link__item ">
                                <a href="/board_all_replysort">
                                    <img src="https://talk.op.gg/images/icon-top@2x.png" width="24"
                                         alt=""><span>댓글</span>
                                </a>
                            </li>
                            <li class="sub-link__item ">
                                <a href="board_all_likesort">
                                    <img src="https://talk.op.gg/images/icon-boost@2x.png" width="24"
                                         alt=""><span>좋아요</span>
                                </a>
                            </li>
                            <%-- 검색 --%>
                            <li class="board_search_form">
                                <div class="board_search_container">
                                    <form class="search-form" id="boardform" method="get"
                                          action="/board_search">
                                        <select class="btn-sm btn-secondary board_search_select"
                                                name="board_type">
                                            <option value="1">제목</option>
                                            <option value="2">작성자</option>
                                            <option value="3">내용</option>
                                        </select>
                                        <input type="search" class="form-control"
                                               placeholder="Search Here" title="Search here"
                                               name="board_keyword">
                                        <div class="board_file_cont">
                                            <label for="search_submit" style="cursor: pointer"> 돋보기
                                                아이콘 </label>
                                            <input type="submit" id="search_submit"/>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <%-- main 컨테이너의 아래쪽 (게시판이 들어갈 공간) --%>
                <div class="board_body">

                    <div class="board_body_inner">

                        <c:choose>
                            <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                                <section id="listForm">
                                    <c:forEach var="article" items="${articleList }">
                                        <div class="each_post">
                                            <div class="each_board_likecount">
                                                좋아요수${article.board_likecount }</div>
                                                <%-- <div class="each_board_num">보드넘${article.board_num }</div>--%>
                                            <div class="each_board_content">
                                                <div class="each_board_sub">
                                                    <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                                                            ${article.board_subject}&nbsp;[${article.board_replycount}]
                                                    </a>
                                                </div>
                                                <div class="each_board_sub_bottom">
                                                    <div class="each_board_cat">${article.board_cat }</div>
                                                    <div class="each_board_date"><fmt:formatDate
                                                            value="${article.board_date }"
                                                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                    <div class="each_board_nickname">
                                                        닉네임${article.board_nickname }</div>
                                                </div>
                                            </div>

                                                <%--     <div class="each_board_replycount">--%>
                                                <%--  리플수${article.board_replycount }</div>--%>
                                            <div class="each_board_readcount">
                                                조회수${article.board_readcount }</div>

                                                <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

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
            <%-- 우측 메뉴 --%>
            <div class="card_right">
            </div>

        </div>
    </div>
</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- 무한스크롤 --%>
<script>
    let currentPage = 1;
    let isLoading = false;

    $(window).on("scroll", function () {
        let scrollTop = $(window).scrollTop();
        let windowHeight = $(window).height();
        let documentHeight = $(document).height();
        let isBottom = scrollTop + windowHeight + 10 >= documentHeight;

        if (isBottom) {
            if (currentPage === ${pageInfo.maxPage } || isLoading) {
                return;
            }
            isLoading = true;
            $(".loading").show();
            setTimeout(loadNewPage, 1400);
        }
    });

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
        var fixx = $(".board_header").offset().top;

        $(window).scroll(function () {

            var window = $(this).scrollTop() + 80;

            if (fixx <= window) {
                $(".board_header").addClass("fixed");
                $(".board_body").addClass("fixed");
            } else {
                $(".board_header").removeClass("fixed");
                $(".board_body").removeClass("fixed");
            }
        })
    });
</script>


</body>
</html>