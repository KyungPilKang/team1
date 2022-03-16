<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <link rel="shortcut icon" sizes="16x16 32x32 64x64"
          href="/resources/asset/image/login/dog1.png"/>
    <title>피드백 보기- 롤판.DOG</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackDetail.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>
<div class="container">

    <div class="feedback_container">


        <div class="feedback_container_header">

            <div class="feedback_subject_container">${article.feedback_subject }</div>
            <div class="feedback_container_bo">

                <div class="feedback_container_bo_left">
                    <div class="feedback_date_container">${feedback_date}</div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <div class=feedback_name_container"> 닉네임 : ${article.feedback_nickname}</div>
                </div>

                <div class="feedback_container_bo_right">
                    <div class="feedback_readcount_container"> 조회수 : ${article.feedback_readcount}</div>
                    <div class="feedback_readcount_container"> 댓글수 : ${article.feedback_replycount}</div>
                    <div class="feedback_readcount_container"> 좋아요수 : ${article.feedback_likecount}</div>
                </div>
            </div>
        </div>

        <div class="feedback_container_replay">
            리플레이 :
            <c:if test="${article.feedback_replay_fileName!=null }">
                <a href="replay_file_down?downFile=${article.feedback_replay_fileName}"> ${article.feedback_replay_fileName} </a>
            </c:if>
        </div>
        <div class="feedback_container_modDel" id="commandList">
            <%-- 세션과 게시물 작성자가 동일하면 수정, 삭제를 출력--%>
            <c:choose>
                <c:when test="${mem_nickname eq article.feedback_nickname}">
                    <button class="btn_modify"
                        onclick="location.href='fdmodifyform?feedback_num=${article.feedback_num}&page=${page}'">
                    수정
               		</button>
                    <button class="btn_del">삭제</button>
                    <button class="btn_list" onclick="location.href='./feedback?page=${page}'"> 목록</button>
                </c:when>
                <c:otherwise>
                    <button class="btn_list" onclick="location.href='./feedback?page=${page}'"> 목록</button>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="feedback_container_video">
            <%-- 영상 출력은 컨트롤러 이식 후 주석해제 --%>
            <c:if test="${article.feedback_video_fileName != null }">
                <video controls="controls" poster="" width="900" height="600">
                        <%-- video_view는 컨트롤러 매핑경로 --%>
                    <source src="/fd_video_view/${article.feedback_video_fileName}" type="video/mp4">
                </video>
            </c:if>


        <div class="feedback_container_content">
            ${article.feedback_content }
        </div>
		</div>

        <%-- 피드백 답변 삽입 컨테이너 --%>
        <div class="feedback_container_answer ">

            <div class="rrrr"><b>피드백 답변</b> 총 ${article.feedback_answercount}개</div>

            <div class="append_answerList"></div>
            <%-- 답변리스트 삽입부 시작--%>
            <section id="an_listForm">

                <table class="an_listForm_table">
                    <tbody>

                    <c:forEach var="answer" items="${anList }">
                        <tr class="each_answer">
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

                            <td>${answer.fd_answer_nickname}</td>
                            <td class="each_answer_subject">제목 : ${answer.fd_answer_title}</td>
                            <td class="each_answer_content"  onclick="content_pop(${answer.fd_answer_num})">
                             <div class="each_answer_content_inner">피드백 내용 보기</div>
                            </td>
                            <td><fmt:formatDate value="${answer.fd_answer_date}" pattern="yyyy년 M월 d일 E요일 a H:mm"/></td>


                                <%-------------------------------------- 세션이 있을경우 시작 --------------------------------------%>
                            <c:if test="${!empty mem_nickname}">

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
                                    <c:if test="${empty mem_nickname}">
                                        <td>
                                            <div class="an_heart"></div>
                                        </td>
                                    </c:if>
                                <%-- 좋아요 숫자 표시 --%>
                            <td>
                                    ${answer.fd_answer_likecount}
                            </td>
                                    <c:if test="${answer.fd_answer_nickname == mem_nickname}">
                                        <td>
                                            <button onclick="an_removeCheck(${answer.fd_answer_num})">삭제</button>
                                        </td>
                                    </c:if>
                                <%-- 피드백 답변 좋아요 끝--%>
                                <%-------------------------------------- 세션이 있을경우 끝 --------------------------------------%>
                        </tr>
                        <tr class="each_answer_content_detail${answer.fd_answer_num} each_answer_content_detail">
                            <td colspan="8" class="each_answer_content_detail_content">
                                <div class="each_answer_content_detail_content_inner">${answer.fd_answer_content}<br></div>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>

            <%-- 답변리스트 삽입부 끝--%>
            <c:if test="${article.feedback_nickname != mem_nickname && not empty mem_nickname }">
            <div class="btn_feedback_container_answer_write">
                <button onclick="answer_show()"> 피드백 답변 작성 </button>
            </div>
            </c:if>
            <%-- 시작 : 작성폼 --%>
            <div class="feedback_container_answer_write">
                <c:if test="${!empty mem_nickname}">
                    <div class="feedback_container_answer_write_flex">
                        <form>
                            <div><input type="text" class="answer_write_title" placeholder="제목"></div>
                            <div><textarea class="answer_write_content" maxlength="1000"
                                           placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다."></textarea></div>
                            <div>
                                <button class="answer_submits" type="button">피드백 답변달기</button>
                            </div>
                        </form>
                    </div>
                </c:if>
            </div>
            <%-- 끝 : 작성폼 --%>

        </div>

        <div class="replyfeedback_container_reply">
            <%-- 세션의 회원번호(mno)가 존재할 때 댓글쓰기 가능 --%>
            <c:if test="${!empty mem_nickname}">
                <form>
            <textarea class="comment_write_content" maxlength="1000"
                      placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다."></textarea>
                    <button class="comment_submits" type="button">댓글 달기</button>
                </form>
            </c:if>


            <div class="rrrr"><b>&nbsp;&nbsp;댓글</b> 총 ${article.feedback_replycount}개</div>
            <div>
                <%-- 최신순은 페이지 새로고침 해주면 된다 --%>
                <button onclick="location.reload()">최신순</button>
                <%-- 인기순은 버튼을 누르면 아래 댓글 삽입부를 ajax로 다 날리고 인기순 정렬한 댓글창을 삽입하면 된다 --%>
                <button onclick="replyList_sort()">인기순</button>
            </div>

            <div class="append_replyList"></div>
            <c:choose>
            <c:when test="${not empty reList}">
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
            <%-- 댓글 삽입부 끝--%>
            </c:when>
                <c:otherwise>
                    <section class="emptyReply" style="font-weight:bold; font-size:1.3em; margin-top:30px; margin-bottom:70px;"><center>등록된 댓글이 없습니다.</center></section>
                </c:otherwise>
            </c:choose>
        </div>
    </div>


    <%-- <div class="modal">
        <div class="modal_content"
             title="클릭하면 창이 닫힙니다">
            게시물을 삭제하시겠습니까?<br>
            <button onclick="location.href='feedbackdelete?feedback_num=${article.feedback_num}&page=${page}'"> 확인
            </button>
            <button class="modal_cancel">취소</button>
        </div>
    </div> --%>

