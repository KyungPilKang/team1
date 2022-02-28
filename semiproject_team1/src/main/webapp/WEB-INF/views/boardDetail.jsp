<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MVC 게시판</title>

    <style>
        .board_container {
            background: #e1e1e1;
            width: 1000px;
            height: 1400px;
            border: 1px solid black;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .board_container_header {
        }

        .board_subject_container {
            padding-left: 20px;
            font-weight: bold;
            font-size: 40px;
            width: 980px;
            height: 50px;
            /*border: 1px solid black;*/
        }


        .board_container_bo {
            margin-top: 20px;
            text-align: center;
        }


        .board_category_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: left;
        }

        .board_date_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: left;
        }

        .board_name_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: left;
        }

        .board_readcount_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: right;
        }

        .board_reply_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: right;
        }

        .board_like_container {
            width: 100px;
            height: 40px;
            /*border: 1px solid black;*/
            float: right;
        }

        .board_content_container {
            margin-top: 100px;
            width: 950px;
            height: 500px;
            /*border: 1px solid darkred;*/
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            overflow: scroll;
            overflow-x: hidden;
        }

        .board_content_container img {
            width: 880px;
            /*height: 400px;*/
            object-fit: cover;
        }

        #board_middle {
            margin-top: 620px;
            width: 900px;
            height: 70px;
            /*border:1px solid black;*/
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        #commandList {
            margin-top: 1050px;
            text-align: center;
        }

        #commandList button a {
            text-decoration: none;
            color: black;
        }

        .like_ward {
            display: flex;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .btn_reply {
            border: none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            float: left;
            background: darkgray;
            font-size: 15px;
            cursor: pointer;
        }

        .btn_like {
            padding: 20px;
            width: 50px;
            height: 48px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn_ward {
            padding: 20px;
            width: 80px;
            height: 48px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn_modify {
            border: none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            background: darkgray;
            font-size: 15px;
            cursor: pointer;
        }

        .btn_list {
            margin-top: 100px;
            border: none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            background: darkgray;
            font-size: 15px;
            cursor: pointer;
        }

        .btn_del {
            border: none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            background: darkgray;
            font-size: 15px;
            cursor: pointer;
        }

        .reply_container {
            margin-top: 750px;
            width: 900px;
            /*height: 70px;*/
            background: red;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            /*display: none;*/
        }

        #reply_list {
            background: aqua;
        }

        .board_replys {
            /*background: red;*/
            margin-top: 150px;
            display: none;
        }

        .board_replys_show {
            /*background: red;*/
            margin-top: 150px;
            display: block;
        }

        .heart{
            height: 50px;
            width: 50px;
            border-radius: 20px;
            background: red;
        }

        .heart_off{
            height: 50px;
            width: 50px;
            border-radius: 20px;
            border: 1px solid black;
        }

    </style>
</head>

<body>

<div class="board_container">
    <div class="board_container_header">
        <div class="board_subject_container">${article.board_subject }</div>
        <div class="board_container_bo">
            <div class="board_category_container"> 카테고리명</div>
            <div class="board_date_container"> ${article.board_date}</div>
            <div class="board_name_container"> ${article.board_nickname}</div>
            <div class="board_readcount_container"> ${article.board_readcount}</div>
            <div class="board_reply_container"> ${article.board_replycount}</div>
            <div class="board_like_container"> ${article.board_likecount}</div>
        </div>
    </div>

    <div class="board_content_container">
        ${article.board_content }
    </div>

    <section id="board_middle">
        <button id="btn_reply" class="btn_reply" onclick="reply_show()">댓글보기</button>

        <div class="like_ward">
            <%--            <div class="btn_like">추천</div>--%>
            <div class="btn_like">


                <%--------- 댓글 좋아요 테스트--------%>
                <c:choose>
                    <c:when test="${okok==true}">
                        <div class="like_mini">
                        <div class="heart" onclick="like_off()"> </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="like_mini">
                        <div class="heart_off" onclick="like_on()"></div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="btn_ward">즐겨찾기</div>
        </div>

<%--        <div class="board_replys" id="board_replys">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${articleList!=null && pageInfo.listCount>0 }">--%>
<%--                    <section id="listForm">--%>
<%--                        <table>--%>
<%--                            <c:forEach var="article" items="${articleList }">--%>
<%--                                <tr>--%>
<%--                                    <td>${article.board_num }</td>--%>
<%--                                    <td>--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${article.board_re_lev!=0}">--%>
<%--                                                <c:forEach var="i" begin="0" end="${article.board_re_lev*2}">--%>
<%--                                                    &nbsp;--%>
<%--                                                </c:forEach>--%>
<%--                                                ▶이건안씀--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>댓글</c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                        <a href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">--%>
<%--                                                ${article.board_subject}--%>
<%--                                        </a>--%>
<%--                                    </td>--%>
<%--                                    <td>${article.board_nickname }</td>--%>
<%--                                    <td>${article.board_date }</td>--%>
<%--                                        &lt;%&ndash;                                    <td>${article.board_readcount }</td>&ndash;%&gt;--%>
<%--                                    <td><button class=""><a href="modifyform?board_num=${article.board_num}&page=${page}"> 수정 </a></button></td>--%>
<%--                                    <td><button class=""><a href="deleteform?board_num=${article.board_num}&page=${page}"> 삭제 </a></button></td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
<%--                        </table>--%>
<%--                    </section>--%>

<%--                </c:when>--%>

<%--            </c:choose>--%>
<%--        </div>--%>

    </section>
    <div class="reply_container" id="reply_container">
        <-- 위치 파악용 -->
    </div>
    <section id="commandList">
        <button class="btn_modify"><a href="modifyform?board_num=${article.board_num}&page=${page}"> 수정 </a></button>
        <button class="btn_list"><a href="./boardlist?page=${page}"> 글목록</a></button>
        <button class="btn_del"><a href="deleteform?board_num=${article.board_num}&page=${page}"> 삭제 </a></button>
        <div>
            첨부파일 :
            <c:if test="${article.board_fileName!=null }">
                <a href="file_down?downFile=${article.board_fileName}"> ${article.board_fileName} </a>
            </c:if>
        </div>
    </section>


    <%-- 좋아요 버튼 --%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        function like_off() {
            $(".heart").hide()
            $(".like_mini").append("<div class='heart_off' onclick='like_on()''></div>");
            alert("좋아요를 취소하셨습니다.")
        }
    </script>

    <script>
        function like_on(){
            $(".heart_off").hide()
            $(".like_mini").append("<div class='heart' onclick='like_off()''></div>");
            alert("좋아요를 누르셨습니다.")
        }
    </script>


    <%-- 댓글보기 버튼 --%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        reply_show = () => {
            if ($("#board_replys").css("display") == "none") {
                $("#board_replys").show()
            } else {
                $("#board_replys").hide()
            }
        }
    </script>

</div>

</body>
</html>