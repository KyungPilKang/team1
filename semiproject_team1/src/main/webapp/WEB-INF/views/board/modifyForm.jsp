<%--
  Created by IntelliJ IDEA.
  User: ParkJS
  Date: 2022-03-02
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>롤판.DOG 수정</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardwriteForm.css">
</head>
<body>


<div class="wf_container">

    <h2>수정</h2>

    <form id="modifyform" action="" method="post" enctype="multipart/form-data">

        <select name="board_cat" id="board_cat" class="board_cat">
            <option value="none">== 카테고리 ==</option>
            <option value="highlight">하이라이트</option>
            <option value="tip">팁과노하우</option>
            <option value="normal">자유</option>
        </select>
        <%--write와 다르게 modify의 경우 board_num을 컨트롤러에 넘겨줘야된다. --%>
        <input type="hidden" id="board_num" name="board_num" value="${article.board_num}"/>
        <input type="hidden" id="board_content" name="board_content"/>

        <%-- 글쓴이는 EL언어 표기법 value = "${session.board_name}" 이런식으로 가져오면 된다. hidden --%>
        <%--                    <label for="board_nickname">글쓴이</label>--%>
        <%--        <input type="hidden" name="board_nickname" id="board_nickname" value="mno"/><br>--%>
        <div class="board_subject_cont">
            <input name="board_subject" type="text" id="board_subject" placeholder=" 제목" value="${article.board_subject}"/><br>
        </div>
<%--        <div class="board_file_cont">--%>
<%--            <label for="board_file" class="btn_file"> 파일 첨부 </label>--%>
<%--            <input name="file" type="file" id="board_file" placeholder=" 파일첨부"/>--%>
<%--        </div>--%>
    </form>

    <div id="editor">${article.board_content}</div>
    <br>

    <button class="btn_cc" onclick={history.back()}>취소</button>
    <button onclick="modify_submit()" class="btn_ok">작성완료</button>

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function modify_submit() {
        let content = editor.getHTML();
        let cat = $('.board_cat').val();
        let subject = $('#board_subject').val();
        $("#board_content").val(content);
        if (!(cat === "" || cat === "none")) {
            if (subject === "") {
                alert("제목을 입력하세요")
                $('#board_subject').focus()
                return;
            }
        } else {
            alert("카테고리를 선택하세요")
            $('.board_cat').focus()
            return;
        }
        $("#modifyform").attr("action", "./boardmodify").submit();
    }
</script>

<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
    const Editor = toastui.Editor;
    const editor = new Editor({
        el: document.querySelector('#editor'),
        height: '600px',
        toolbarItems: [
            ['heading', 'bold', 'italic', 'strike','hr'],
            ['ul', 'ol', 'task'],
            ['table', 'image', 'link'],
            ['code', 'codeblock'],
            ['scrollSync'],
        ],
        initialEditType: 'wysiwyg',
        previewStyle: 'tab'
    });
</script>

<%-- 이전 카테고리값으로 select하는 스크립트 --%>
<script>
    let select_cat = "${article.board_cat}";
    $(".board_cat").val(select_cat).prop("selected", true);
</script>




</body>
</html>
