<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 날짜변경 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
          href="/resources/asset/image/login/dog1.png"/>
    <title>피드백 요청 - 롤판.DOG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackwriteForm.css">
</head>
<body>

<div class="container">

    <%-- 헤더 영역--%>
    <div class="header">
        <h1>
            <a href="/"> <img class="mb-4"
                              src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
                              alt="" width="60" height="60"> LOLPAN.DOG
            </a>
        </h1>
        <div class="nav">
            <div class="nav">
                <ul>
                    <li><a href="/feedback">FEEDBACK</a></li>
                    <li><a href="/boardlist">FREEBOARD</a></li>
                    <c:choose>
                        <c:when test="${not empty mem_mno }">
                            <%--                        <c:when test="${empty mem_mno }">--%>
                            <li><a href="">DUO</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/login?page=board">LOGIN</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>


    <div class="fd_write_body">
        <div class="fd_write_body_inner">
            <div class="fd_request_btn">
                <button type="button" onclick="location.href='/feedbackwriteform' ">피드백 요청하기</button>
            </div>
            <div class="fd_wr_subject">
                <span>제목</span><input type="text"></div>
            <div class="fd_wr_replay">
                <label for="fd_replay" class="fd_replay"> 동영상 첨부 </label>
                <input name="file" type="file" accept="video/mp4,video/mkv, video/x-m4v,video/*" id="fd_replay"
                       placeholder=" 파일첨부" class="fd_replay"/>
                <input class="upload-name1" value="첨부파일" placeholder="첨부파일" disabled>
            </div>
            <div class="fd_wr_file">
                <label for="fd_file" class="fd_file"> 동영상 첨부 </label>
                <input name="file" type="file" accept="video/mp4,video/mkv, video/x-m4v,video/*" id="fd_file"
                       placeholder=" 파일첨부" class="fd_file"/>
                <input class="upload-name2" value="첨부파일" placeholder="첨부파일" disabled>
            </div>
            <div class="fd_wr_capture">
                <label for="fd_capture" class="fd_capture"> 동영상 첨부 </label>
                <input name="file" type="file" accept="video/mp4,video/mkv, video/x-m4v,video/*" id="fd_capture"
                       placeholder=" 파일첨부" class="fd_capture"/>
                <input class="upload-name3" value="첨부파일" placeholder="첨부파일" disabled>
            </div>






            <div class-="fd_wr_limit">
                <span>티어제한</span>
                <select name='pwhint' size='1' class='select'>
                    <option value=''>선택하세요</option>
                    <option value='30'>다이아몬드</option>
                    <option value='31'>플래티넘</option>
                    <option value='32'>골드</option>
                    <option value='33'>실버</option>
                    <option value='34'>브론즈</option>
                    <option value='35'>아이언</option>
                </select>
            </div>
            <div class="fd_wr_request">요청사항</div>
            <div id="editor" class="editor"></div>

            <div>
                <button>돌아가기</button>
                <button>요청제출</button>
            </div>



        </div>
    </div>
</div>


<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
    const Editor = toastui.Editor;
    const editor = new Editor({
        el: document.querySelector('#editor'),
        height: '600px',
        toolbarItems: [
            ['heading', 'bold', 'italic', 'strike', 'hr'],
            ['ul', 'ol', 'task'],
            ['table', 'image', 'link'],
            ['code', 'codeblock'],
            ['scrollSync'],
        ],
        initialEditType: 'wysiwyg',
        previewStyle: 'tab'
    });
</script>

<script>
    $("#fd_replay").on('change',function(){
        let fileName = $("#fd_replay").val();
        $(".upload-name1").val(fileName);
    });
</script>
<script>
    $("#fd_file").on('change',function(){
        let fileName = $("#fd_file").val();
        $(".upload-name2").val(fileName);
    });
</script>
<script>
    $("#fd_capture").on('change',function(){
        let fileName = $(".fd_capture").val();
        $(".upload-name3").val(fileName);
    });
</script>


</body>
</html>