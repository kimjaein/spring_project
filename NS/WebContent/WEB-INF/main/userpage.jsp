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
				alert('ajax 요청 실패');
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
	<br> 유저페이지 번호 : ${searchUserNum}
	<br> 내번호 : ${sessionScope.memberNum}<br>
	<div id="friendBtn"></div>
</body>
</html>