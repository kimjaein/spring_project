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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	//WebSocketEx�� ������Ʈ �̸�
	//websocket Ŭ���� �̸�
	var webSocket = new WebSocket("ws://localhost:8888/NS/ws");
	//�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
	webSocket.onopen = function(message) {

	};
	//�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
	webSocket.onclose = function(message) {
	};

	function sendMessage() {
		var message = document.getElementById("textMessage");
		webSocket.send(message.value);
		message.value = "";
	}

	//������ ����
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
											alert('ajax ��û ����');
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

					<!-- single �������� ��� ������ ���� ���� �Ʒ��� div�� �Ѹ�  -->
					<div id="singlePage"></div>
					<!-- �Ʒ� div�� iframe (�����̵�)-->
					<div id="iframe">
						���̵� : ${sessionScope.loginId}<br> �����ȣ :
						${sessionScope.memberNum}
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
	<!-- �� �ۼ� form -->
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


	<!-- sidebar ������ģ������Ʈ �� div ���ο� <a href="#">ģ��1</a> ���·� �Ѹ��� ��-->
	<div id="mySidenav" class="sidenav">
		<a href="#">ģ��1</a> <a href="#">ģ��2</a> <a href="#">ģ��3</a> <a
			href="#">ģ��4</a>
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