<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Facebook Theme Demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<script type="text/javascript">
	var flag = true;
	function openNav() {
		if (flag) {
			document.getElementById("mySidenav").style.width = "200px";
			flag = false;
		} else {
			document.getElementById("mySidenav").style.width = "0";
			flag = true;
		}
	}
</script>
</head>


<body>

	<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">
				<!-- main right col -->
				<div class="column col-sm-12 col-xs-12" id="main">

					<!-- top nav -->
					<div class="navbar navbar-blue navbar-static-top">
						<div class="navbar-header">
							<button class="navbar-toggle" type="button"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle</span> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
							<a href="http://usebootstrap.com/theme/facebook"
								class="navbar-brand logo">b</a>
						</div>
						<nav class="collapse navbar-collapse" role="navigation">
							<form class="navbar-form navbar-left">
								<div class="input-group input-group-sm"
									style="max-width: 360px;">
									<input class="form-control" placeholder="Search"
										name="srch-term" id="srch-term" type="text">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="glyphicon glyphicon-home"></i>
										Home</a></li>
								<li><a href="#postModal" role="button" data-toggle="modal"><i
										class="glyphicon glyphicon-plus"></i> Post</a></li>
								<li><a href="#"><span class="badge">badge</span></a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									onclick="openNav()"> <i class="glyphicon glyphicon-user"></i></a>
								</li>
							</ul>
						</nav>
					</div>
					<!-- /top nav -->


				</div>
				<!-- /main -->

			</div>
		</div>
	</div>
	<!-- single 페이지일 경우 프로필 등의 탭은 아래의 div에 뿌림  -->
	<div id="singlePage">
	
	</div>
	<!-- 아래 div에 iframe (슬라이드)-->
	<div>
	
	</div>


	<!--post modal-->
	<!-- 글 작성 form -->
	<div id="postModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">x</button>
					Update Status
				</div>
				<div class="modal-body">
					<form class="form center-block">
						<div class="form-group">
							<textarea class="form-control input-lg" autofocus=""
								placeholder="What do you want to share?"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div>
						<button class="btn btn-primary btn-sm" data-dismiss="modal"
							aria-hidden="true">Post</button>
						<ul class="pull-left list-inline">
							<li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li>
							<li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li>
							<li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- sidebar 접속한친구리스트 이 div 내부에 <a href="#">친구1</a> 형태로 뿌리면 됨-->
	<div id="mySidenav" class="sidenav">
		<a href="#">친구1</a>
		<a href="#">친구2</a> 
		<a href="#">친구3</a> 
		<a href="#">친구4</a>
	</div>

	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('[data-toggle=offcanvas]')
									.click(
											function() {
												$(this)
														.toggleClass(
																'visible-xs text-center');
												$(this)
														.find('i')
														.toggleClass(
																'glyphicon-chevron-right glyphicon-chevron-left');
												$('.row-offcanvas')
														.toggleClass('active');
												$('#lg-menu').toggleClass(
														'hidden-xs')
														.toggleClass(
																'visible-xs');
												$('#xs-menu').toggleClass(
														'visible-xs')
														.toggleClass(
																'hidden-xs');
												$('#btnShow').toggle();
											});
						});
	</script>
</body>
</html>