</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- 모달 --%>
<script>
$(function () {
    $(".btn_del").click(function () {
    	Swal.fire({
			title: "게시글 삭제",
			text: "확인을 누르면 게시글이 삭제됩니다",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "확인",
			cancelButtonText : "취소",
			cancelButtonColor: '#d33'
		}).then((result)=>{
			if(result.isConfirmed){
				location.href='feedbackdelete?feedback_num=${article.feedback_num}&page=${page}'
			}else if(result.isDismissed){
    			location.reload();
			}else{
				location.reload();
			}
		})
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
                        feedback_num: ${article.feedback_num},
                        fd_reply_content: $(".comment_write_content").val()
                    },
                    url: "http://localhost:8090/fd_regreply",
                    success: function (data) {
                    	Swal.fire({
    						title: "등록 완료",
    						text: "댓글이 등록되었습니다",
    						icon: "success",
    						confirmButtonText: "확인"
    					}).then((result)=>{
    							location.reload();
    						
    					})
                    },
                    error: function (textStatus) {
                        alert(textStatus);
                        console.log(textStatus);
                        console.log(JSON.stringify(textStatus));
                    }
                });
            } else {
            	Swal.fire({
					title: "입력 오류",
					text: "댓글 내용을 입력하세요",
					icon: "warning",
					confirmButtonText: "확인"
				}).then((result)=>{
					 $(".comment_write_content").focus();
				})
            }
        })
    })
</script>


