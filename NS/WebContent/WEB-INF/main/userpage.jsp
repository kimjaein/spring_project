<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		$.ajax({
			type : 'post',
			url : 'friendCheck.ns',
			data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
			dataType : 'text',
			success : function(resultData) {
				alert(resultData)
			},
			error : function() {
				alert('ajax ��û ����');
			}		
		})
	})

	function init(){
		alert("inittt");
		
		test();
	}
</script>
</head>
<body>
	userpageTest
	<br> ���������� ��ȣ : ${searchUserNum}
	<br> ����ȣ : ${sessionScope.memberNum}<br>
	<div id="friendBtn"></div>
</body>
</html>