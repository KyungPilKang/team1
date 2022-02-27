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
