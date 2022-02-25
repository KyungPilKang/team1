<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>글쓰기</title>
    <style>
        h2{
            margin-left : 10px;
        }

        #editor {
            width: 700px;
            margin-top:25px;
            /*margin: 0 auto;*/
        }

        /*#fake{*/
        /*    display: none;*/
        /*}*/

        .wf_container{
            width: 698px;
            height: 1000px;
            margin-left: 33%;
        }

        .board_cat{
            padding:5px;
            color: #696969;
            height: 40px;
            width: 140px;
            border: 1px solid darkgray;
            border-radius : 5px;
            margin: 8px 0;
        }

        #board_subject{
            padding-left: 10px;
            border : 1px solid darkgray;
            height: 40px;
            width: 693px;
            margin : 8px 0;
            font-size:14px;
        }
        .board_file_cont{
            margin: 16px 0;
        }
        #board_file{
            display: none;
        }
        .btn_file{
            width: 150px;
            height: 48px;
            padding: 6px 25px;
            background-color:darkgray;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }
        .btn_cc{
            border : none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            background: darkgray;
            color:white;
            font-size:15px;
            cursor: pointer;
        }

        .btn_ok{
            border : none;
            border-radius: 4px;
            width: 120px;
            height: 48px;
            float:right;
            background: darkgray;
            color:white;
            font-size:15px;
            cursor: pointer;
        }
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <%--    <link href="CSS 파일 경로" rel="stylesheet" type="text/css">--%>

</head>
<body>
<!-- 게시판 등록 -->

<div class="wf_container">

    <h2>글쓰기</h2>


    <%--웹에디터를 통해 입력하는 텍스트 해당 값은 textarea를 hidden 속성을 추가하여 입력된 값을 복사하여 서버로 전송--%>
    <form id="boardform" action="" method="post" enctype="multipart/form-data">

        <%-- form이 submit시 selected된 value값을 갖고 넘어간다. --%>
        <select name="board_cat" id="board_cat" class="board_cat">
            <option value="none">== 카테고리 ==</option>
            <option value="highlight">하이라이트</option>
            <option value="tip">팁과노하우</option>
            <option value="normal">자유</option>
        </select>

        <input type="hidden" id="board_content" name="board_content" value=""/>

        <%-- 글쓴이는 EL언어 표기법 value = "${session.board_name}" 이런식으로 가져오면 된다. hidden --%>
<%--                    <label for="board_nickname">글쓴이</label>--%>
<%--        <input type="hidden" name="board_nickname" id="board_nickname" value="mno"/><br>--%>
        <div class="board_subject_cont">
            <input name="board_subject" type="text" id="board_subject" placeholder=" 제목"/><br>
        </div>
        <div class="board_file_cont">
            <label for="board_file" class="btn_file"> 파일 첨부 </label>
            <input name="file" type="file" id="board_file" placeholder=" 파일첨부"/>
        </div>
    </form>

    <div id="editor"></div>
    <br>

    <button class="btn_cc" onclick={history.back()}>취소</button>
    <button onclick="fake_submit()" class="btn_ok">작성완료</button>

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function fake_submit() {
        let content = editor.getHTML(); // editor.getHTML(); : String
        // $("#boardform").children().eq(0).attr("value", content);
        $("#board_content").val(content);
        $("#boardform").attr("action", "./regboard").submit();
    }
</script>

<script
        src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
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


<%-- ajax --%>

<%--    <script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
<%--    <script>--%>
<%--        $(function () {--%>
<%--            $("#form_submits").click(function () {--%>
<%--                let board = {--%>
<%--                    board_name: $("#board_name").val(),--%>
<%--                    // board_pass: $("#board_pass").val(),--%>
<%--                    board_subject: $("#board_subject").val(),--%>
<%--                    board_content: editor.getHTML()--%>
<%--                }--%>
<%--                $.ajax({--%>
<%--                    async: true,--%>
<%--                    type: 'POST',--%>
<%--                    contentType: 'application/json; charset=utf-8',--%>
<%--                    data: JSON.stringify(board),--%>
<%--                    url: "http://localhost:8090/board/boardwrite",--%>
<%--                    dataType: "text",--%>
<%--                    success: function (data) {--%>
<%--                        console.log(data);--%>
<%--                        alert("게시글이 등록되었습니다.");--%>
<%--                        window.location.href = './boardlist';--%>
<%--                    },--%>
<%--                    error: function (jqXHR, textStatus, errorThrown) {--%>
<%--                        alert("ERROR : " + textStatus + " : " + errorThrown);--%>
<%--                    }--%>
<%--                });--%>
<%--            })--%>
<%--        })--%>
<%--    </script>--%>

</body>
</html>