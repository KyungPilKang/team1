<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 요청하기</title>
</head>
<body>
	<div class='a'>
		<img class="mb-4"
			src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png"
			alt="" width="72" height="57">
		<h5 class='title'>롤판.DOG</h5>

		<span class="s1"> <input type="button"
			class="btn btn-danger btn-block" value='피드백'
			onclick="location.href='test1.html'"></span> <span class="s2"><input
			type="button" class="btn btn-danger btn-block" value='듀오매칭'
			onclick="location.href='test2.html'"></span> <span class="s3"><input
			type="button" class="btn btn-danger btn-block" value='자유게시판'
			onclick="location.href='test3.html'"></span> <span class="s3"><input
			type="button" class="btn btn-danger btn-block" value='마이페이지'
			onclick="location.href='test3.html'"></span> <span class="s3"><input
			type="button" class="btn btn-danger btn-block" value='로그아웃'
			onclick="location.href='test3.html'"></span>
	</div>
	<div class="card-body">
		<h3 class="mb-4">피드백</h3>
	</div>

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
				<th>요청사항</th>
				<td><textarea style="margin-left: 31px" cols="50" rows="5"
						spellcheck="true"></textarea></td>
			</tr>

			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="돌아가기"> <input type="reset" value="요청제출"></td>
			</tr>
		</table>
		</td>
		</tr>
	</form>
</body>
</html>