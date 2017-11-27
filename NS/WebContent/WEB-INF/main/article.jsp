<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	//WebSocketEx는 프로젝트 이름
	//websocket 클래스 이름
	var webSocket = new WebSocket("ws://localhost:8888/NS/ws");
	//웹 소켓이 연결되었을 때 호출되는 이벤트
	webSocket.onopen = function(message) {

	};
	//웹 소켓이 닫혔을 때 호출되는 이벤트
	webSocket.onclose = function(message) {
	};

	function sendMessage() {
		var message = document.getElementById("textMessage");
		webSocket.send(message.value);
		message.value = "";
	}

	//웹소켓 종료
	webSocket.close = function(message) {

	};

	$(function() {
		$(document)
				.on(
						'click',
						'#btnComment',
						function() {
							$
									.ajax({
										type : 'post',
										url : 'iframetest.ns',
										data : '',
										dataType : 'text',
										success : function(resultData) {
											var iframe;
											iframe = "<iframe src='http://localhost:8888/NS/'></iframe>";
											$('#test2').html(iframe);
										},
										error : function() {
											alert('ajax 요청 실패');
										}

									})
						})

		$('#srch-term').on('keyup', function() {

		})

	})

	window.onload = function() {
		var iframe;
		iframe = "<iframe src='http://localhost:8888/NS/'></iframe>";
		$('#test2').html(iframe);
	}
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
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
								class="navbar-brand logo">N</a>
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

					<!-- single 페이지일 경우 프로필 등의 탭은 아래의 div에 뿌림  -->
					<div id="singlePage"></div>
					<!-- 아래 div에 iframe (슬라이드)-->
					<div id="iframe">
						멤버번호 : ${sessionScope.memberNum}
						<form>
							<input id="textMessage" type="text"> <input
								onclick="sendMessage()" value="Send" type="button">
						</form>

						<div id="test2"></div>
						<input type="button" id="btnComment">
					</div>
				</div>
				<!-- /main -->

			</div>
		</div>
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
					<h2>로그인이름 : ${Name} 아이디 : ${id}</h2>
				</div>
				<div class="modal-body">
					<form class="form center-block" action="upload.ns"
						enctype="multipart/form-data" method="post">
						<div class="form-group">
							<textarea class="form-control input-lg" autofocus=""
								placeholder="What do you want to share?" name="text"></textarea>
						</div>
						<div>
							<img id="blah" src="#" alt="your image" width="50" height="50" />
						</div>
				</div>
				<div class="modal-footer">
					<div>
						<ul class="pull-left list-inline">
							<li>
								<!--해당버튼 그림으로 대체하기 --> <input type='file' id="imgInp"
								name="photo" /> <!-- <a href="#" --> <!-- onclick="window.open('fileUpload.ns','사진올리기','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">사진</a> -->
								<input type="hidden" value="${sessionScope.memberNum}"
								name="memberNum"> <input type="hidden" value="${Name}"
								name="name"> <input type="submit" value="작성">
							</li>
						</ul>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>


	<!-- sidebar 접속한친구리스트 이 div 내부에 <a href="#">친구1</a> 형태로 뿌리면 됨-->
	<div id="mySidenav" class="sidenav">
		<a href="#">친구1</a> <a href="#">친구2</a> <a href="#">친구3</a> <a
			href="#">친구4</a>
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