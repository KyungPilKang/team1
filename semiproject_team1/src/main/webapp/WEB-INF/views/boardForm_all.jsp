<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Star Admin2 Dashboard</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../static/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../static/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="../static/vendors/codemirror/codemirror.css">
    <link rel="stylesheet" href="../static/vendors/codemirror/ambiance.css">
    <link rel="stylesheet" href="../static/vendors/pwstabs/jquery.pwstabs.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <%-- 아이콘 경로 설정해줘야함 --%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png"/>


    <!-- 템플릿x, 개인적으로 적용한 css를 우선 페이지 내 적은 후 추후 분리예정 -->
    <style>
        .sub-link__list {
            display: flex;
            list-style-type: none;
        }

        .sub-link__item > a {
            text-decoration: none;
            color: black;
            margin: 40px;
        }

        .board_search_container {
            /* background-color: red; */
            width: 300px;
            height: 36px;
        }

        .board_search_select {
            float: left;
            height: 33px;
        }

        .board_search_form {
            float: left;
            width: 200px;
        }

        .board_header {
            margin-left:50px;
            width: 1000px;
        }

        .board_body {
            margin-left:50px;
            width: 1000px;
        }


        .board_body_inner{
            background: #f58282;

        }

        .each_post{
            background: #b4b4f3;
            border : 1px solid black;
            /*width: 800px;*/
            height: 50px;
            display: flex;
        }

        .each_board_num{
            margin:10px;
            width: 50px;
            /*height:50px;*/
            background: red;

        }

        .each_board_sub{
            width: 550px;
            /*height:50px;*/
            background: #ff6a00;
        }

        .each_board_nickname{
            width: 50px;
            /*height:50px;*/
            background: #fcdc10;
        }

        .each_board_date{
            width: 150px;
            /*height:50px;*/
            background: #41fc18;
        }

        .each_board_replycount{
            width: 50px;
            /*height:50px;*/
            background: #0739ff;
        }

        .each_board_cat{
            width: 50px;
            /*height:50px;*/
            background: #7c00ff;
        }

        .each_board_likecount{
            width: 50px;
            /*height:50px;*/
            background: #fc8383;
        }

        #search_submit{
            display: none;
        }

    </style>


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
                                            <div class="board_search_container">
                                                <select class="btn-sm btn-secondary board_search_select">
                                                    <option value="1">제목</option>
                                                    <option value="2">작성자</option>
                                                    <option value="3">내용</option>
                                                </select>
                                                <li class="board_search_form">
                                                    <form class="search-form" action="#">
                                                        <i class="icon-search"></i>
                                                        <input type="search" class="form-control"
                                                               placeholder="Search Here" title="Search here">
                                                    </form>
                                                    <div class="board_file_cont">
                                                        <label for="search_submit" style="cursor: pointer"> 돋보기 아이콘 </label>
                                                        <input type="submit" id="search_submit" onclick="alert('임시작동확인')"/>
                                                    </div>
                                                </li>
                                            </div>
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
                                                            <div class="each_board_likecount">${article.board_likecount }</div>
                                                            <div class="each_board_num">보드넘${article.board_num }</div>
                                                            <div class="each_board_sub">
                                                                <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                                                                        ${article.board_subject}
                                                                </a>
                                                            </div>

                                                            <div class="each_board_cat">카${article.board_cat }</div>
                                                            <div class="each_board_date">날짜${article.board_date }</div>
                                                            <div class="each_board_nickname">닉네임${article.board_nickname }</div>
                                                            <div class="each_board_replycount">리플수${article.board_replycount }</div>
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