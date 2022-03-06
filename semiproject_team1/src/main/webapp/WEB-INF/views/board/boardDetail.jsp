<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>롤판.DOG</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardDetail.css">
</head>

<body>
<div class="board_container">
    <div class="board_container_header">
        <div class="board_subject_container">${article.board_subject }</div>
        <div class="board_container_bo">
            <div class="board_category_container">${article.board_cat}</div>
            <div class="board_date_container">${board_date}</div>
            <div class="board_name_container"> 닉네임 : ${article.board_nickname}</div>
            <div class="board_like_container"> 좋아요수 : ${article.board_likecount}</div>
            <div class="board_reply_container"> 댓글수 : ${article.board_replycount}</div>
            <div class="board_readcount_container"> 조회수 : ${article.board_readcount}</div>
        </div>
    </div>


    <section id="commandList">
        <button class="btn_modify" onclick="location.href='modifyform?board_num=${article.board_num}&page=${page}'">
            수정
        </button>

        <button class="btn_del">삭제</button>
        <div>
            첨부파일 :
            <c:if test="${article.board_fileName!=null }">
                <a href="file_down?downFile=${article.board_fileName}"> ${article.board_fileName} </a>
            </c:if>
        </div>
    </section>


    <div class="board_content_container">
        <c:if test="${article.board_fileName != null }">
            <video controls="controls" poster="" width="900" height="600">
                    <%-- video_view는 컨트롤러 매핑경로 --%>
                <source src="/video_view/${article.board_fileName}" type="video/mp4">
            </video>
        </c:if>
        ${article.board_content }
    </div>

    <section id="board_middle">

        <button id="btn_reply" class="btn_reply" onclick="reply_show()">댓글보기</button>
        <button class="btn_reply" onclick="location.href='./boardlist?page=${page}'"> 목록(임시)</button>

        <div class="like_and_ward">
            <div class="btn_like">
                <c:choose>
                    <c:when test="${like_ok==true}">
                        <div class="like_mini">
                            <div class="heart" onclick="like_off()"></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="like_mini">
                            <div class="heart_off" onclick="like_on()"></div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="btn_ward">
                <c:choose>
                    <c:when test="${ward_ok==true}">
                        <div class="ward_mini">
                            <div class="bookmark" onclick="ward_off()"></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="ward_mini">
                            <div class="bookmark_off" onclick="ward_on()"></div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </section>

    <div class="reply_container" id="reply_container">
        --------------------------------------------------------- 댓글창 위치 ▼
        --------------------------------------------------------------
        <%-- 댓글 삽입부 시작--%>
        <section id="listForm">
            <table>
                <c:forEach var="reply" items="${reList }">
                    <c:if test="${article.board_num == reply.b_board_num }">
                        <tr>
                            <td>
                                <div class="ddd">${reply.b_reply_num}</div>
                            </td>
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
                    </c:if>
                </c:forEach>
            </table>
        </section>
        <%-- 댓글 삽입부 끝--%>

    </div>

</div>

<div class="modal">
    <div class="modal_content"
         title="클릭하면 창이 닫힙니다.">
        게시물을 삭제하시겠습니까?<br>
        <button onclick="location.href='boarddelete?board_num=${article.board_num}&page=${page}'"> 확인</button>
        <button class="modal_cancel">취소</button>
    </div>
</div>

<%-- 좋아요 버튼 자바스크립트 --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function like_off() {
        console.log(${mno});
        $(".heart").hide()
        /* ajax로 article_like에서 해당 board_num의 mno를 제거하기 위해 데이터를 보냄 */
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mno}
            },
            url: "http://localhost:8090/like_off",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        /* 빈 하트로 바꾸기 */
        $(".like_mini").append("<div class='heart_off' onclick='like_on()''></div>");
        alert("좋아요를 취소하셨습니다.")
        // 동영상 재생시 reload를 할 경우 영상도 reload 되므로 X
        // location.reload();
    }

    function like_on() {
        $(".heart_off").hide()
        /* ajax로 article_like에서 해당 board_num의 mno를 추가하기 위해 데이터를 보냄 */
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mno}
            },
            url: "http://localhost:8090/like_on",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        /* 빨간 하트로 바꾸기 */
        $(".like_mini").append("<div class='heart' onclick='like_off()''></div>");
        alert("좋아요를 누르셨습니다.")
        // location.reload();
    }
</script>

<%-- 뒤로가기 후 다시 돌아왔을 때 페이지가 reload 되는 동안 좋아요, 와드를 못하도록 css처리 --%>
<script>
    $(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type === 2)) {
            $(".heart_off").css("pointer-events", "none");
            $(".bookmark_off").css("pointer-events", "none");
            location.reload();
        }
    });
</script>


<%-- 와드 버튼 자바스크립트 --%>
<script>
    function ward_off() {
        $(".bookmark").hide()
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mno}
            },
            url: "http://localhost:8090/ward_off",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        $(".ward_mini").append("<div class='bookmark_off' onclick='ward_on()''></div>");
        alert("와드를 취소하셨습니다.")
        // location.reload();
    }

    function ward_on() {
        $(".bookmark_off").hide()
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mno}
            },
            url: "http://localhost:8090/ward_on",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        $(".ward_mini").append("<div class='bookmark' onclick='ward_off()''></div>");
        alert("와드를 누르셨습니다.")
        // location.reload();
    }
</script>


<%-- 모달 --%>
<script>
    $(function () {
        $(".btn_del").click(function () {
            $(".modal").fadeIn();
            // 모달시 스크롤을 막는다
            $("body").css("overflow", "hidden");
        });
        $(".modal_cancel").click(function () {
            $(".modal").fadeOut();
            $("body").css("overflow", "auto");
        });
    });
</script>


<%-- 댓글보기 버튼 --%>
<%--<script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
<%--<script>--%>
<%--    reply_show = () => {--%>
<%--        if ($("#reply_container").css("display") == "none") {--%>
<%--            $("#reply_container").show()--%>
<%--        } else {--%>
<%--            $("#reply_container").hide()--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>


</body>
</html>