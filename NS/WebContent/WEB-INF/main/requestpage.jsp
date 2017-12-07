<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var iframe = "<iframe src='single.ns' width='100%' height='600px'></iframe>";
	$('#articlePage').html(iframe);
	
	requestStatus();
	requestPhoto();
	requestName();

	function requestStatus (){
		$.ajax({
			type : 'post',
			url : 'requestCheck.ns',
			data : 'to_member_num=' + ${searchUserNum},
			dataType : 'text',
			success : function(resultData) {
				
				var requestStatus = "";
				var requestBtn = "";
				
				$.each(resultData, function(index, item){
					requestStatus += "<li><a>"+item['to_member_num']+"</a></li>";
				})
			}
				$('#badge').html(badgeList);
				if(resultData == 'add'){
					requestStatus += "<button id='requestBtn' value='"+resultData+"'>수락</button>";
				}else if(resultData == 'delete'){
					requestStatus += "<button id='requestBtn' value='"+resultData+"'>거정</button>";
					//새로고침 자동 리스트삭제
				}else{
						
				}
				$('#requestDiv').html(requestStatus);
				
			},
			error : function() {
				alert('ajax 요청 실패');
			}		
		})	
	}
	
	function requestPhoto (){
		$.ajax({
			type : 'post',
			url : 'requestPhoto.ns',
			data : 'memberNum=' + ${searchUserNum},
			dataType : 'text',
			success : function(resultData) {
				var photo = "<img id='requestPhoto' class='img-responsive' src='requestPhoto/"+resultData+"'>";
				$('.navbar-brand2').html(photo);
			},
			error : function() {
				alert('ajax 요청 실패');
			}		
		})	
	}
	
	$(document).on('click','#requestBtn',function(){
		var requestVal = $(this).val();
		
		if(requestVal == 'add'){
			$.ajax({
				type : 'post',
				url : 'requestCheck.ns',
				data : 'to_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					if(resultData == 1){
						requestStatus ();
						parent.sendMessage(${searchUserNum});
					}
				},
				error : function() {
					alert('ajax 요청 실패');
				}		
			})
		}else if(requestVal == 'delete'){
			$.ajax({
				type : 'post',
				url : 'requestCheck.ns',
				data : 'to_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					alert(resultData);
					requestStatus ();
				},
				error : function() {
					alert('ajax 요청 실패');
				}		
			})
		}else if{
			alert("");
		}
	})
	
	$('input[name=photoFile]').on('change', function(){
		document.userPhotoForm.submit();
	})
	
	$(document).on('click', '#icon', function() {
		$('input[type=file]').click();
	})
	// ? 
})

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
	<!--slider--> <nav class="navbar navbar-default"> <!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">

		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#mainNav">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<a class="navbar-brand2" href="#"> <!-- 				<img id="profileImg" class="img-responsive" src="assets/img/bg_4.jpg"> -->
		</a>
		<!-- 					<i id="icon" class="fa fa-camera" style="font-size:24px"></i> -->
		<div id="userPhotoUploadArea">
			<form action="userPhotoUpload.ns" method="post"
				enctype="multipart/form-data" name="userPhotoForm">
				<input type="hidden" name="memberNum"
					value="${sessionScope.memberNum}"> <input type="file"
					name="photoFile">
			</form>
		</div>
		<span class="site-name"><b>Roland</b> Maruntelu</span>

	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="mainNav">
		<ul class="nav main-menu navbar-nav">
			<li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
			<li><a href="#">Link</a></li>
			<li><a href="#">Link</a></li>
		</ul>

		<ul class="nav  navbar-nav navbar-right">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
		</ul>
	</div>
	<!-- /.navbar-collapse --> </nav> </header>
	<!--/#HEADER-->
	<div id="articlePage"></div>
</body>
</html>
</script>
</head>
<body>
	userpageTest
	<br> 유저페이지 번호 : ${searchUserNum}
	<br> 내번호 : ${sessionScope.memberNum}
	<br>
	<div id="friendDiv"></div>

</body>
</html>