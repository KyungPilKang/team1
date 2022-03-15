<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 날짜변경 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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