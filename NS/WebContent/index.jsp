<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>NS</title>
</head>
<body>
<!-- 수람이형바보 -->
	<form action="login.ns" method="post">
		<table border="1">
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="id" placeholder="이메일 입력">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="pw" placeholder="이메일 입력">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
	
	<form action="join.ns" method="post">
		<table border="1">
			<tr>
				<td>아이디(email)</td>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="text" name="pwsub">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="birth">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender">남
					<input type="radio" name="gender">여
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>	
	</form>	
</body>
</html>