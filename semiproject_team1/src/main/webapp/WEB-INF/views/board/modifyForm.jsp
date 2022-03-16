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
    <title>게시글 수정 - 롤판.DOG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/boardwriteForm.css">
</head>
<body>

<div class="background">
    <div class="background_main">
        <div class="wf_container">

			<br><br>
           	<h1>글 수정</h1>

            <%--웹에디터를 통해 입력하는 텍스트 해당 값은 textarea를 hidden 속성을 추가하여 입력된 값을 복사하여 서버로 전송--%>
            <form id="modifyform" action="" method="post" enctype="multipart/form-data">

                <%-- form이 submit시 selected된 value값을 갖고 넘어간다. --%>
                <select name="board_cat" id="board_cat" class="board_cat">
                    <option value="none">== 카테고리 ==</option>
                    <option value="highlight">하이라이트</option>
                    <option value="tip">팁과노하우</option>
                    <option value="normal">자유</option>
                </select>
                <%-- 카테고리 유효성 체크 출력용 --%>
                <input type="hidden" id="board_num" name="board_num" value="${article.board_num}"/>
		        <input type="hidden" id="board_content" name="board_content"/>
		
		        <div class="board_subject_cont">
		            <input name="board_subject" type="text" id="board_subject" placeholder=" 제목" value="${article.board_subject}"/><br>
		        </div>
            </form>

            <div id="editor">${article.board_content}</div>
    		<br>

            <button class="btn_cc" onclick={history.back()}>취소</button>
            <button onclick="modify_submit()" class="btn_ok">작성완료</button>
        </div>
    </div>
</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function modify_submit() {
        let content = editor.getHTML();
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
    
    $("#board_file").on('change', function () {
        let fileName = $(".board_file").val();
        $(".upload-name").val(fileName);
    });
</script>




</body>
</html>
