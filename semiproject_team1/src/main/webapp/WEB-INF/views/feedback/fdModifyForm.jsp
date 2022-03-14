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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedback/feedbackwriteForm2.css">
</head>
<body>
<div class="background">
    <div class="background_main">
        <div class="wf_container">

			<br><br>
            <h1>피드백 수정</h1>


            <%--웹에디터를 통해 입력하는 텍스트 해당 값은 textarea를 hidden 속성을 추가하여 입력된 값을 복사하여 서버로 전송--%>
            <form id="feedbackform" action="" method="post" enctype="multipart/form-data">

                <input type="hidden" id="board_content" name="board_content" value=""/>

                <%-- 글쓴이는 EL언어 표기법 value = "${session.board_name}" 이런식으로 가져오면 된다. hidden --%>
                <%--                    <label for="board_nickname">글쓴이</label>--%>
                <%--        <input type="hidden" name="board_nickname" id="board_nickname" value="mno"/><br>--%>
                <div class="board_subject_cont">
                    <input name="feedback_subject" type="text" id="board_subject" value="${article.feedback_subject}" readOnly/><br>
                </div>
                <input type="hidden" id="feedback_num" name="feedback_num" value="${article.feedback_num}"/>
                <input type="hidden" class="feedback_content" id="feedback_content" name="feedback_content" value=""/>
            </form>

            <div id="editor" class="editor">${article.feedback_content}</div><br>

            <button class="btn_cc" onclick={history.back()}>돌아가기</button>
            <button onclick="fd_submit()" class="btn_ok">수정하기</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function fd_submit() {
        let content = editor.getHTML();
        let subject = $('#feedback_subject').val();
        $("#feedback_content").val(content);
        if (subject === "") {
        	Swal.fire({
				title: "입력 오류",
				text: "제목을 입력하세요",
				icon: "error",
				confirmButtonText: "확인"
			}).then((result)=>{
				 $('#feedback_subject').focus()
				 
				})
				return false;
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