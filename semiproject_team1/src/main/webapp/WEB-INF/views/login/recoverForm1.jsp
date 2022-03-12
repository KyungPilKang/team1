<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="/resources/asset/image/login/dog1.png" />
    <title>비밀번호찾기</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
<body class="text-center">
	<main class="form-signin">
	    <img class="mb-4"
		src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
		alt="" width="80" height="80">
		<h1 class="h1 mb-3 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>
	  <form id="recoverForm">
	    <div class="form-floating">
		    <input type="email" class="form-control" id="mem_email_id" name="mem_email_id" placeholder="로그인 이메일을 입력하세요">
		    <label for="floatingInput">로그인 이메일을 입력하세요</label><br>
	    </div>
	    <button class="w-100 btn btn-lg btn-secondary" type="submit">인증코드 발송</button>
	  </form>
	  <form>
	    <div class="form-floating mt-4">
		    <input type="hidden" id="mem_email_id_2" name="mem_email_id">
		    <input type="email" class="form-control" id="mem_code" name="mem_code" placeholder="6자리 인증코드">
		    <label for="floatingInput">6자리 인증코드 입력</label><br>
	    </div>
	    <button class="w-100 btn btn-lg btn-secondary" type="submit">인증코드 제출</button>
	  </form>
	  <form>
	  	<div class="mt-4">
	    <button class="w-100 btn btn-lg btn-secondary" type="submit" style="font-size:15px; height:48px;">메일을 받지 못하셨나요? 다시보내기</button>
	  	</div>
	  </form>
	    
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	let sweetalert=(icon,title,contents)=>{
	    Swal.fire({
	        icon: icon,
	        title: title,
	        text: contents,
	        confirmButtonText: "확인"
	    })
	};
	$('#recoverForm').submit(function(){
	    function objectifyForm(formArray){		
	    	var returnArray={};
	    	for(var i=0;i<formArray.length;i++){
	    		returnArray[formArray[i]['name']]=formArray[i]['value'];
	    	}
	    	return returnArray;
	    }
	    let formdata=objectifyForm($("#recoverForm").serializeArray());
	    $.ajax({
			type:"POST",
			async:true,
			url:"http://localhost:8090/recover",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(formdata),
			success: function(data, textStatus){
				
			},
			error: function(data, textStatus){
				
			}
		});
	    return false;
	})
</script>
</html>
