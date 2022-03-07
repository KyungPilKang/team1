<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 요청하기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/feedback/feedbackwriteForm.css">
</head>
<body>
<div class="container">
		<div class="header">
			<h1>
				<a href="#">LOLPAN.DOG</a>
			</h1>
			<div class="nav">
				<ul>
					<li><a href="#">FEEDBACK</a></li>
					<li><a href="#">DUOMATCHING</a></li>
					<li><a href="#">FREEBOARD</a></li>
					<li><a href="#">MYPAGE</a></li>
					<li><a href="#">LOGOUT</a></li>
				</ul>
			</div>
		</div>
		<div class="hero">
		<h2>FEEDBACK</h2>
	<form name="write_form_member" method="post">
		<table width="940" style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="mbname"></td>
			</tr>
			<tr>
				<th>리플레이</th>
				<td><input type="submit" value="파일첨부"> <input
					type="submit" value="파일첨부"></td>
			</tr>
			<tr>
				<th>추가영상</th>
				<td><input type="submit" value="파일첨부"> <a href='#'
					style='cursor: help'></a></td>
			</tr>
			<tr>
				<th>캡쳐</th>
				<td><input type="submit" value="파일첨부"></td>
			</tr>
			<tr>
				<th>티어제한</th>
				<td><select name='pwhint' size='1' class='select'>
						<option value=''>선택하세요</option>
						<option value='30'>다이아몬드</option>
						<option value='31'>플래티넘</option>
						<option value='32'>골드</option>
						<option value='33'>실버</option>
						<option value='34'>브론즈</option>
						<option value='35'>아이언</option>
				</select>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="margin-left: 31px" cols="50" rows="5"
						spellcheck="true"></textarea></td>
			</tr>

			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="돌아가기" onclick="location.href='feedbackform_all'"> <input
					type="reset" value="요청제출"
					onclick="location.href='feedbackform_all'"></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</body>
</html>