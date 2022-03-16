<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section id="listForm">
    <c:forEach var="article" items="${articleList }">
        <div class="each_post">
            <div class="each_board_likecount">
                <br>♥<br>${article.board_likecount }</div>
            <div class="each_board_content">
                <div class="each_board_sub">
                    <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
                            ${article.board_subject}&nbsp;[${article.board_replycount}]
                            <c:choose>
                                                        	<c:when test="${article.board_cat eq 'highlight'}">
                                                        		<div style="float:right; color:#4169E1;;">하이라이트</div>
                                                        	</c:when>
                                                        	<c:when test="${article.board_cat eq 'tip'}">
                                                        		<div style="float:right; color:#4169E1;;">팁</div>
                                                        	</c:when>
                                                        	<c:otherwise>
                                                        		<div style="float:right; color:#4169E1;;">자유</div>
                                                        	</c:otherwise>
                                                        </c:choose>
                    </a>
                </div>
                <div class="each_board_sub_bottom">
                    <div class="each_board_date"><br><fmt:formatDate
                            value="${article.board_date }"
                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                    <div class="each_board_nickname"><br>
                        § 닉네임 : ${article.board_nickname }</div>
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
                            src="${pageContext.request.contextPath}/resources/asset/image/every/noimage.png"
                            alt="thumbnail" class="thumbnail_size"/>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</section>