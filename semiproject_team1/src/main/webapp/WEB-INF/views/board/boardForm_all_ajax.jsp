<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section id="listForm">
    <c:forEach var="article" items="${articleList }">
        <div class="each_post">
            <div class="each_board_likecount">
                좋아요수${article.board_likecount }</div>
                <%--                                        <div class="each_board_num">보드넘${article.board_num }</div>--%>
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

                <%--                                        <div class="each_board_replycount">--%>
                <%--                                            리플수${article.board_replycount }</div>--%>
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