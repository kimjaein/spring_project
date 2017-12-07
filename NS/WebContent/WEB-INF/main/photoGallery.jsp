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
#commentModal {
	margin: 100px;
}
</style>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>

<script type="text/javascript">
$(function(){
	$('#btn').click(function() {
		alert(document.body.scrollWidth)
	})
	$('#next').click(function() {
		next()
	})
	$('#test').click(function() {
		var st = "<input type=text class='test'>";
	})
	$('.img').click(function() {
			var st = $(this).find("input").attr('value');
			$(".comment").val(st);
			var id = $("#loginId").val();
			$(".commentId").val(id);
			commentModal(st)
		return false;
	})
	//이부분은 좋아요영역 작업현황 = 불변경만 가능(새로고침시 리셋)

	$(".like").click(function() {
		if ($(this).find('i').attr('class') == "fa fa-heart-o") {
			//update likecount++
			var article_num = $(this).find('input').attr('value')
			increaseLikeCount(article_num,$(this));
		} else {
			//update likecount--
			var article_num = $(this).find('input').attr('value')
			var likecount=decreaseLikeCount(article_num,$(this));
		}
	})
	
		$('.name').click(function(){
			var member_num = $(this).find('input').attr('value')
			parent.innerFrame(member_num);
		})
	
})

	function increaseLikeCount(article_num,here){
		$.ajax({
			type : 'get',
			url : 'updateLikeCount.ns?article_num='+article_num+"&task=increase",
			dataType : 'json',
			success : function(data) {
				here.find('span').text(data);
				here.find('i').removeClass("fa fa-heart-o").addClass("fa fa-heart");
			},
			error : function() {
			}
		})
	}
	function decreaseLikeCount(article_num,here){
		$.ajax({
			type : 'get',
			url : 'updateLikeCount.ns?article_num=' + article_num+"&task=decrease",
			dataType : 'json',
			success : function(data) {
				
					here.find('span').text(data);
					here.find('i').removeClass("fa fa-heart").addClass("fa fa-heart-o");
			},
			error : function() {
			}
		})
	}
	function commentModal(st) {
		$.ajax({
					type : 'get',
					url : 'articleViewPhoto.ns?article_num=' + st,
					dataType : 'json',
					success : function(data) {
						var photoData = [];
						var count = 0;
						var imgCount = '';
						for (i in data) {
							photoData[count] = '<img id="photoSize" Class="mySlides" src="'
									+ data[i] + '"style="width:100%">';
							//1번째tr안에 0번째td에 html적용
							count++;
						}
						if (count > 1) {
							for (i = 0; i < count; i++) {
								imgCount += photoData[i];
							}
							imgSlide = '<div class="w3-content w3-display-container">';
							imgSlide += imgCount;
							imgSlide += '<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>'
							imgSlide += '<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button></div>'
							//	                   $('#commentModal tr').eq(1).find('td').eq(0).html(photoData);
							$('#commentModal tr').eq(1).find('td').eq(0).html(
									imgSlide);
							plusDivs(-1)
						} else if (count == 1) {
							photoData[0] = '';
							photoData[0] = '<img id="photoSize" Class="mySlides" src="'+data[i]+'" width="400" height="300">';
							$('#commentModal tr').eq(1).find('td').eq(0).html(photoData);
						} else {
							var img = '<h2>첨부사진 없음</h2>';
							$('#commentModal tr').eq(1).find('td').eq(0).html(img);
						}
					},
					error : function() {
						alert("articleViewPhoto에러")
					}
				})

		$.ajax({
               type : 'get',
               url : 'articleViewContents.ns?article_num=' + st,
               dataType : 'json',
               success : function(data) {
                  var contentsData = '';
                  contentsData = data['contents'];
                  var writer = '';
                  writer = data['writer'];
                  var like_count = '';
                  $('.like').find('span').text(data['like_count'])
                  $('#commentModal tr').eq(2).find('td').eq(0).html(
                        contentsData);
                  $('#commentModal tr').eq(1).find('td').eq(1).html(
                        writer);
               },
               error : function() {
                  alert("articleViewContents 에러")
               }
            })

		$.ajax({
					type : 'get',
					url : 'articleComment.ns?article_num=' + st,
					dataType : 'json',
					success : function(data) {
						var writer = '';
						var comment = '';
						var write_date = '';
						$.each(data,function(index, item) {
											comment += '<tr>';
											comment += '<div id="Layer1" style="position:absolute; left:35px; top:200x; width:435px; height:150px; z-index:0; overflow-x:hidden; overflow-y:auto;">';
											comment += '<td>' + item['writer']
													+ '</td>';
											comment += '<td valign="top" style="word-break:break-all">'
													+ item['content'] + '</td>';
											comment += '<td>'
													+ item['write_date']
													+ '</td>';
											comment += '</div>'
											comment += '</tr>';
											//작성자 작성내용 작성시간
											$('#commentTable').html(comment);
										})
						console.log(data)

					},
					error : function() {
						alert("articleComment 에러")
					}
				})

		$("#commentModal").modal('show');
	}
	function horizontalScroll() {
		if (event.wheelDelta <= -120)
			window.scrollBy(40, 0);
		else if (event.wheelDelta >= 120)
			window.scrollBy(-40, 0);
	}

	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("mySlides");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		x[slideIndex - 1].style.display = "block";
	}
	
	function commentAdd() {
		var article_num = $('.comment').val();
		var comment = $("#commentText").val();
		var commentId = $(".commentId").val();
		$.ajax({
					type : 'post',
					url : 'articleViewComment.ns',
					data : {
						comment : comment,
						article_num : article_num,
						commentId : commentId
					},
					dataType : 'json',
					success : function(data) {
						console.log(data)
						var comment = '';
						$.each(data,function(index, item) {
									comment += '<tr>';
									comment += '<div id="Layer1" style="position:absolute; left:35px; top:200x; width:435px; height:150px; z-index:0; overflow-x:hidden; overflow-y:auto;">';
									comment += '<td>' + item['writer']
											+ '</td>';
									comment += '<td valign="top" style="word-break:break-all">'
											+ item['content'] + '</td>';
									comment += '<td>'
											+ item['write_date']
											+ '</td>';
									comment += '</div>'
									comment += '</tr>';
											//작성자 작성내용 작성시간
									$('#commentTable').html(comment);
									$("#commentText").val("");
						})
					},
					error : function() {
						alert("댓글내용을 입력해주세요")
					}
				})
		$("#commentModal").modal('show');
	}
