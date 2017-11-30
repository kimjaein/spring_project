<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#next, #btn {
	position: fixed;
}
#commentModal{
	margin: 100px;
}
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn').click(function() {
			alert(document.body.scrollWidth)
		})
		$('#next').click(function() {
			next()
		})
		$('#test').click(function() {
			var st="<input type=text class='test'>"; 
		})
		$(".article_num").click(function(){
			var st = $(this).attr('value')
			commentModal(st)
			return false;
		})
	})
	function horizontalScroll() {
		if (event.wheelDelta <= -120)
			window.scrollBy(40, 0);
		else if (event.wheelDelta >= 120)
			window.scrollBy(-40, 0);
	}
	$(document).scroll(function() {
		var st = $(this).scrollLeft();
		var size = $(document).width() - $(window).width();
		$('#btn').text(size)
		if (st == size) {
			next();
		}

	})
	var count = 1;
	function next() {
		var article = $('#here').html()
		article += "<td> <div class='row' ><div class='article'>"
				+ "<div class='panel panel-default'><div class='panel-thumbnail'>"
				+ "<img src='assets/img/bg_5.jpg' class='img-responsive'>"
				+ "</div>"
				+ "<div class='panel-body'>"
				+ "<p class='name'>"
				+ "<img src='assets/img/uFp_tsTJboUY7kue5XAsGAs28.png'"
								+"height='20px' width='20px'>test"
				+ count
				+ "</p>"
				+ "<p>내용내용내용.....(길이 제한 필요)</p>"
				+ "<p>"
				+ "	<i class='fa fa-heart-o'></i> like, <i"
						+"		class='fa fa-commenting-o'></i> Comment"
				+ "</p></div>	</div></div></div></td>"

		$('#here').html(article)
		count = count + 1;
	}
	function commentModal(st){
		$.ajax({
			type : 'get',
			url : 'articleViewPhoto.ns?article_num='+st,
			dataType : 'json',
			success : function(data) {
				var photoData='';
				photoData = '<img src="'+data['filePath']+'" width="400" height="300">';
				$('#commentModal tr').eq(1).find('td').eq(0).html(photoData);
				//1번째tr안에 0번째td에 html적용
			},
			error : function() {
				alert("fail")
			}
		})
		
		$.ajax({
			type : 'get',
			url : 'articleViewContents.ns?article_num='+st,
			dataType : 'json',
			success : function(data) {
				var contentsData='';
				contentsData = data['contents'];
				var writer='';
				writer = data['writer'];
// 				alert($('#commentModal tr').eq(1).find('td').eq(0).text(ContentsData));
				$('#commentModal tr').eq(2).find('td').eq(0).html(contentsData);
				$('#commentModal tr').eq(1).find('td').eq(1).html(writer);
			},
			error : function() {
				alert("fail2")
			}
		})
		$("#commentModal").modal('show');
	}
</script>

</head>
<body>
<table id="commentModal" border="1" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<tr class="comment-content"> 
		<td colspan="2">틀</td>
		<td><button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button></td>
	</tr>
	<tr class="comment-content">
		<td height="300" width="400" rowspan="4"><!-- 사진공간 --></td>
		<td colspan="2"><!-- 작성자공간 --></td>
	</tr>
	<tr class="comment-content">
		<td height="150" colspan="2" id="content"><!-- 내용공간 --></td>
	</tr>
	<tr class="comment-content">
		<td colspan="2">댓글공간	<!-- 댓글공간 --></td>
	</tr>
	<tr class="comment-content"	>
		<td><textarea rows="2" cols="50"></textarea></td>
		<td><button>작성</button></td>
	</tr>
</table>
	<div class="padding">
		<button id="btn"></button>
		<div class="full" onmousewheel="horizontalScroll()">
			<table>
			<tr><td>멤버번호 : ${sessionScope.memberNum}<td></tr>
				<tr id="here">
					<c:forEach var="article" items="${articleList}">
						<td>
							<div class="row">
								<div class="article">
									<div class="panel panel-default">
										<div class="panel-thumbnail">
										<c:forEach var="photo" items="${article.photoList}">
											<img src="${photo.filePath}" class="img-responsive">
											</c:forEach>
										</div>
										<div class="panel-body">
											<p class="name">
												<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
													height="20px" width="20px">${article.writer}
											</p>
											<p>${article.contents}</p>
											<p>
												<i class="fa fa-heart-o"></i> ${article.like_count}, <i
													class="fa fa-commenting-o"></i> Comment &nbsp;<button class="article_num" value="${article.article_num}" >상세보기</button>
											</p>
										</div>
									</div>
								</div>
							</div>
						</td>
					</c:forEach>
				</tr>
			</table>
			<button id="next">다음</button>
		</div>

	</div>
</body>
</html>
