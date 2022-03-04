<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <style>
        .back-drop{
            display: none;
        }

    </style>
</head>
<body>

<%-- 무한스크롤의 핵심은 스크롤시 끝에 닿으면 새로운 페이지를 불러온 후 붙여주는 것 --%>
<%-- 즉, 스크립트에서 페이지를 +1 시켜서 ajax로 요청하면 된다 --%>
<%-- 기존 게시물을 10개씩 불러오는 방법을 이용하여 리플을 10개씩 불러오고, --%>
<%-- 하단의 페이지 번호를 클릭하여 이동하던걸 스크롤링시 자동으로 처리해주면 된다  --%>

<%-- 큰틀에서 위와 같은 방식으로 구현이 되었다면 이후 세부적인 기능(댓글쓰기, 수정, 좋아요 등)을 붙인다 --%>


<div style="background: dimgrey">
    ----------------------------------------------------------------------------------------
</div>
<div>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
    무한 스크롤 테스트<br>
</div>
<div style="background: #0739ff">
   ----------------------------------------------------------------------------------------
</div>
<br>

<div class="back-drop">
    로딩 중...
</div>

<div class="attr"></div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(window).on("scroll", function () {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            $(".back-drop").show();
            $.ajax({
                async: true,
                type: 'GET',
                url: "http://localhost:8090/test",
                success: function (data) {
                    console.log(data);
                    $(".attr").append(data);
                    $(".back-drop").hide();
                },
                error: function (textStatus) {
                    alert("ERROR : " + textStatus);
                }
            });
        }
    })
</script>








</body>
</html>