<%-- 댓글삭제 --%>
<script>
    function re_removeCheck(replyNum) {
    	Swal.fire({
			title: "댓글 삭제",
			text: "확인을 누르면 삭제됩니다",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "확인",
			cancelButtonText : "취소",
			cancelButtonColor: '#d33'
		}).then((result)=>{
			if(result.isConfirmed){
	            $.ajax({
	                async: true,
	                type: 'GET',
	                data: {
	                    fd_reply_num: replyNum,
	                },
	                url: "http://localhost:8090/fd_replydelete",
	                success: function (data) {
	                	Swal.fire({
	            			title: "삭제 완료",
	            			text: "댓글이 삭제되었습니다",
	            			icon: "success",
	            			confirmButtonText: "확인"
	            		}).then((result)=>{
	            			location.reload();
						})
	                },
	                error: function (textStatus) {
	                    alert(textStatus);
	                }
	            });
			}else if(result.isDismissed){
    			return false;
			}else{
				return false;
			}
        })
    }
</script>


<%-- 댓글 좋아요 버튼 자바스크립트 --%>
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
                fd_reply_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/fd_re_like_off",
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
			text: "댓글에 좋아요를 취소하셨습니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		})
        
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
                fd_reply_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/fd_re_like_on",
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
			text: "댓글에 좋아요를 누르셨습니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		})
        
    }
</script>

<%-- 댓글 정렬 --%>
<script>
    const replyList_sort = () => {
        $("#re_listForm").empty();
        $(".append_replyList").empty();
        $.ajax({
            type: "post",
            async: false,
            url: "http://localhost:8090/feedbackDetail_ajax",
            data: {
                feedback_num: ${article.feedback_num},
            },
            success: function (data) {
                $('.append_replyList').append(data);
            }
        })
    }
</script>


<%--------------------------------- 시작 : 피드백 답변 관련 ---------------------------------%>


