<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
				$.ajax({
					type : 'post',
					url : 'friendInsert.ns',
					data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
					dataType : 'text',
					success : function(resultData) {
						if(resultData == 1){
							friendStatus ();
							parent.sendMessage(${searchUserNum});
						}
					},
					error : function() {
						alert('ajax ��û ����');
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
						alert('ajax ��û ����');
					}		
				})
			}else if(friendVal == 'friendRequest'){
				alert("��û���Դϴ�. �̰� �ʿ��Ѱ�? �ٸ� �����ž���?");
			}
		})
		
	})

</script>
</head>
<body>
	userpageTest
	<br> ���������� ��ȣ : ${searchUserNum}
	<br> ����ȣ : ${sessionScope.memberNum}
	<br>
	<div id="friendDiv"></div>

	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="http://keenthemes.com/preview/metronic/theme/assets/admin/pages/media/profile/profile_user.jpg"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${searchUserNum}</div>
						<div class="profile-usertitle-job">${sessionScope.memberNum}</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<a href="#" class="btn btn-info"><span
							class="glyphicon glyphicon-user"></span>ģ���߰�</a> <a href="#"
							class="btn btn-danger"><span
							class="glyphicon glyphicon-remove"></span>ģ������</a>
					</div>
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i
									class="glyphicon glyphicon-th-list"></i> Ÿ�Ӷ���
							</a></li>
							<li><a href="#"> <i class="glyphicon glyphicon-user"></i>
									ģ������Ʈ
							</a></li>
							<li><a href="#" target="_blank"> <i
									class="glyphicon glyphicon-picture"></i> ����
							</a></li>
							<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
									Help
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-9">
				<div class="profile-content">Some user related content goes
					here...</div>
			</div>
		</div>
	</div>
	<center></center>
	<br>
	<br>

</body>
</html>