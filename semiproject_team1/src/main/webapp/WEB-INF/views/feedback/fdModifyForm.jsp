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
    <title>피드백 수정 - 롤판.DOG</title>

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
            <form id="feedbackform" action="" method="post" enctype="multipart/form-data">
                <div class="fd_request">
                    <h1>피드백 수정하기</h1>
                </div>

                <div class="fd_wr_subject" id="fd_wr_subject">
                    <span>제목</span><input type="text" name="feedback_subject" id="feedback_subject" value="${article.feedback_subject}"></div>

                <div class="fd_wr_request">요청사항</div>
                <%--write와 다르게 modify의 경우 feedback_num을 컨트롤러에 넘겨줘야된다. --%>
                <input type="hidden" id="feedback_num" name="feedback_num" value="${article.feedback_num}"/>
                <input type="hidden" class="feedback_content" id="feedback_content" name="feedback_content" value=""/>
            </form>

            <div id="editor" class="editor">${article.feedback_content}</div>

            <div>
                <button class="btn_cc" onclick={history.back()}>돌아가기</button>
                <button onclick="fd_submit()" class="btn_ok">요청제출</button>
            </div>

        </div>
    </div>
</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function fd_submit() {
        let content = editor.getHTML();
        let subject = $('#feedback_subject').val();
        $("#feedback_content").val(content);
        if (subject === "") {
            alert("제목을 입력하세요")
            $('#feedback_subject').focus()
            return;
        }
        $("#feedbackform").attr("action","./feedbackmodify").submit();
    }
</script>


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


</body>
</html>