<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Facebook Theme Demo</title>

<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
	#next, #btn{
	position: fixed;
	}
	</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btn').click(function(){
			alert(document.body.scrollWidth)
		})
		$('#next').click(function(){
			next()
			})
	})
	function horizontalScroll() {
		if (event.wheelDelta <= -120)
			window.scrollBy(20, 0);
		else if (event.wheelDelta >= 120)
			window.scrollBy(-20, 0);
	}
	$(document).scroll(function () {
	     var st = $(this).scrollLeft();
	     var size2= $(document).width() - $(window).width()
	     $('#btn').text(size)
	     if(st == size2){
	    	 
	    	 next();
	     }
	    
	 })
	var count=1;

		
		function next() {
			var article =$('#here').html()
			article +="<td> <div class='row' ><div class='article'>"
			           +"<div class='panel panel-default'><div class='panel-thumbnail'>"
						+"<img src='assets/img/bg_5.jpg' class='img-responsive'>"
					+"</div>"
						+"<div class='panel-body'>"
						+"<p class='name'>"
							+"<img src='assets/img/uFp_tsTJboUY7kue5XAsGAs28.png'"
								+"height='20px' width='20px'>test"+count
						+"</p>"
						+"<p>내용내용내용.....(길이 제한 필요)</p>"
						+"<p>"
						+"	<i class='fa fa-heart-o'></i> like, <i"
						+"		class='fa fa-commenting-o'></i> Comment"
						+"</p></div>	</div></div></div></td>"
						
			$('#here').html(article)
			count=count+1;
		}
	
	
</script>

</head>
<body>
	<div class="padding">
		<button id="btn"></button>
		<div class="full" onmousewheel="horizontalScroll()">
		<table>
		<tr id="here">		
		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>
					<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>		<td>
			<div class="row" >
				<div class="article">
					<div class="panel panel-default">
						<div class="panel-thumbnail">
							<img src="assets/img/bg_5.jpg" class="img-responsive">
						</div>
						<div class="panel-body">
							<p class="name">
								<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
									height="20px" width="20px">Urbanization
							</p>
							<p>내용내용내용.....(길이 제한 필요)</p>
							<p>
								<i class="fa fa-heart-o"></i> like, <i
									class="fa fa-commenting-o"></i> Comment
							</p>
						</div>
					</div>
				</div>
			</div>
			</td>
			</tr>
			</table>
		<button id="next">다음</button>
		</div>

	</div>
</body>
</html>
