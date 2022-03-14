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
<div class="container">
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
            <%-- 세션과 게시물 작성자가 동일하면 수정, 삭제를 출력--%>
            <c:if test="${mem_nickname == article.board_nickname}">
                <button class="btn_modify"
                        onclick="location.href='modifyform?board_num=${article.board_num}&page=${page}'">
                    수정
                </button>
                <button class="btn_del">삭제</button>
            </c:if>
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

            <button class="btn_reply" onclick="location.href='./boardlist?page=${page}'"> 목록(임시)</button>
            <c:if test="${not empty mem_nickname}">
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
            </c:if>
        </section>

        <div class="reply_container" id="reply_container">
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
                                <%-- 대댓글 까지만 답글이 가능하도록 제한한다 --%>
                                <c:if test="${reply.b_reply_lev == '0'}">
                                    <td>
                                        <button onclick="reply_show(${reply.b_reply_num})">답글 쓰기</button>
                                            <%-- 누르면 아래에 --%>
                                    </td>
                                </c:if>
                                <c:if test="${reply.b_reply_nickname == mem_nickname}">
                                    <td>
                                        <button onclick="removeCheck(${reply.b_reply_num})">삭제</button>
                                    </td>
                                </c:if>
                                <td>
                                        <%-- 오류 발생 이유 : form tag를 사용했더니 onclick시 boarddetail?로 이동, div로 변경하니까 정상작동.. --%>
                                        <%-- 해결 : form tag 내부에 button을 넣어둔게 문제의 원인이었다 --%>
                                    <div id="re_comment_write${reply.b_reply_num}" class="re_comment_write">
                                    <textarea class="re_comment_write_content" id="re${reply.b_reply_num}"
                                              maxlength="1000"
                                              placeholder="대댓글을 적어주세요:)"></textarea>
                                        <button type="submit"
                                                onclick="re_reply_submit(${reply.b_reply_num},(document.getElementById('re${reply.b_reply_num}').value))">
                                            작성
                                        </button>
                                    </div>
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
                                    <td>
                                            ${reply.b_reply_likecount}
                                    </td>
                                <%-- 댓글 좋아요 끝--%>
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
            <button onclick="location.href='boarddelete?board_num=${article.board_num}&page=${page}'"> 확인</button>
            <button class="modal_cancel">취소</button>
        </div>
    </div>
</div>
<%-- 좋아요 버튼 자바스크립트 --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
let sweetalert=(icon,title,contents)=>{
    Swal.fire({
        icon: icon,
        title: title,
        text: contents,
        confirmButtonText: "확인"
    })
};

    function like_off() {
        $(".heart").hide()
        /* ajax로 article_like에서 해당 board_num의 mno를 제거하기 위해 데이터를 보냄 */
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mem_mno}
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
        Swal.fire({
			title: "취소 완료",
			text: "좋아요를 취소하셧습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        //alert("좋아요를 취소하셨습니다.") 스윗알럿으로 바꿈
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
                mno:${mem_mno}
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
        Swal.fire({
			title: "등록 완료",
			text: "좋아요를 누르셨습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        //alert("좋아요를 누르셨습니다.")
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
                mno:${mem_mno}
            },
            url: "http://localhost:8090/ward_off",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        $(".ward_mini").append("<div class='bookmark_off' onclick='ward_on()''></div>");
        Swal.fire({
			title: "취소 완료",
			text: "와드를 취소하셧습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        //alert("와드를 취소하셨습니다.")
        // location.reload();
    }

    function ward_on() {
        $(".bookmark_off").hide()
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                board_num:${article.board_num},
                mno:${mem_mno}
            },
            url: "http://localhost:8090/ward_on",
            success: function (data) {
            },
            error: function (textStatus) {
                alert("ERROR : " + textStatus);
            }
        });
        $(".ward_mini").append("<div class='bookmark' onclick='ward_off()''></div>");
        Swal.fire({
			title: "등록 완료",
			text: "와드를 누르셧습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        //alert("와드를 누르셨습니다.")
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
                    	Swal.fire({
                			title: "등록 완료",
                			text: "댓글이 등록되었습니다.",
                			icon: "success",
                			confirmButtonText: "확인"
                		});
                    	//alert("댓글이 등록되었습니다.");
                        location.reload();
                    },
                    error: function (textStatus) {
                        alert(textStatus);
                        console.log(textStatus);
                        console.log(JSON.stringify(textStatus));
                    }
                });
            } else {
            	Swal.fire({
        			title: "입력오류",
        			text: "댓글 내용을 입력하세요.",
        			icon: "error",
        			confirmButtonText: "확인"
        		});
            	//alert("댓글 내용을 입력하세요")
                $(".comment_write_content").focus()
            }
        })
    })
</script>


