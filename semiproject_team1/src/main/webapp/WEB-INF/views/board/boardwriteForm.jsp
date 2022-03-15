<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
          href="/resources/asset/image/login/dog1.png"/>
    <title>게시글 작성 - 롤판.DOG</title>
    <style>

    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardwriteForm.css">

</head>
<body>
<!-- 게시판 등록 -->
<div class="background">
    <div class="background_main">
        <div class="wf_container">

			<br><br>
            <h1>게시판 글쓰기</h1>


            <%--웹에디터를 통해 입력하는 텍스트 해당 값은 textarea를 hidden 속성을 추가하여 입력된 값을 복사하여 서버로 전송--%>
            <form id="boardform" action="" method="post" enctype="multipart/form-data">

                <%-- form이 submit시 selected된 value값을 갖고 넘어간다 --%>
                <select name="board_cat" id="board_cat" class="board_cat">
                    <option value="none">== 카테고리 ==</option>
                    <option value="highlight">하이라이트</option>
                    <option value="tip">팁과노하우</option>
                    <option value="normal">자유</option>
                </select>
                <%-- 카테고리 유효성 체크 출력용 --%>
                <div id="error_cat"></div>

                <input type="hidden" id="board_content" name="board_content" value=""/>

                <%-- 글쓴이는 EL언어 표기법 value = "${session.board_name}" 이런식으로 가져오면 된다 hidden --%>
                <%--                    <label for="board_nickname">글쓴이</label>--%>
                <%--        <input type="hidden" name="board_nickname" id="board_nickname" value="mno"/><br>--%>
                <div class="board_subject_cont">
                    <input name="board_subject" type="text" id="board_subject" placeholder=" 제목"/><br>
                </div>
                <div class="board_file_cont">
                    <label for="board_file" class="btn_file"> 동영상 첨부 </label>
                    <input name="file" type="file" accept="video/mp4,video/mkv, video/x-m4v,video/*" id="board_file"
                           placeholder=" 파일첨부" class="board_file"/>
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" disabled>
                </div>
            </form>


            <div id="editor"></div>
            <br>

            <button class="btn_cc" onclick={history.back()}>취소</button>
            <button onclick="fake_submit()" class="btn_ok">작성완료</button>
        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>.
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function fake_submit() {
        let content = editor.getHTML(); // editor.getHTML(); : String
        // $("#boardform").children().eq(0).attr("value", content);
        let cat = $('.board_cat').val();
        let subject = $('#board_subject').val();
        $("#board_content").val(content);
        if (!(cat === "" || cat === "none")) {
            if (subject === "") {
            	Swal.fire({
                    title: "입력 오류",
                    text: "제목을 입력하세요",
                    icon: "error",
                    confirmButtonText: "확인"
                });
                $('#board_subject').focus()
                return false;
            }
            if(content=="<p><br></p>"){
           		Swal.fire({
        			title: "입력 오류",
        			text: "내용을 입력하세요",
        			icon: "error",
        			confirmButtonText: "확인"
        		});
        		return false;
            }
        } else {
        	Swal.fire({
                title: "선택 오류",
                text: "카테고리를 선택하세요",
                icon: "error",
                confirmButtonText: "확인"
            });
            $('.board_cat').focus()
            return;
        }
        $("#boardform").attr("action", "./regboard").submit();
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

<%-- 유효성 체크를 글쓰기, 수정 모두 적용해줘야 한다 추후 적용 --%>
<script>
    board_cat.onblur = function () {
        if (board_cat.value.includes("none")) {
            board_cat.classList.add('invalid_cat')
            error_cat.innerHTML = '카테고리를 선택해주세요'
        }
    }
    board_cat.onfocus = function () {
        if (this.classList.contains('invalid_cat')) {
            this.classList.remove('invalid_cat')
            error_cat.innerHTML = ""
        }
    }
</script>

<script>
    $("#board_file").on('change', function () {
        let fileName = $(".board_file").val();
        $(".upload-name").val(fileName);
    });
</script>


</body>
</html>