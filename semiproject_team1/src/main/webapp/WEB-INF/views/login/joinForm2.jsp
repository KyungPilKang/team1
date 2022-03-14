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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <title>회원가입 - 롤판.DOG</title>

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
#email_ok{visibility: hidden;}
#nick_ok{visibility: hidden;}
#pw_ok{visibility: hidden;}
      
</style>

    
    <!-- Custom styles for this template -->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
  <body class="text-center">
 
    <!-- 롤판.dog 기본 이미지 및 폰트 -->
  
<main class="form-signin">
  <form action="/join" method="post" >
    	<a href="/main"><img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
			alt="" width="80" height="80"></a>
		<h1 class="h1 mb-3 fw-normal" style="font-family:abster;">LOLPAN.DOG</h1>

    <div style="float:center">
      <h5 class="text-white">기본정보입력</h5>
    </div>

    <div style="clear:left;">
      <textarea style="background-color:ivory; resize:none; width: 100%; height: 80px;  font: size 14px;" disabled>회원가입을 위해서 이메일 인증이 진행되며, 인증이 완료되기 전까지 회원가입이 완료가 되지 않습니다.</textarea>
    </div>
    
	<div class="form-floating mt-2">
      <input type="email" class="form-control" id="mem_email_id" name="mem_email_id" placeholder="이메일 주소" required oninput = "emailcheck()" />
      <label  for="mem_email_id">이메일 주소</label>
    </div>
    <div class="mt-2 mb-2" id="email_ok">
    .
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="mem_nickname" name="mem_nickname" placeholder="닉네임" required oninput = "nickcheck()">
      <label for="mem_nickname">닉네임</label>
    </div>
    <div class="mt-2 mb-2" id="nick_ok">
    .
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호" required oninput = "pwcheck()">
      <label for="mem_pw">비밀번호</label>
    </div>
    <div class="mt-2 mb-2" id="pw_ok">
    .
    </div>
    <div class="captcha" id=capchacon style="display:inline;">
      <img src="/captcha" id="cap_img">
	<div class="mt-2 mb-2">
		<input class="form-control" type="text" id="userin" name="userin">
	</div>
	    <input class="btn btn-success" type="button" onclick="caprefesh()" value="새로고침">
		<input class="btn btn-success" type="button" id="captchavalid" value="확인하기">	
    </div>
    

<div style="padding-top: 50px;">
  <div style="width:50%; float:left;">
  <button class="btn btn-lg btn-secondary" type="button" onclick = "history.back()" style="float:center; width: 80%;">취소</button>
