<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 날짜변경 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>전체 게시판 - 롤판.DOG</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardForm_all.css">

</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="main-panel w-100  documentation">
            <div class="content-wrapper">
                <div class="container-fluid">
                    <div class="row doc-content">
                        <div class="col-12 col-md-3 grid-margin doc-table-contents">
                            <div class="card">
                                <div class="card-body">
                                    <ul class="list-arrow">
                                        <li>
                                            <a href="#">홈</a>
                                            <ul class="list-arrow">
                                                <li>
                                                    <a href="/boardlist">전체</a>
                                                </li>
                                            </ul>
                                            <hr>
                                        </li>
                                        <li>
                                            <a href="#">LOL</a>
                                            <ul class="list-arrow">
                                                <li>
                                                    <a href="/boardlist_highlight">하이라이트</a>
                                                </li>
                                                <li>
                                                    <a href="#">팁과 노하우</a>
                                                </li>
                                            </ul>
                                            <!-- 밑줄 -->
                                            <hr>
                                        </li>
                                        <li>
                                            <a href="#">커뮤니티</a>
                                            <ul class="list-arrow">
                                                <li>
                                                    <a href="#">자유</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-9 offset-md-3 grid-margin">
                        <div class="col-12 grid-margin" id="doc-intro">
                            <div class="card board_header">
                                <div class="card-body">
                                    <h3 class="mb-4">전체</h3>

                                    <div><i class="mdi mdi-lead-pencil"></i> <a href="/boardwriteform">게시판글쓰기</a></div>


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
                                                    <form class="search-form" id="boardform" method="get" action="/board_search">
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
                            </div>
                        </div>
                        <div class="col-12 grid-margin" id="doc-started">
                            <div class="card board_body">
                                <div class="card-body">
                                    <div class="board_body_inner">

                                        <c:choose>
                                            <c:when test="${articleList!=null && pageInfo.listCount>0 }">
                                                <section id="listForm">
                                                    <c:forEach var="article" items="${articleList }">
                                                        <div class="each_post">
                                                            <div class="each_board_num">보드넘${article.board_num }</div>
                                                            <div class="each_board_sub">
                                                                <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                                                                        ${article.board_subject}
                                                                </a>
                                                            </div>

                                                            <div class="each_board_cat">${article.board_cat }</div>
                                                            <div class="each_board_date"><fmt:formatDate value="${article.board_date }" pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                            <div class="each_board_nickname">
                                                                닉네임${article.board_nickname }</div>
                                                            <div class="each_board_replycount">
                                                                리플수${article.board_replycount }</div>
                                                            <div class="each_board_readcount">
                                                                조회수${article.board_readcount }</div>
                                                            <div class="each_board_likecount">
                                                                좋아요수${article.board_likecount }</div>
                                                            <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

                                                            <c:choose>
                                                            <c:when test="${article.board_thumbnail != null }">
                                                            <div class="each_board_thumbnail" id="each_board_thumbnail"><img src="/thumbnail_view/${article.board_thumbnail}" alt="thumbnail" class="thumbnail_size"/></div>
                                                            </c:when>
                                                                <c:otherwise>
                                                                    <div class="each_board_thumbnail" id="each_board_thumbnail"><img src="https://talk.op.gg/images/thumbnail/post_hidden.png" alt="thumbnail" class="thumbnail_size"/></div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </c:forEach>
                                                </section>
                                                <section id="pageList">
                                                    <c:choose>
                                                        <c:when test="${pageInfo.page<=1}">
                                                            [이전]&nbsp;
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="boardlist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:forEach var="i" begin="${pageInfo.startPage }"
                                                               end="${pageInfo.endPage }">
                                                        <c:choose>
                                                            <c:when test="${pageInfo.page==i }">[${i }]</c:when>
                                                            <c:otherwise>
                                                                <a href="boardlist?page=${i}">[${i }]</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${pageInfo.page>=pageInfo.maxPage }">
                                                            [다음]
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="boardlist?page=${pageInfo.page+1}">[다음]</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </section>
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
                </div>
            </div>
        </div>
    </div>
</div>



<%--<script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
<%--<script>--%>
<%--    function fake_submit() {--%>
<%--        alert(${pageInfo.listCount}+"건 검색 완료")--%>
<%--        $("#boardform").attr("action", "./board_search").submit();--%>
<%--    }--%>
<%--</script>--%>


<%--<script>--%>
<%--    const form = document.querySelector('#search_submit')--%>
<%--    form.addEventListener('submit', (e)=>{--%>
<%--        e.preventDefault();--%>
<%--    });--%>
<%--</script>--%>


<%--<!-- plugins:js -->--%>
<%--<script src="../template/vendors/js/vendor.bundle.base.js"></script>--%>
<%--<!-- endinject -->--%>
<%--<!-- Plugin js for this page-->--%>
<%--<script src="../template/vendors/codemirror/codemirror.js"></script>--%>
<%--<script src="../template/vendors/codemirror/javascript.js"></script>--%>
<%--<script src="../template/vendors/codemirror/shell.js"></script>--%>
<%--<script src="../template/vendors/pwstabs/jquery.pwstabs.min.js"></script>--%>
<%--<!-- End Plugin js for this page-->--%>
<%--<!-- inject:js -->--%>
<%--<script src="../template/js/template.js"></script>--%>
<%--<!-- endinject -->--%>
<%--<!-- Custom js for this page-->--%>
<%--<script src="../template/js/codeEditor.js"></script>--%>
<%--<script src="../template/js/tabs.js"></script>--%>
<%--<script src="../template/js/tooltips.js"></script>--%>
<%--<script src="documentation.js"></script>--%>
<%--<!-- End custom js for this page-->--%>

</body>

</html>