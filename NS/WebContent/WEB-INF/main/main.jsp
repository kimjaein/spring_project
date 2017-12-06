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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript">
	var flag = true;

	function openNav() {
		if (flag) {
			webSocket.send("list");
			document.getElementById("mySidenav").style.width = "200px";
			flag = false;
		} else {
			document.getElementById("mySidenav").style.width = "0";
			flag = true;
		}
	}
	
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	//WebSocketEx�� ������Ʈ �̸�
	//websocket Ŭ���� �̸�
	var webSocket = new WebSocket("ws://localhost:8888/NS/ws");
	//�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
	webSocket.onopen = function(message) {
		webSocket.send(${sessionScope.memberNum});
	};
	
	//�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
	webSocket.onclose = function(message) {
	};
	
	function sendMessage(Msg) {
		var message = document.getElementById("textMessage");
// 		var message = Msg;
// 		webSocket.send(message);
		webSocket.send(message.value);
		message.value = "";
	}
	
	webSocket.onmessage = function(message){
		if(message.data == 'alarm'){
			alert("��û�� �Խ��ϴ�.");
		}else{
			var onlineFriendList = "";
			var jsonData = JSON.parse(message.data);
			if(jsonData.length != 0){
				for(i = 0; i<jsonData.length; i++){
					onlineFriendList += "<a href='#'>"+ jsonData[i] +"</a>";
				}
			}else{
				onlineFriendList += "<a href='#'>������ ģ���� �����ϴ�.</a>"
			}
			$('#mySidenav').html(onlineFriendList);
		}
	};
	
	//������ ����
	webSocket.close = function(message) {

	};
	var imgflag=2;
	
	function home(){
		var iframe = "<iframe src='single.ns' width='100%' height='800px' id='innerFrame'></iframe>";
		$('#articlePage').html(iframe);
	}
	
	$(function() {
		home();
		
		$(document).on('click','#btnComment',function() {
			$.ajax({
				type : 'post',
				url : 'iframetest.ns',
				data : '',
				dataType : 'text',
				success : function(resultData) {
					var iframe;
					iframe = "<iframe src=''></iframe>";
					$('#mainPage').html(iframe);
				},
				error : function() {
					alert('ajax ��û ����');
				}

			})
		})

		$('#srchterm').on('keyup', function() {
			var flagFriend = $(this).val();
			if(flagFriend == ""){
				document.getElementById("friend").style.display="none";
			}else{
				$.ajax({
					type:'post',
					url: 'searchfriend.ns',
					data:'search='+flagFriend,
					dataType:'json',
					success:function(resultData){
						if(resultData == ""){
							document.getElementById("friend").style.display="none";
						}else{
							var searchFriendList = "";
							$.each(resultData, function(index, item){
							searchFriendList += "<li id='searchUser' value="+item['memberNum'] +">" + item['name']+ "</li><br>";
								$('#friend-under').html(searchFriendList);
							})
							document.getElementById("friend").style.display="block";
						}
					},
					error:function(){
						alert('ajax ��û ����');
					}
				})
			}
		})

		$(document).on('mousedown', '#searchUser', function() {
			var searchUserNum = $(this).val();
			var iframe;
			iframe = "<iframe src='userPage.ns?memberNum=" + searchUserNum + "'width='100%' height='830px'></iframe>";
			$('#articlePage').html(iframe);
			document.getElementById("friend").style.display="none";			
			return false;
		})
		
		$(document).on('focusin','#srchterm', function() {
			var flagFriend = $(this).val();
			
			if(flagFriend == ""){
				document.getElementById("friend").style.display="none";
			}else{
				$.ajax({
					type:'post',
					url: 'searchfriend.ns',
					data:'search='+flagFriend,
					dataType:'json',
					success:function(resultData){
						if(resultData == ""){
							document.getElementById("friend").style.display="none";
						}else{
							var searchFriendList = "";
							$.each(resultData, function(index, item){
							searchFriendList += "<li id='searchUser' value="+item['memberNum'] +">" + item['name']+ "</li><br>";
								$('#friend-under').html(searchFriendList);
							})
							document.getElementById("friend").style.display="block";
						}
					},
					error:function(){
						alert('ajax ��û ����');
					}
				})
			}
		})
		
		$(document).on('focusout','#srchterm', function() {
			document.getElementById("friend").style.display = "none";
		})
		
		$('#badgeBtn').on('click', function() {
			$.ajax({
				type:'post',
				url: 'badgeList.ns',
				data:'memberNum='+${sessionScope.memberNum},
				dataType:'json',
				success:function(resultData){
					var badgeList = "";
					
					if(resultData == ""){
						badgeList += "<li><a>�˸� ������ �����ϴ�.</a></li>";
					}else{
						$.each(resultData, function(index, item){
							badgeList += "<li><a>"+item['to_member_num']+"���� ģ����û�Ͽ����ϴ�.</a></li>";
						})
					}
						$('#badge').html(badgeList);
				},
				error:function(){
					alert('ajax ��û ����');
				}
			})
		})		
		
		
		$('#add').click(function() {
			$('.imgInp:nth-child(' + imgflag + ')').click();
			$('.imgInp:nth-child(' + imgflag + ')').on('change', function() {
				readURL(this)
			})
		})
		
		function readURL(input) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var st = $("#imgBox").html();
					st += "<img id='blah' name='' src="+e.target.result+" alt='your image' width='50' height='50' />"
					$('#imgBox').html(st);
				}
				reader.readAsDataURL(input.files[0]);
				imgflag = imgflag + 1;
		}
		
		
	})
	function innerFrame(member_num){
			iframe = "<iframe src='userPage.ns?memberNum=" + member_num + "'width='100%' height='830px'></iframe>";
			$('#articlePage').html(iframe);
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
										id="srchterm" type="text" autocomplete="off">
									<div class="dropdownsearch-content" id="friend">
										<ul id="friend-under">
										</ul>
									</div>
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
							<ul class="nav navbar-nav">
								<li><a onclick="home()"><i class="glyphicon glyphicon-home"></i>
										Home</a></li>
								<li><a href="#postModal" role="button" data-toggle="modal"><i
										class="glyphicon glyphicon-plus"></i> Post</a></li>
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span id="badgeBtn"><i class="material-icons">notifications_active</i></span></a>
								<ul class="dropdown-menu" id="badge">
								</ul>
							  </li>
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span  id="badgeBtn"><i class="fa fa-cog" style="font-size:24px"></i></span></a>
								<ul class="dropdown-menu" id="badge">
								  <li><a href="">����������</a></li>
								  <li><a href="/NS/">�α׾ƿ�</a></li>
								</ul>
							  </li>
							  </ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									onclick="openNav()"> <i class="material-icons" style="font-size:28px">people</i></a>
								</li>
							</ul>
						</nav>
					</div>
					<!-- /top nav -->

					<!-- single �������� ��� ������ ���� ���� �Ʒ��� div�� �Ѹ�  -->
					<div id="singlePage"></div>
					<!-- �Ʒ� div�� iframe (�����̵�)-->
					<div id="iframe">
					<div id="articlePage"></div>
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
					<h2>�α����̸� : ${Name} ���̵� : ${id}</h2>
				</div>
				<form class="form center-block" action="upload.ns"
					enctype="multipart/form-data" method="post">
					<div class="modal-body">
						<div class="form-group">
							<textarea class="form-control input-lg" autofocus=""
								placeholder="What do you want to share?" name="text"></textarea>
						</div>
						<div id="imgBox"></div>
					</div>
					<div class="modal-footer">
						<div>
							<ul class="pull-left list-inline">
								<li><i class="fa fa-upload" id="add"></i> <!--�ش��ư �׸����� ��ü�ϱ� -->
									<input type='file' class='imgInp' name='photo' style='display:none'/>
									<input type='file' class='imgInp' name='photo' style='display:none'/>
									<input type='file' class='imgInp' name='photo' style='display:none'/>
									<input type='file' class='imgInp' name='photo' style='display:none'/>
									<input type='file' class='imgInp' name='photo' style='display:none'/>
									�ִ�5��
									<input type="hidden"
									value="${sessionScope.memberNum}" name="memberNum" id="before">
									<input type="hidden" value="${Name}" name="name"> <input
									type="submit" value="�ۼ�"></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- �׽�Ʈ�� -->
	
	<!-- sidebar ������ģ������Ʈ �� div ���ο� <a href="#">ģ��1</a> ���·� �Ѹ��� ��-->
	<div id="mySidenav" class="sidenav">
<!-- 		<a href="#">ģ��1</a> -->
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
	
	
	<div class="modal" id="testModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<h1> modal test </h1>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>