</div>
<div style="width:50%; float:right;">    
<button class="btn btn-lg btn-secondary" id="form_submit"  type="submit" style="float:center; width: 80%;" disabled>가입하기</button>
</div>
</div>  
</form>
</main>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let sweetalert=(icon,title,contents)=>{
    Swal.fire({
        icon: icon,
        title: title,
        text: contents,
        confirmButtonText: "확인"
    })
</script>
<script>

	let email_ok=false;
	let nickname_ok=false;
	let pw_ok=false;
	let captcha_ok=false;
	
	function caprefesh(){
	    var imgsrc = document.getElementById("cap_img");
	     imgsrc.src = "/captcha?ver=" + Math.random();
	}
	
<!-- captcha 입력 유효성 체크 -->
$('#captchavalid').click(function () {
	if($('#userin').val()==""){
		Swal.fire({
	        icon: 'error',
	        title: '입력 오류',
	        text: '문자 또는 숫자를 다시 확인하세요',
	        confirmButtonText: "확인"
	    })
		return false;
	} 
	$.ajax({
		type:"post",
		dataType:"text",
		async:false,
		url:"http://localhost:8090/captchacheck",
		data:{userin:$('#userin').val()},
		success: function(data, textStatus){
			if(data=="false"){
				Swal.fire({
	    	        icon: 'error',
	    	        title: '입력 오류',
	    	        text: '문자 또는 숫자를 다시 확인하세요',
	    	        confirmButtonText: "확인"
	    	    })
				$('.captcha').css("display","");
				captcha_ok=false;
			} else {
				Swal.fire({
	    	        icon: 'success',
	    	        title: '입력 성공',
	    	        text: '자동 생성 방지가 완료되었습니다',
	    	        confirmButtonText: "확인"
	    	    })
				$('.captcha').css("display","none");
				captcha_ok=true;
				console.log(captcha_ok);
				if(captcha_ok==true&&email_ok==true&&nickname_ok==true){
			    	$('#form_submit').attr('disabled', false);
			    }
			}
		}
	});
});
	    
	    <!-- 이메일 db중복 체크 -->
	    function emailcheck(){
	        var mem_email_id = $('#mem_email_id').val(); //id값이 "mem_email_id"인 입력란의 값을 저장
	        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	        if(mem_email_id==''){
	        		('#email_ok').text("이메일주소를 입력하세요");
	            	$('#email_ok').css("visibility", "visible");
	            	$('#email_ok').css("color", "orangered");
	            	email_ok=false;
	    		}else{
	    			$.ajax({
		            url:"http://localhost:8090/emailCheck", //Controller에서 인식할 주소
		            type:'post', //POST 방식으로 전달
		            
		            data:{mem_email_id:mem_email_id},
		            success:function(data){ //컨트롤러에서 넘어온 data값을 받는다 
		                if(data == "true"){ //true인 경우 사용불가
		                	$('#email_ok').text("이미 가입된 이메일입니다");
		                	$('#email_ok').css("visibility", "visible");
		                	$('#email_ok').css("color", "orangered");
		                    email_ok=false;
		                } else { // 사용가능
		                	if (mem_email_id.match(regExp) == null){
		            			$('#email_ok').text("이메일 형식이 올바르지 않습니다.");
		                    	$('#email_ok').css("visibility", "visible");
		                    	$('#email_ok').css("color", "orangered");
		                        email_ok=false;
		            		}else{
		            		$('#email_ok').text("사용 가능한 이메일입니다");
		                	$('#email_ok').css("visibility", "visible");
		                	$('#email_ok').css("color", "greenyellow");
		                    email_ok=true;
		                    console.log(email_ok);
		                    if(captcha_ok==true&&email_ok==true&&nickname_ok==true){
							$('#form_submit').attr('disabled', false);
							}
		                    }
		                }
		            }
		        });
	    	}
	    }
        

<!-- 닉네임 db중복 체크 -->
    function nickcheck(){
        var mem_nickname = $('#mem_nickname').val(); //id값이 "mem_nickname"인 입력란의 값을 저장
        var spe = mem_nickname.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        if(mem_nickname==''){
     		$('#nick_ok').text("닉네임을 입력해주세요");
        	$('#nick_ok').css("visibility", "visible");
        	$('#nick_ok').css("color", "orangered");
            nickname_ok=false;
     	}else if(mem_nickname.length < 2 || mem_nickname.length > 10){
     		$('#nick_ok').text("닉네임은 2자이상 10자 미만으로 입력하세요");
        	$('#nick_ok').css("visibility", "visible");
        	$('#nick_ok').css("color", "orangered");
        	nickname_ok=false;
     	}else if(spe > 0){
     		$('#nick_ok').text("닉네임은 영문 또는 숫자로만 입력해 주세요");
        	$('#nick_ok').css("visibility", "visible");
        	$('#nick_ok').css("color", "orangered");
        	nickname_ok=false;
     	}else{
     		 $.ajax({
                 url:"http://localhost:8090/nickCheck", //Controller에서 인식할 주소
                 type:'post', //POST 방식으로 전달
                 
                 data:{mem_nickname:mem_nickname},
                 success:function(data){ //컨트롤러에서 넘어온 data값을 받는다 
                     if(data == "true"){ //true인 경우 사용불가
                     	$('#nick_ok').text("이미 사용중인 닉네임입니다");
                     	$('#nick_ok').css("visibility", "visible");
                     	$('#nick_ok').css("color", "orangered");
                         nickname_ok=false;
                     } else { // 사용가능
                     	$('#nick_ok').text("사용 가능한 닉네임입니다");
                     	$('#nick_ok').css("visibility", "visible");
                     	$('#nick_ok').css("color", "greenyellow");
                         nickname_ok=true;
                         console.log(nickname_ok);
                         if(captcha_ok==true&&email_ok==true&&nickname_ok==true){
     					   	$('#form_submit').attr('disabled', false);
     					}
                     }
                 }
             });
     	}
       
    }
    <!-- 비밀번호 유효성 체크 --> 
    function pwcheck(){
    	 var pw = $("#mem_pw").val();
    	 var num = pw.search(/[0-9]/g);
    	 var eng = pw.search(/[a-z]/ig);
    	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
    	 if(pw=='') {
    		$('#pw_ok').text("비밀번호를 입력하세요");
          	$('#pw_ok').css("visibility", "visible");
          	$('#pw_ok').css("color", "orangered");
          	pw_ok=false;
    	 }else if(pw.length < 8 || pw.length > 16){
    		$('#pw_ok').text("8자리 ~ 16자리 이내로 입력해주세요.");
         	$('#pw_ok').css("visibility", "visible");
         	$('#pw_ok').css("color", "orangered");
         	pw_ok=false;
    	 }else if(pw.search(/\s/) != -1){
    		$('#pw_ok').text("비밀번호는 공백 없이 입력해주세요.");
          	$('#pw_ok').css("visibility", "visible");
          	$('#pw_ok').css("color", "orangered");
          	pw_ok=false;
    	 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
    		$('#pw_ok').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
           	$('#pw_ok').css("visibility", "visible");
           	$('#pw_ok').css("color", "orangered");
           	pw_ok=false; 
    	 }else {
    		$('#pw_ok').text("사용 가능합니다");
         	$('#pw_ok').css("visibility", "visible");
         	$('#pw_ok').css("color", "greenyellow");	 
    	 }
    }
    
   
</script>
</body>
</html>
