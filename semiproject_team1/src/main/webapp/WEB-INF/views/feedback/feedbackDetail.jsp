<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>롤판.DOG</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackDetail.css">
</head>

<body>
<div class="container">
    <div class="board_container">
        <div>
            <%-- 영상 출력은 컨트롤러 이식 후 주석해제 --%>
            <c:if test="${article.feedback_video_fileName != null }">
                <video controls="controls" poster="" width="900" height="600">
                        <%-- video_view는 컨트롤러 매핑경로 --%>
                    <source src="/fd_video_view/${article.feedback_video_fileName}" type="video/mp4">
                </video>
            </c:if>
        </div>

        <div class="board_container_header">
            <div class="board_subject_container">${article.feedback_subject }</div>
            <div class="board_container_bo">
                <div class="board_date_container">${feedback_date}</div>
                <div class="board_name_container"> 닉네임 : ${article.feedback_nickname}</div>
                <%--                <div class="board_like_container"> 좋아요수 : ${article.feedback_likecount}</div>--%>
                <%--                <div class="board_reply_container"> 댓글수 : ${article.feedback_replycount}</div>--%>
                <div class="board_readcount_container"> 조회수 : ${article.feedback_readcount}</div>
            </div>
        </div>

        <section id="commandList">
            <%-- 세션과 게시물 작성자가 동일하면 수정, 삭제를 출력--%>
            <c:if test="${mem_nickname eq article.feedback_nickname}">
                <button class="btn_modify"
                        onclick="location.href='fdmodifyform?feedback_num=${article.feedback_num}&page=${page}'">
                    수정
                </button>
                <button class="btn_del">삭제</button>
            </c:if>
            <button class="btn_reply" onclick="location.href='./feedback?page=${page}'"> 목록(임시)</button>

            <div>
                리플레이 :
                <c:if test="${article.feedback_replay_fileName!=null }">
                    <a href="file_down?downFile=${article.feedback_replay_fileName}"> ${article.feedback_replay_fileName} </a>
                </c:if>
            </div>
        </section>

        <div class="board_content_container">
            ${article.feedback_content }
        </div>

        <div class="vote_cont">vote_cont</div>
        <div class="answer_cont">answer_cont</div>
        <div class="reply_cont">
            <%-- 세션의 회원번호(mno)가 존재할 때 댓글쓰기 가능 --%>
            <c:if test="${!empty mem_nickname}">
                <form>
            <textarea class="comment_write_content" maxlength="1000"
                      placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다."></textarea>
                    <button class="comment_submits" type="button">댓글 달기</button>
                </form>
            </c:if>


            <div><b>댓글</b> 총 ${article.board_replycount}개</div>
            <div>
                <%-- 최신순은 페이지 새로고침 해주면 된다 --%>
                <button onclick="location.reload()">최신순</button>
                <%-- 인기순은 버튼을 누르면 아래 댓글 삽입부를 ajax로 다 날리고 인기순 정렬한 댓글창을 삽입하면 된다 --%>
                <button onclick="replyList_sort()">인기순</button>
            </div>

            <div class="append_replyList"></div>
            <%-- 댓글 삽입부 시작--%>
            <section id="listForm">
                <table>
                    <c:forEach var="reply" items="${reList }">
                        <tr>
                            <td>
                                <div class="ddd">${reply.b_reply_num}</div>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${reply.b_reply_lev!=0}">
                                        <c:forEach var="i" begin="0" end="${reply.b_reply_lev*3}">
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


                                <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                            <c:if test="${!empty mem_nickname}">
                                <c:if test="${reply.b_reply_nickname == mem_nickname}">
                                    <td>
                                        <button onclick="removeCheck(${reply.b_reply_num})">삭제</button>
                                    </td>
                                </c:if>


                                <%-- 대댓글 좋아요 시작 --%>
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
                                <%-- 좋아요 숫자 표시 --%>
                            <td>
                                    ${reply.b_reply_likecount}
                            </td>
                                <%-- 대댓글 좋아요 끝--%>
                                <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                        </tr>
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
            <button onclick="location.href='feedbackdelete?feedback_num=${article.feedback_num}&page=${page}'"> 확인
            </button>
            <button class="modal_cancel">취소</button>
        </div>
    </div>

</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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


<%-- 댓글 작성 ajax --%>
<script>
    $(function () {
        $(".comment_submits").click(function () {
            if ($(".comment_write_content").val() !== "") {
                $.ajax({
                    async: true,
                    type: 'POST',
                    data: {
                        b_board_num: ${article.board_num},
                        b_reply_content: $(".comment_write_content").val()
                    },
                    url: "http://localhost:8090/regreply",
                    success: function (data) {
                        alert("댓글이 등록되었습니다.");
                        location.reload();
                    },
                    error: function (textStatus) {
                        alert(textStatus);
                        console.log(textStatus);
                        console.log(JSON.stringify(textStatus));
                    }
                });
            } else {
                alert("댓글 내용을 입력하세요")
                $(".comment_write_content").focus()
            }
        })
    })
</script>


<%-- 댓글삭제 --%>
<script>
    function removeCheck(replyNum) {
        if (confirm("정말 삭제하시겠습니까??") == true) {
            $.ajax({
                async: true,
                type: 'GET',
                data: {
                    b_reply_num: replyNum,
                },
                url: "http://localhost:8090/replydelete",
                success: function (data) {
                    alert("댓글이 삭제되었습니다.");
                    location.reload();
                },
                error: function (textStatus) {
                    alert(textStatus);
                }
            });
        } else {
            return false;
        }
    }
</script>


</body>
</html>