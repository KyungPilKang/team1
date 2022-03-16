<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 댓글 삽입부 시작--%>
<section id="listForm">
    <table class="listForm_table">
        <c:forEach var="reply" items="${reList }">
            <tr>
                <td class="list_nick">
                    <c:choose>
                        <c:when test="${reply.b_reply_lev!=0}">
                            <c:forEach var="i" begin="0" end="${reply.b_reply_lev*3}">
                                &nbsp;
                            </c:forEach>
                            ㄴ
                        </c:when>
                        <c:otherwise>&nbsp;■</c:otherwise>
                    </c:choose>
                        ${reply.b_reply_nickname }
                </td>
                <td class="list_conta">${reply.b_reply_content}</td>
                <td><fmt:formatDate value="${reply.b_reply_date }" pattern="M월 d일 H시"/></td>


                    <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                <c:if test="${!empty mem_nickname}">
                    <%-- 대댓글 까지만 답글이 가능하도록 제한한다 --%>
                    <td class="rerebox">
                        <c:if test="${reply.b_reply_lev == '0'}">
                            <button onclick="reply_show(${reply.b_reply_num})">답글</button>
                            <%-- 누르면 아래에 --%>
                        </c:if>
                    </td>
                    <td class="rorobox">
                        <c:if test="${reply.b_reply_nickname == mem_nickname}">
                            <button onclick="removeCheck(${reply.b_reply_num})">삭제</button>
                        </c:if>
                    </td>


                    <%-- 댓글 좋아요 시작 --%>
                    <%-- 대댓글은 좋아요 못누르게 처리 --%>
                    <c:if test="${reply.b_reply_lev == '0'}">
                        <td>
                            <div class="re_btn_like">
                                <c:choose>
                                    <%-- 세션에 있는 유저를 확인해서 해당 댓글에 좋아요 플래그만 내려보내주면 될듯 --%>
                                    <c:when test="${reply.b_reply_like_ok == true}">
                                        <div class="re_like_mini${reply.b_reply_num}">
                                            <div class="re_heart rh_${reply.b_reply_num}"
                                                 onclick="re_like_off(${reply.b_reply_num})"></div>
                                            <div class="re_heart_off rh_off_${reply.b_reply_num} rh_off_hide"
                                                 onclick="re_like_on(${reply.b_reply_num})"></div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="re_like_mini${reply.b_reply_num}">
                                            <div class="re_heart_off rh_off_${reply.b_reply_num}"
                                                 onclick="re_like_on(${reply.b_reply_num})"></div>
                                            <div class="re_heart rh_${reply.b_reply_num} rh_hide"
                                                 onclick="re_like_off(${reply.b_reply_num})"></div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>

                    </c:if>
                </c:if>
                    <%-- 좋아요 숫자 표시 --%>
                <c:if test="${empty mem_nickname && reply.b_reply_lev == '0'}">
                    <td>
                        <div class="re_heart"></div>
                    </td>
                </c:if>
                <td>
                    <c:if test="${reply.b_reply_lev == '0'}">
                        ${reply.b_reply_likecount}
                    </c:if>
                </td>
                    <%-- 댓글 좋아요 끝--%>
                    <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
            </tr>
            <td colspan="8" class="">
                <div class="reply_reply_write"><br></div>
                    <%-- 오류 발생 이유 : form tag를 사용했더니 onclick시 boarddetail?로 이동, div로 변경하니까 정상작동.. --%>
                    <%-- 해결 : form tag 내부에 button을 넣어둔게 문제의 원인이었다 --%>
                <div id="re_comment_write${reply.b_reply_num}" class="re_comment_write">
                                    <textarea class="re_comment_write_content" id="re${reply.b_reply_num}"
                                              maxlength="1000"
                                              placeholder="대댓글을 적어주세요:)"></textarea>
                    <button type="submit"
                            onclick="re_reply_submit(${reply.b_reply_num},(document.getElementById('re${reply.b_reply_num}').value))"
                            class="btn_re_comment_write_content">
                        작성
                    </button>
                </div>
            </td>
        </c:forEach>
    </table>
</section>
<%-- 댓글 삽입부 끝--%>