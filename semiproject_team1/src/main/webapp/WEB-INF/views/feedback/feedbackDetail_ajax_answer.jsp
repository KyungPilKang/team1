<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--------------------------------------------- 보류 페이지 ---------------------------------------------%>


<section id="an_listForm">
    <table>
        <c:forEach var="answer" items="${anList }">
            <tr>
                    <%-- 게시물 작성자만 고정, 고정취소가 가능하도록 --%>
                <c:if test="${article.feedback_nickname eq mem_nickname}">
                    <td>
                        <c:choose>
                            <c:when test="${answer.fd_answer_fixed == 0}">
                                <button onclick="answer_fixed(${answer.fd_answer_num})">고정</button>
                            </c:when>
                            <c:otherwise>
                                <button onclick="answer_fiexd_cancel(${answer.fd_answer_num})">고정취소</button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </c:if>

                <td>
                    <div class="eee">${answer.fd_answer_num}</div>
                </td>
                <td>닉네임:${answer.fd_answer_nickname}</td>
                <td>제목:${answer.fd_answer_title}</td>
                <td>
                    내용:${answer.fd_answer_content}
                </td>
                <td><fmt:formatDate value="${answer.fd_answer_date}" pattern="yyyy년 M월 d일 E요일 a H:mm"/></td>


                    <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                <c:if test="${!empty mem_nickname}">
                    <c:if test="${answer.fd_answer_nickname == mem_nickname}">
                        <td>
                            <button onclick="an_removeCheck(${answer.fd_answer_num})">삭제</button>
                        </td>
                    </c:if>
                    <%-- 피드백 답변 좋아요 시작 --%>
                    <td>
                        <div class="re_btn_like">
                            <c:choose>
                                <%-- 세션에 있는 유저를 확인해서 해당 댓글에 좋아요 플래그만 내려보내주면 될듯 --%>
                                <c:when test="${answer.fd_answer_like_ok == true}">
                                    <div class="an_like_mini${answer.fd_answer_num}">
                                        <div class="an_heart ah_${answer.fd_answer_num}"
                                             onclick="an_like_off(${answer.fd_answer_num})"></div>
                                        <div class="an_heart_off ah_off_${answer.fd_answer_num} ah_off_hide"
                                             onclick="an_like_on(${answer.fd_answer_num})"></div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="an_like_mini${answer.fd_answer_num}">
                                        <div class="an_heart_off ah_off_${answer.fd_answer_num}"
                                             onclick="an_like_on(${answer.fd_answer_num})"></div>
                                        <div class="an_heart ah_${answer.fd_answer_num} ah_hide"
                                             onclick="an_like_off(${answer.fd_answer_num})"></div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </c:if>
                    <%-- 좋아요 숫자 표시 --%>
                <td>
                        ${answer.fd_answer_likecount}
                </td>
                    <%-- 피드백 답변 좋아요 끝--%>
                    <%-------------------------------------- 세션이 있을경우 끝 --------------------------------------%>
            </tr>

        </c:forEach>
    </table>
</section>