<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		friendStatus();
		
		$.ajax({
		
		})
		
		function friendStatus (){
			$.ajax({
				type : 'post',
				url : 'friendCheck.ns',
				data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					var friendStatus = "";
					if(resultData == 'friendDelete'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>친구삭제</button>";
					}else if(resultData == 'friendRequest'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>요청중</button>";
					}else if(resultData == 'friendInsert'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>친구추가</button>";
					}
					$('#friendDiv').html(friendStatus);
				},
				error : function() {
					alert('ajax 요청 실패');
				}		
			})	
		}
		
		$(document).on('click','#friendBtn',function(){
			var friendVal = $(this).val();
			
			if(friendVal == 'friendInsert'){
				$.ajax({
					type : 'post',
					url : 'friendInsert.ns',
					data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
					dataType : 'text',
					success : function(resultData) {
						alert(resultData);
						friendStatus ();
					},
					error : function() {
						alert('ajax 요청 실패');
					}		
				})
			}else if(friendVal == 'friendDelete'){
				$.ajax({
					type : 'post',
					url : 'friendDelete.ns',
					data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
					dataType : 'text',
					success : function(resultData) {
						alert(resultData);
						friendStatus ();
					},
					error : function() {
						alert('ajax 요청 실패');
					}		
				})
			}else if(friendVal == 'friendRequest'){
				alert("요청중입니다. 이게 필요한가? 다른 좋은거없나?");
			}
		})
		
	})

</script>
</head>
<body>
	userpageTest
	<br> 유저페이지 번호 : ${searchUserNum}
	<br> 내번호 : ${sessionScope.memberNum}<br>
	<div id="friendDiv"></div>
	
</body>
</html>