<%-- 피드백 답변 정렬 --%>
<%-- ajax로 넘어갔을 때 고정 버튼 이상으로 보류하기로 결정 --%>
<%--<script>--%>
<%--    const answerList_sort = () => {--%>
<%--        $("#an_listForm").empty();--%>
<%--        $(".append_answerList").empty();--%>
<%--        $.ajax({--%>
<%--            type: "post",--%>
<%--            async: false,--%>
<%--            // ajax 페이지를 피드백 답글을 내려주는 바꿔줘야한다--%>
<%--            url: "http://localhost:8090/feedbackDetail_ajax_answer",--%>
<%--            data: {--%>
<%--                feedback_num: ${article.feedback_num},--%>
<%--                &lt;%&ndash;fd_answer_nickname : ${article.feedback_nickname}&ndash;%&gt;--%>
<%--            },--%>
<%--            success: function (data) {--%>
<%--                $('.append_answerList').append(data);--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>
<%--</script>--%>


<%-- 피드백 답변 작성 ajax --%>
<script>
    $(function () {
        $(".answer_submits").click(function () {
        	if($(".answer_write_title").val()==""){
            	Swal.fire({
                    title: "입력 오류",
                    text: "피드백 제목을 작성하세요",
                    icon: "error",
                    confirmButtonText: "확인"
               })
               return false
            }
            if ($(".answer_write_content").val() !== "") {
            	if($(".answer_write_title").val().length>10){
                	Swal.fire({
                        title: "입력 오류",
                        text: "10자 이내로 제목을 작성하세요",
                        icon: "error",
                        confirmButtonText: "확인"
                   })
                   return false
                }
                $.ajax({
                    async: true,
                    type: 'POST',
                    data: {
                        feedback_num: ${article.feedback_num},
                        fd_answer_content: $(".answer_write_content").val(),
                        fd_answer_title: $(".answer_write_title").val()
                    },
                    url: "http://localhost:8090/fd_reganswer",
                    success: function (data) {
                    	Swal.fire({
                			title: "등록 완료",
                			text: "피드백 답변이 등록되었습니다",
                			icon: "success",
                			confirmButtonText: "확인"
                		}).then((result)=>{
                			location.reload();
                		})
                    },
                    error: function (textStatus) {
                        alert(textStatus);
                        console.log(textStatus);
                        console.log(JSON.stringify(textStatus));
                    }
                });
            } else {
            	Swal.fire({
        			title: "입력 오류",
        			text: "피드백 답변 내용을 입력하세요",
        			icon: "warning",
        			confirmButtonText: "확인"
        		}).then((result)=>{
        			 $(".comment_write_content").focus();
        		})  
            }
        })
    })
</script>


<%-- 피드백 답변삭제 --%>
<script>
    function an_removeCheck(replyNum) {
    	Swal.fire({
			title: "답변 삭제",
			text: "확인을 누르면 삭제됩니다",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "확인",
			cancelButtonText : "취소",
			cancelButtonColor: '#d33'
		}).then((result)=>{
			if(result.isConfirmed){
				$.ajax({
	                async: true,
	                type: 'GET',
	                data: {
	                    fd_answer_num: replyNum,
	                },
	                // url 컨트롤러 만들어야함
	                url: "http://localhost:8090/fd_answerdelete",
	                success: function (data) {
	                	Swal.fire({
	            			title: "삭제 완료",
	            			text: "피드백 답변이 삭제되었습니다",
	            			icon: "success",
	            			confirmButtonText: "확인"
	            		}).then((result)=>{
	            			location.reload();
						})
	                	
	                },
	                error: function (textStatus) {
	                    alert(textStatus);
					}
				});
			}else if(result.isDismissed){
    			return false;
			}else{
				return false;
			}
        })
    }
</script>


<%-- 피드백 답변 좋아요 버튼 자바스크립트 --%>
<script>
    function an_like_off(replyNum) {
        console.log(replyNum + "번 피드백 답변에");
        console.log(${mem_mno}+"번 유저가 좋아요 취소");
        /* b_reply_like_member에 mno를 제거 */
        /* 제거시 b_reply_likecount도 -1 */
        $(".ah_" + replyNum).hide()
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                feedback_num: ${article.feedback_num},
                fd_answer_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/fd_an_like_off",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        /* 빈 하트로 바꾸기 */
        $(".ah_off_" + replyNum).show()
        Swal.fire({
			title: "취소 완료",
			text: "피드백에 좋아요를 취소하셨습니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		})
    }

    function an_like_on(replyNum) {
        console.log(replyNum + "번 피드백 답변에");
        console.log(${mem_mno}+"번 유저가 좋아요 누름");
        /* b_reply_like_member에 mno를 추가 */
        /* 추가시 b_reply_likecount도 +1 */
        $(".ah_off_" + replyNum).hide()
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                feedback_num: ${article.feedback_num},
                fd_answer_num: replyNum,
                mno:${mem_mno}
            },
            url: "http://localhost:8090/fd_an_like_on",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        /* 빨간 하트로 바꾸기 */
        $(".ah_" + replyNum).show()
        Swal.fire({
			title: "등록 완료",
			text: "피드백에 좋아요를 누르셨습니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		});
    }
</script>


<%-- 피드백 고정 --%>
<script>
    function answer_fixed(answerNum) {
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                feedback_num: ${article.feedback_num},
                fd_answer_num: answerNum
            },
            url: "http://localhost:8090/fd_an_fixed",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        Swal.fire({
			title: "피드백 수락",
			text: "피드백 답변을 고정합니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		})
    }


    function answer_fiexd_cancel(answerNum) {
        $.ajax({
            async: true,
            type: 'POST',
            data: {
                feedback_num: ${article.feedback_num},
                fd_answer_num: answerNum
            },
            url: "http://localhost:8090/fd_an_fixed_cancel",
            success: function (data) {
            },
            error: function (textStatus) {
                alert(textStatus);
            }
        });
        Swal.fire({
			title: "피드백 취소",
			text: "피드백 답변 고정이 해제됩니다",
			icon: "success",
			confirmButtonText: "확인"
		}).then((result)=>{
			location.reload();
		})
    }
</script>


<%--------------------------------- 끝 : 피드백 답변 관련 ---------------------------------%>


<%-- 작성폼 버튼 --%>
<script>
    answer_show = () => {
        if ($(".feedback_container_answer_write").css("display") == "none") {
            $(".feedback_container_answer_write").show()
        } else {
            $(".feedback_container_answer_write").hide()
        }
    }
</script>

<%-- 피드백 답변 내용 팝업 --%>
<script>
    content_pop = (answerNum) => {
        if ($(".each_answer_content_detail" + answerNum).css("display") == "none") {
            $(".each_answer_content_detail").hide() // class로 다 닫아버리고
            $(".each_answer_content_detail" + answerNum).show() // 해당 id만 열어준다
        } else {
            $(".each_answer_content_detail" + answerNum).hide()
        }
    }
</script>




</body>
</html>