</script>

</head>
<body>
<!-- 상세보기 modal -->
	<table id="commentModal" border="1" class="modal fade" tabindex="-1"
		role="dialog" aria-hidden="true" style="table-layout: fixed">
		<tr class="comment-content">
			<td colspan="3"></td>
			<td><button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">Close</button></td>
		</tr>
		<tr class="comment-content">
			<td height="200" width="500" rowspan="4">
				<!-- 사진공간 -->
			</td>
			<td colspan="3" height="20">
				<!-- 작성자공간 -->
			</td>
		</tr>
		<tr class="comment-content">
			<td height="300" colspan="3" id="content" width="400">
				<!-- 내용공간 -->
			</td>
		</tr>
		<tr class="comment-content">
			<td colspan="3" height="60">
				<div style="width: 100%; height: 100px; overflow: auto">
<!-- 				댓글영역 -->
					<table id="commentTable" border="1" width="100%" cellspacing="0"
						cellpadding="0" style="table-layout: fixed">
					</table>
				</div>
			</td>
		</tr>
		<tr class="comment-content">
			<td height="20"><div class="like"><input type="hidden" value="${article.article_num}"><i id="like_i" class='fa fa-heart-o'></i><span></span></div></td>
			<td height="40"><textarea rows="2" cols="40" id="commentText"></textarea></td>
			<td rowspan="2" height="20">&nbsp;
				<button class="comment" onclick="commentAdd()"
					value="${article.article_num}">작성</button> <input type="hidden"
				class="commentId" value="">
			</td>

		</tr>
	</table>
	<c:forEach var="photo" items="${photoList}">
         <c:choose>
            <c:when test="${empty photo.filePath}">
            </c:when>
            <c:when test="${not empty photo.filePath}">
         <div class="img">
               <img class="GalleryPhoto" src="${photo.filePath}"> <input type="hidden"value="${photo.article_num}">
         </div>
            </c:when>   
         </c:choose>
      </c:forEach>
   <input type="hidden" id="loginId" value="${sessionScope.id}"> 
</body>
</html>
