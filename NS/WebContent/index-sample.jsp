<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>NS</title>
</head>
<body>
<!-- ���������ٺ� -->
	<form action="login.ns" method="post">
		<table border="1">
			<tr>
				<td>�̸���</td>
				<td>
					<input type="text" name="id" placeholder="�̸��� �Է�">
				</td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td>
					<input type="text" name="pw" placeholder="�̸��� �Է�">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="�α���">
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
	
	<form action="join.ns" method="post">
		<table border="1">
			<tr>
				<td>���̵�(email)</td>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td>
					<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ��</td>
				<td>
					<input type="text" name="pwsub">
				</td>
			</tr>
			<tr>
				<td>�������</td>
				<td>
					<input type="text" name="birth">
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<input type="radio" name="gender">��
					<input type="radio" name="gender">��
				</td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td>
					<input type="text" name="address">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="ȸ������">
				</td>
			</tr>
		</table>	
	</form>	
</body>
</html>