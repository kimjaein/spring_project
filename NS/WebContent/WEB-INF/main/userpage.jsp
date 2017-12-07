<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".photoGallery").click(function(){
			var iframe = "<iframe src='photoGallery.ns?memberNum="+${searchUserNum}+"'width='100%' height='600px'></iframe>";
			$('#articlePage').html(iframe);
		})
		var iframe = "<iframe src='userSingle.ns?memberNum="+${searchUserNum}+"' width='100%' height='600px'></iframe>";
		$('#articlePage').html(iframe);
		
		friendStatus();
		userPhoto();
		$('#friendList').click(function(){
			var iframe = "<iframe src='friendList.ns?memberNum="+${searchUserNum}+"' width='100%' height='600px'></iframe>";
			$('#articlePage').html(iframe);
		})
		function friendStatus (){
			$.ajax({
				type : 'post',
				url : 'friendCheck.ns',
				data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					var friendStatus = "";
					var photoBtn = "";
					if(resultData == 'friendDelete'){
						friendStatus += "<a id='friendBtn'>친구삭제<input type='hidden' value='"+resultData+"'></a>";
					}else if(resultData == 'friendRequest'){
						friendStatus += "<a id='friendBtn'>요청중<input type='hidden' value='"+resultData+"'></a>";
					}else if(resultData == 'friendInsert'){
						friendStatus += "<a id='friendBtn'>친구추가<input type='hidden' value='"+resultData+"'></a>";
					}else{
						photoBtn += '<i id="icon" class="fa fa-camera" style="font-size:24px"></i>';
					}
					
					$('#friendDiv').html(friendStatus);
					$('.navbar-brand2').after(photoBtn);
				},
				error : function() {
					alert('ajax 요청 실패');
				}		
			})	
		}
		
		function userPhoto (){
			$.ajax({
				type : 'post',
				url : 'userPhoto.ns',
				data : 'memberNum=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					var photo = "";
					if(resultData == "0"){
						photo += "<img id='userPhoto' class='img-responsive' src='assets/img/uFp_tsTJboUY7kue5XAsGAs28.png'>";
					}else{
						photo += "<img id='userPhoto' class='img-responsive' src='userPhoto/"+resultData+"'>";
					}
					$('.navbar-brand2').html(photo);
				},
				error : function() {
					alert('ajax 요청 실패');
				}		
			})	
		}
		
		$(document).on('click','#friendBtn',function(){
			var friendVal = $(this).find("input").attr('value');
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
// 						alert(resultData);
						friendStatus ();
					},
					error : function() {
						alert('ajax 요청 실패');
					}		
				})
			}else if(friendVal == 'friendRequest'){
				alert("요청중입니다.");
			}
		})
		
		$('input[name=photoFile]').on('change', function(){
			document.userPhotoForm.submit();
		})
		
		$(document).on('click', '#icon', function() {
			$('input[type=file]').click();
		})
		
	})
	
	function innerFrame(member_num){
		parent.innerFrame(member_num);
	}

</script>
</head>
<body>
	<header id="header">
		<div class="slider">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="assets/img/bg_5.jpg">
					</div>
				</div>
			</div>
		</div>
		<!--slider-->
		<nav class="navbar navbar-default">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#mainNav">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand2" href="#">
<!-- 				<img id="profileImg" class="img-responsive" src="assets/img/bg_4.jpg"> -->
				</a>
					<i id="icon" class="fa fa-camera" style="font-size:24px"></i>
						<div id="userPhotoUploadArea">
							<form action="userPhotoUpload.ns" method="post" enctype="multipart/form-data" name="userPhotoForm">
                          		<input type="hidden" name="memberNum" value="${sessionScope.memberNum}">
                          		<input type="file" name="photoFile">
                          	</form>
						</div>
				<span class="site-name"><b>${member.name}</b></span>
				
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="mainNav">
				<ul class="nav main-menu navbar-nav">
					<li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
					<li><a href="#" class="photoGallery"><i class="fa fa-photo"></i>사진첩</a></li>
					<li><a id="friendList">친구리스트</a></li>
					<li id="friendDiv"><a >Link</a></li>
				</ul>

				<ul class="nav  navbar-nav navbar-right">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</header>
	<!--/#HEADER-->
	<div id="articlePage"></div>
</body>
</html>