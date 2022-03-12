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
		<h1 class="h1 mb-4 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>
		<h5 class="mb-1 fw-normal" style="color:orangered;">관리자 LOL 계정 친구요청을</h5>
		<h5 class="mb-1 fw-normal" style="color:orangered;">반드시 수락하세요</h5>
		<h5 class="mb-4 fw-normal" style="color:orangered;">ID : LOLPANDOG</h5>
	  <form id="idLinkForm">
	    <div class="form-floating">
		    <input type="text" class="form-control" id="mem_link_id" name="mem_link_id" placeholder="연동할 아이디를 입력하세요">
		    <label for="floatingInput">연동할 아이디를 입력하세요</label><br>
	    </div>
	    <button class="w-100 btn btn-lg btn-secondary" type="submit">인증코드 발급</button>
	  </form>
	  <form id="codeConfirmForm">
	    <div class="form-floating mt-4">
		    <input type="text" class="form-control" id="mem_link_code" name="mem_link_code" placeholder="6자리 인증코드">
		    <label for="floatingInput">6자리 인증코드 입력</label><br>
	    </div>
	    <button class="w-100 btn btn-lg btn-secondary" type="submit">인증코드 제출</button>
	  </form>
	  <div class="mt-4">
	    <button class="w-100 btn btn-lg btn-secondary" onclick ="history.back()">돌아가기</button>
	  </div>
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let sweetalert=(icon,title,contents)=>{
	    Swal.fire({
	        icon: icon,
	        title: title,
	        text: contents,
	        confirmButtonText: "확인"
	    })
	};
	$('#idLinkForm').submit(function(){
		if($('#mem_link_id').val()==""){
			Swal.fire({
		        icon: "error",
		        title: "입력 오류",
		        text: "아이디를 입력하시기 바랍니다",
		        confirmButtonText: "확인"
		    })
		    return false;
		}
	    function objectifyForm(formArray){		
	    	var returnArray={};
	    	for(var i=0;i<formArray.length;i++){
	    		returnArray[formArray[i]['name']]=formArray[i]['value'];
	    	}
	    	return returnArray;
	    }
	    let formdata=objectifyForm($("#idLinkForm").serializeArray());
	    $.ajax({
			type:"POST",
			async:true,
			url:"http://localhost:8090/idlink",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(formdata),
			success: function(data, textStatus){
				Swal.fire({
			        icon: "success",
			        title: "인증코드 발급 완료",
			        text: data+" 계정으로 인증코드 메세지가 발송되었습니다",
			        confirmButtonText: "확인"
			    })
			},
			error: function(data, textStatus){
				
			}
		});
	    return false;
	})
	$('#codeConfirmForm').submit(function(){
	    function objectifyForm(formArray){		
	    	var returnArray={};
	    	for(var i=0;i<formArray.length;i++){
	    		returnArray[formArray[i]['name']]=formArray[i]['value'];
	    	}
	    	return returnArray;
	    }
	    let formdata=objectifyForm($("#codeConfirmForm").serializeArray());
	    $.ajax({
			type:"POST",
			async:true,
			url:"http://localhost:8090/codeconfirm",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(formdata),
			success: function(data, textStatus){
				Swal.fire({
			        icon: "success",
			        title: "계정 연동 완료",
			        text: data+" 계정으로 연동이 완료되었습니다",
			        confirmButtonText: "확인"
			    }).then((result)=>{
			    	window.location.href="/mypage";
			    })
			},
			error: function(data, textStatus){
				Swal.fire({
			        icon: "error",
			        title: "계정 연동 실패",
			        text: "발송된 인증코드를 다시 확인하시기 바랍니다",
			        confirmButtonText: "확인"
			    })
			}
		});
	    return false;
	})
</script>
</html>
