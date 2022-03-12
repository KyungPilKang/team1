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


    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardForm_all.css">
</head>
<body>
<div class="container" style="background-attachment: fixed;">
    <%-- 헤더 영역--%>
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
                            <%--                        <c:when test="${empty mem_mno }">--%>
                            <li><a href="">DUO</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/loginform?page=board">로그인</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>

    <%-- 바디 영역 --%>
    <div class="body_board">
        <div class="body_board_mar">
            <%-- 좌측 메뉴 --%>
            <div class="card_left">
                <div class="card_outline">
                    <%--                    <c:if test="${not empty mem_mno }">--%>
                    <c:if test="${not empty mem_mno }">
                        <div class="user_info_box">
                            <img class="mb-4"
                                 src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
                                 alt="" width="30" height="30">${mem_nickname }님 환영합니다
                            <br><br><br><br>
                            <div class="nav">
                                <ul>
                                    <li><a href="/boardwriteform">글쓰기</a></li>
                                    <li><a href="/mypage">마이페이지</a></li>
                                    <li><a href="/log_out?page=board">로그아웃</a></li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <div class="card">
                        <ul class="list">
                            <li><h6>HOME</h6>
                                <ul class="list">
                                    <li><a href="/boardlist">전체</a></li>
                                </ul>
                                <hr>
                            </li>
                            <li><h6>LOL</h6>
                                <ul class="list">
                                    <li><a href="/boardlist_highlight">하이라이트</a></li>
                                    <li><a href="#">팁&노하우</a></li>
                                </ul>
                            </li>
                            <hr>
                            <li><h6>COMMUNITY</h6>
                                <ul class="list">
                                    <li><a href="#">자유</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <%-- main 컨테이너 --%>
            <div class="main_container">
                <%-- main 컨테이너의 위쪽 --%>
                <div class="board_header" style="z-index: 2;">
                    <div class="hd-link"><h3 class="">전체</h3>
                    <c:choose>
                        <c:when test="${not empty mem_mno}">
                            <div class="pencil"><a href="/boardwriteform"><i class="fa-solid fa-pencil"></i></a></div>
                        </c:when>
                        <c:otherwise>
                            <div class="pencil"><a href="void(0)" onclick="alert('로그인이 필요합니다:)');return false;"><i class="fa-solid fa-pencil"></i></a></div>
                        </c:otherwise>
                    </c:choose>
                    </div>
                    <div class="sub-link" id="sub-menu">
                        <ul class="sub-link__list">
                            <li class="sub-link__item ">
                                <a href="/boardlist">
                                    <i class="fa-brands fa-free-code-camp"></i> <span>최신</span>
                                </a>
                            </li>
                            <li class="sub-link__item sub-link__item--active">
                                <a href="/board_all_viewssort">
                                    <i class="fa-brands fa-free-code-camp"></i> <span>조회수</span>
                                </a>
                            </li>
                            <li class="sub-link__item ">
                                <a href="/board_all_replysort">
                                    <i class="fa-brands fa-free-code-camp"></i> <span>댓글</span>
                                </a>
                            </li>
                            <li class="sub-link__item ">
                                <a href="board_all_likesort">
                                    <i class="fa-brands fa-free-code-camp"></i> <span>좋아요</span>
                                </a>
                            </li>
                            <%-- 검색 --%>
                            <li class="board_search_form">
                                <div class="board_search_container">
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
                                        <div class="board_file_cont">
                                            <label for="search_submit" style="cursor: pointer"><i
                                                    class="fa-solid fa-magnifying-glass"></i> </label>
                                            <input type="submit" id="search_submit"/>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <%-- main 컨테이너의 아래쪽 (게시판이 들어갈 공간) --%>
                <div class="board_body" style="z-index: 1;">
                    <c:choose>
                        <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                            <section id="listForm">
                                <c:forEach var="article" items="${articleList }">
                                    <div class="each_post">
                                        <div class="each_board_likecount">
                                            <br>♥<br>${article.board_likecount }</div>
                                        <div class="each_board_content">
                                            <div class="each_board_sub">
                                                <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                                                        ${article.board_subject}&nbsp;[${article.board_replycount}]
                                                </a>
                                            </div>
                                            <div class="each_board_sub_bottom">
                                                <div class="each_board_cat"><br>${article.board_cat }</div>
                                                <div class="each_board_date"><br><fmt:formatDate
                                                        value="${article.board_date }"
                                                        pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                <div class="each_board_nickname"><br>
                                                    ${article.board_nickname }</div>
                                            </div>
                                        </div>

                                        <div class="each_board_readcount">
                                            <br>▲<br>${article.board_readcount }</div>

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
            <%-- 우측 메뉴 --%>
            <div class="card_right">
            </div>

        </div>
    </div>
</div>
<div class="footer">

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- 무한스크롤 --%>
<script>
    let currentPage = 1;
    let isLoading = false;

    $(".board_body").scroll(function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            return;
        }
        isLoading = true;
        $(".loading").show();
        setTimeout(loadNewPage, 1400);
    });

    /* $(window).on("scroll", function () {
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
    }); */

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
        let fixx = $(".board_header").offset().top;
        $(window).scroll(function () {
            let window = $(this).scrollTop() + 80;
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