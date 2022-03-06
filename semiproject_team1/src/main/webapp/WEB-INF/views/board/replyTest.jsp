<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <style>

        .ddd {
            height:100px;
            background: grey;
        }
    </style>
</head>
<body>
        <%-- session이 존재하면 댓글작성 폼이 뜬다(없으면 댓글들만 뜬다) --%>
        <%-- 댓글도 최신순, 인기순 정렬 ? 정렬시 같은 그룹끼리만 정렬해야 한다 --%>
        <%-- 내가 쓴 댓글은 삭제가 가능해야 한다 (수정은 X) --%>
        <%-- 대댓글 까지 가능 --%>
        <%-- 대댓글을 달면 앞에 모댓글 작성자의 아이디가 표기(색상) --%>
        <section id="listForm">
            <table>
                <c:forEach var="reply" items="${reList }">
                    <tr>
                        <td><div class="ddd">${reply.b_reply_num}</div></td>
                        <td>
                            <c:choose>
                                <c:when test="${reply.b_reply_lev!=0}">
                                    <c:forEach var="i" begin="0" end="${reply.b_reply_lev*2}">
                                        &nbsp;
                                    </c:forEach>
                                    ▶
                                </c:when>
                                <c:otherwise>▶</c:otherwise>
                            </c:choose>
                                    ${reply.b_reply_content}
                        </td>
                        <td>${reply.b_reply_nickname }</td>
                        <td><fmt:formatDate value="${reply.b_reply_date }" pattern="yyyy년 M월 d일 E요일 a H:mm"/></td>

                    </tr>
                </c:forEach>
            </table>
        </section>

</body>
</html>
