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
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>ģ������</button>";
					}else if(resultData == 'friendRequest'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>��û��</button>";
					}else if(resultData == 'friendInsert'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>ģ���߰�</button>";
					}
					$('#friendDiv').html(friendStatus);
				},
				error : function() {
					alert('ajax ��û ����');
				}		
			})	
		}
		
		$(document).on('click','#friendBtn',function(){
			var friendVal = $(this).val();
			
			if(friendVal == 'friendInsert'){
				alert("inserttttt");
			}else if(friendVal == 'friendDelete'){
				alert("delete")
			}else if(friendVal == 'friendRequest'){
				alert("��û���Դϴ�. �̰� �ʿ��Ѱ�?")
			}
			$.ajax({
				type : 'post',
				url : 'friendInsert.ns',
				data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					alert("insert");
				},
				error : function() {
					alert('ajax ��û ����');
				}		
			})	
		})
		
	})

</script>
</head>
<body>
	userpageTest
	<br> ���������� ��ȣ : ${searchUserNum}
	<br> ����ȣ : ${sessionScope.memberNum}<br>
	<div id="friendDiv"></div>
	
</body>
</html>