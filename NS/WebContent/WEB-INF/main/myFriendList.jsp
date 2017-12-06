<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<script type="text/javascript" src="assets/js/friend.js"></script>

</head>
<body>
	<table>
		<tr class="friendList">
		
		<c:forEach var="friend" items="${friendList}">
		
			<td class="friend-one">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
					<c:choose>
						<c:when test="${friend.photo.length() < 5  }">
						<img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png"
							class="img-responsive" alt="">
						</c:when>
						<c:otherwise>
						<img src="${friend.photo}"
							class="img-responsive" alt="">
						</c:otherwise>
					</c:choose>
						
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${friend.name}</div>
						<div class="profile-usertitle-job">${friend.id}</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->

					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a> <i
									class="glyphicon glyphicon-home"></i> ${friend.gender}
							</a></li>
							<li class="active"><a > <i class="glyphicon glyphicon-user"></i>
									${friend.birth}
							</a></li>
							<li class="active"><a > <i
									class="glyphicon glyphicon-ok"></i> ${friend.address}
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</td>
			
		
		</c:forEach>
		
			
			
		</tr>
	</table>
</body>
</html>