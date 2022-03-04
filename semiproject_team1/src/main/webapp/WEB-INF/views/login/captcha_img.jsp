<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="/captcha"><br>

	<input type="text" id="userin" name="userin">
	<input id="capchavalid" type="submit" value="전송">	

<a><span class="result">결과는${result }</span></a>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>
	    $('#capchavalid').click(function () {
	    	if($('#userin').val()==""){
				alert("문자 또는 숫자를 입력하세요");
				
				return false;
			} 
			$.ajax({
				type:"post",
				dataType:"text",
				async:false,
				url:"http://localhost:8090/captchacheck",
				data:{id:$('#userin').val()},
				success: function(data, textStatus){
					if(result=="true"){
						alert("정상입니다");
						$('#capchacon').attr("display", 'inline');
					} else {
						alert("문자 또는 숫자를 다시 확인하세요");
						$('#capchacon').attr("display", 'none');
					}
				}
			});
		});
	    </script>
</body>
</html>