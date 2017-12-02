<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Facebook Theme Demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
			$(".comment").val(st);
			var id = $("#loginId").val();
			alert(id);
			$(".commentId").val(id);
			commentModal(st)
			return false;
		})
		//�̺κ��� ���ƿ俵�� �۾���Ȳ = �Һ��游 ����(���ΰ�ħ�� ����)
		$(".likeChange").click(function(){
			if(count!=1){
				$("#like_i").removeClass("fa fa-heart-o").addClass("fa fa-heart")
				count=1;
			}else{
				$("#like_i").removeClass("fa fa-heart").addClass("fa fa-heart-o")
				count=-1;
			}
				
			
			
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
				+ "<p>���볻�볻��.....(���� ���� �ʿ�)</p>"
				+ "<p>"
				+ "	<i class='fa fa-heart-o'></i> like, <i"
						+"		class='fa fa-commenting-o'></i> Comment"
				+ "</p></div>	</div></div></div></td>"

		$('#here').html(article)
		count = count + 1;
	}
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}

	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	function commentModal(st){
		$.ajax({
			type : 'get',
			url : 'articleViewPhoto.ns?article_num='+st,
			dataType : 'json',
			success : function(data) {
				var photoData=[];
				var count = 0;
				var imgSlide = '';
				var imgCount = '';
				for(i in data){
				photoData[count] = '<img Class="mySlides" src="'+data[i]+'"style="width:100%">';
				//1��°tr�ȿ� 0��°td�� html����
				count++;
				}
					if(count>1){
						for(i=0; i<count; i++){
							imgCount += photoData[i];
						}
						alert("�׸�2���̻�")
						imgSlide = '<div class="w3-content w3-display-container">';
						imgSlide += imgCount;
						imgSlide += '<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>'
						imgSlide += '<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button></div>'
// 						$('#commentModal tr').eq(1).find('td').eq(0).html(photoData);
						$('#commentModal tr').eq(1).find('td').eq(0).html(imgSlide);
					}else if(count==1){
						alert("�׸��� 1��")
						photoData[0] = '';
						photoData[0] = '<img Class="mySlides" src="'+data[i]+'" width="400" height="300">';
						$('#commentModal tr').eq(1).find('td').eq(0).html(photoData);
					}else{
						var img = '<h2>÷�λ��� ����</h2>';
						$('#commentModal tr').eq(1).find('td').eq(0).html(img);
					}
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
		
		$.ajax({
			type : 'get',
			url : 'articleComment.ns?article_num='+st,
			dataType : 'json',
			success : function(data) {
				var commentData ='';
				var writer = '';
				var comment = '';
				var write_date = '';
				$.each(data,function(index,item){
					writer += item['writer']+"<br>";
					comment += item['content']+"<br>";
					write_date += item['write_date']+"<br>";
					//�ۼ��� �ۼ����� �ۼ��ð�
					$('#commentModal tr').eq(3).find('td').eq(0).html(writer);
					$('#commentModal tr').eq(3).find('td').eq(1).html(comment);
					$('#commentModal tr').eq(3).find('td').eq(2).html(write_date);
				})
				console.log(data)

			},
			error : function() {
				alert("fail2")
			}
		})
		
		$("#commentModal").modal('show');
	}
	function commentAdd(){
		var article_num = $('.comment').val();
		var comment = $("#commentText").val();
		var commentId = $(".commentId").val();
		alert(commentId)
		$.ajax({
			type : 'post',
			url : 'articleViewComment.ns',
			data : {comment:comment,article_num:article_num,commentId:commentId},
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
		<td colspan="3">Ʋ</td>
		<td><button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button></td>
	</tr>
	<tr class="comment-content">
		<td height="300" width="400" rowspan="4"><!-- �������� --></td>
		<td colspan="3"><!-- �ۼ��ڰ��� --></td>
	</tr>
	<tr class="comment-content">
		<td height="150" colspan="3" id="content"><!-- ������� --></td>
	</tr>
	<tr class="comment-content">
		<td></td>
		<td>	<!-- ��۰��� --></td>
		<td></td>
	</tr>
	<tr class="comment-content"	>
		<td><a href="#" class="likeChange"><i id="like_i" class='fa fa-heart-o'></i>like</a></td>
		<td><textarea rows="2" cols="50" id="commentText"></textarea></td>
		<td rowspan="2">
			<button class="comment" onclick="commentAdd()" value="${article.article_num}">�ۼ�</button>
			<input type="hidden" class="commentId" value="">
		</td>
	
	</tr>
</table>
	<div class="padding">
		<button id="btn"></button>
		<div class="full" onmousewheel="horizontalScroll()">
			<table>
			<tr><td>�����ȣ : ${sessionScope.memberNum}<td></tr>
				<tr id="here">
					<c:forEach var="article" items="${articleList}">
						<td>
							<div class="row">
								<div class="article">
									<div class="panel panel-default">
										<div class="panel-thumbnail">
										<c:forEach var="photo" items="${article.photoList}">
											<img src="${photo.filePath}" class="img-responsive" width="600" height="50">
											</c:forEach>
										</div>
										<div class="panel-body">
											<p class="name">
												<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
													height="20px" width="20px">${article.writer}
											</p>
											<p>${article.contents}�α����� ���̵� : ${sessionScope.id}</p>
											<p>
												<i class="fa fa-heart-o"></i> ${article.like_count}, <i
													class="fa fa-commenting-o"></i> Comment &nbsp;
												<input type="hidden" id="loginId" value="${sessionScope.id}">
												<button class="article_num" value="${article.article_num}">�󼼺���</button>
											</p>
										</div>
									</div>
								</div>
							</div>
						</td>
					</c:forEach>
				</tr>
			</table>
			<button id="next">����</button>
		</div>

	</div>
</body>
</html>
