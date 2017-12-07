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

</head>
<script type="text/javascript">
	window.onload = function(){
		session.invalidate();
	}
</script>

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
							<ul class="nav navbar-nav navbar-right">
								<form action="login.ns" method="post">
									<table id="login">
										<tr>
											<td>이메일</td>
											<td><input type="text" name="id" placeholder="이메일 입력">
											</td>
											<td>비밀번호</td>
											<td><input type="text" name="pw" placeholder="이메일 입력">
											</td>
											<td><input type="submit" value="로그인"></td>
										</tr>
									</table>
								</form>
							</ul>
						</nav>
					</div>
					<!-- /top nav -->
					<div id="join">
						<div class="column col-sm-6 col-xs-6">
							
						</div>
						<form action="join.ns" method="post"
							class="column col-sm-6 col-xs-6">
						<div id="login-box">
								<div class="right">
									<h1>Sign up</h1>

									<input type="text" name="id" placeholder="E-mail" class="signUpText"/> <input
										type="text" name="name" placeholder="Username" class="signUpText"/> <input
										type="password" name="pw" placeholder="Password" class="signUpText"/> <input
										type="password" name="pwsub" placeholder="Retype password" class="signUpText"/>
									<input type="text" name="birth"
										placeholder="birth (ex.19920722)" class="signUpText"> <input type="radio"
										name="gender" class="gender" value="1" checked="checked">남 <input type="radio" name="gender" class="gender" value="2">여
									<input type="text" name="address" placeholder="address"class="signUpText">

									<input type="submit" name="signup_submit" value="Sign me up" id="signUp"/>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /main -->

			</div>
	<a href="single.ns">wodls</a><br> 
	<a href="testMain.ns">wodls2</a> 
		</div>
	</div>

	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>

</body>
</html>