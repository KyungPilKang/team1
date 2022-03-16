<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 댓글 삽입부 시작--%>
<section id="re_listForm">
    <table class="re_listForm_table">
        <c:forEach var="reply" items="${reList }">
            <tr class="each_reply">

                <td colspan="8">
                        ${reply.fd_reply_content}
                </td>
            </tr>
            <tr class="re_list_font">
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>${reply.fd_reply_nickname }</td>
                <td><fmt:formatDate value="${reply.fd_reply_date }" pattern="M월 d일 E요일 H시"/></td>


                    <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                <c:if test="${!empty mem_nickname}">

                    <%-- 댓글 좋아요 시작 --%>
                    <td>
                        <div class="re_btn_like">
                            <c:choose>
                                <%-- 세션에 있는 유저를 확인해서 해당 댓글에 좋아요 플래그만 내려보내주면 될듯 --%>
                                <c:when test="${reply.fd_reply_like_ok == true}">
                                    <div class="re_like_mini${reply.fd_reply_num}">
                                        <div class="re_heart rh_${reply.fd_reply_num}"
                                             onclick="re_like_off(${reply.fd_reply_num})"></div>
                                        <div class="re_heart_off rh_off_${reply.fd_reply_num} rh_off_hide"
                                             onclick="re_like_on(${reply.fd_reply_num})"></div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="re_like_mini${reply.fd_reply_num}">
                                        <div class="re_heart_off rh_off_${reply.fd_reply_num}"
                                             onclick="re_like_on(${reply.fd_reply_num})"></div>
                                        <div class="re_heart rh_${reply.fd_reply_num} rh_hide"
                                             onclick="re_like_off(${reply.fd_reply_num})"></div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </c:if>
                    <%-- 좋아요 숫자 표시 --%>
                <c:if test="${empty mem_nickname}">
                    <td>
                        <div class="an_heart"></div>
                    </td>
                </c:if>
                <td>
                        ${reply.fd_reply_likecount}
                </td>
                <c:if test="${reply.fd_reply_nickname == mem_nickname}">
                    <td>
                        <button onclick="re_removeCheck(${reply.fd_reply_num})">삭제</button>
                    </td>
                </c:if>
                    <%-- 댓글 좋아요 끝--%>
                    <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
            </tr>
        </c:forEach>
    </table>
</section>