<%-- 댓글삭제 --%>
<script>
//confirm sweetalert으로 변환중
/* function removeCheck(replyNum) {
	Swal.fire({
	    title: "삭제 확인",
	    text: "정말삭제하시겠습니까?",
	    icon: "waring",
	    showCancelButton: true,
	    confirmButtonText: '네',
	    cancelButtonText: '아니오',
	}).then(result => {
	    if (result.isConfirmed) {
        $.ajax({
            async: true,
            type: 'GET',
            data: {
                b_reply_num: replyNum,
            },
            url: "http://localhost:8090/replydelete",
            success: function (data) {
            	Swal.fire({
        			title: "삭제 완료",
        			text: "댓글이 삭제되었습니다.",
        			icon: "success",
        			confirmButtonText: "확인"
        		});
            	//alert("댓글이 삭제되었습니다.");
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
} */
     function removeCheck(replyNum) {
        if (confirm("정말 삭제하시겠습니까?") == true) {
            $.ajax({
                async: true,
                type: 'GET',
                data: {
                    b_reply_num: replyNum,
                },
                url: "http://localhost:8090/replydelete",
                success: function (data) {
                	Swal.fire({
            			title: "삭제 완료",
            			text: "댓글이 삭제되었습니다.",
            			icon: "success",
            			confirmButtonText: "확인"
            		});
                	//alert("댓글이 삭제되었습니다.");
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


<%-- 답글쓰기 버튼 --%>
<script>
    reply_show = (replyNum) => {
        if ($("#re_comment_write" + replyNum).css("display") == "none") {
            $(".re_comment_write").hide() // class로 다 닫아버리고
            $("#re_comment_write" + replyNum).show() // 해당 id만 열어준다
        } else {
            $("#re_comment_write" + replyNum).hide()
        }
    }
</script>


<%-- 대댓글 작성 ajax --%>
<script>
    function re_reply_submit(re_replyNum, re_value) {
        if ($("#re" + re_replyNum).val() !== "") {
            $.ajax({
                async: true,
                type: 'POST',
                data: {
                    b_reply_num: re_replyNum,
                    b_board_num: ${article.board_num},
                    b_reply_content: re_value
                },
                url: "http://localhost:8090/re_regreply",
                success: function (data) {
                    console.log(data);
                    Swal.fire({
            			title: "등록 완료",
            			text: "답글이 등록되었습니다.",
            			icon: "success",
            			confirmButtonText: "확인"
            		});
                    //alert("답글이 등록되었습니다.");
                    location.reload();
                },
                error: function (textStatus) {
                    console.log("에러 : " + textStatus)
                    alert(textStatus);
                }
            });
        } else {
        	Swal.fire({
    			title: "입력오류",
    			text: "답글 내용을 입력하세요.",
    			icon: "error",
    			confirmButtonText: "확인"
    		});
            //alert("답글 내용을 입력하세요")
            $("#re" + re_replyNum).focus()
        }
    }
</script>


<%-- 댓글 좋아요 버튼 자바스크립트 --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function re_like_off(replyNum) {
        console.log(replyNum + "번 댓글에");
        console.log(${mem_mno}+"번 유저가 좋아요 취소");
        console.log(typeof replyNum);
        console.log(typeof ${mem_mno});
        /* b_reply_like_member에 mno를 제거 */
        /* 제거시 b_reply_likecount도 -1 */
        $(".rh_" + replyNum).hide()
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                b_reply_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/re_like_off",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        /* 빈 하트로 바꾸기 */
        $(".rh_off_" + replyNum).show()
        Swal.fire({
			title: "취소 완료",
			text: replyNum + "번 댓글에 좋아요를 취소하셨습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        //alert(replyNum + "번 댓글에 좋아요를 취소하셨습니다.")
        location.reload();
    }

    function re_like_on(replyNum) {
        console.log(replyNum + "번 댓글에");
        console.log(${mem_mno}+"번 유저가 좋아요 누름");
        console.log(typeof replyNum);
        console.log(typeof ${mem_mno});
        /* b_reply_like_member에 mno를 추가 */
        /* 추가시 b_reply_likecount도 +1 */
        $(".rh_off_" + replyNum).hide()
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                b_reply_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/re_like_on",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        /* 빨간 하트로 바꾸기 */
        $(".rh_" + replyNum).show()
        Swal.fire({
			title: "등록 완료",
			text: replyNum + "번 댓글에 좋아요를 누르셨습니다.",
			icon: "success",
			confirmButtonText: "확인"
		});
        alert(replyNum + "번 댓글에 좋아요를 누르셨습니다.")
        location.reload();
    }
</script>


<%-- 댓글 정렬 --%>
<script>
    const replyList_sort = () => {
        $("#listForm").empty();
        $(".append_replyList").empty();
        $.ajax({
            type: "post",
            async: false,
            url: "http://localhost:8090/boardDetail_ajax",
            data: {
                board_num: ${article.board_num},
            },
            success: function (data) {
                $('.append_replyList').append(data);
            }
        })
    }
</script>

</body>
</html>