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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">


	$(document).on('click','#friendAccept',function() {
		var accept = $(this).val();
		
		$.ajax({
			type : 'post',
			url : 'friendAccept.ns',
			data : 'from_member_num=' + ${sessionScope.memberNum} + '&to_member_num=' + accept,
			dataType : 'text',
			success : function(resultData) {
				if(resultData == 1){
					location.reload(true);
				}
			},
			error : function() {
				alert('ajax 요청 실패');
			}		
		})	
		
	})
	
	$(document).on('click','#friendRefuse',function() {
		var accept = $(this).val();
		
		$.ajax({
			type : 'post',
			url : 'friendRefuse.ns',
			data : 'from_member_num=' + ${sessionScope.memberNum} + '&to_member_num=' + accept,
			dataType : 'text',
			success : function(resultData) {
				if(resultData == 1){
					location.reload(true);
				}
			},
			error : function() {
				alert('ajax 요청 실패');
			}		
		})	
	})

function horizontalScroll() {
	if (event.wheelDelta <= -120)
		window.scrollBy(40, 0);
	else if (event.wheelDelta >= 120)
		window.scrollBy(-40, 0);
}
</script>
</head>
<body>
<table onmousewheel="horizontalScroll()">
      <tr class="friendList">
         <c:forEach var="friend" items="${friendList}">
            <td class="friend-one">
               <div class="profile-sidebar">
                  <!-- SIDEBAR USERPIC -->
                  <div class="profile-userpic">
                     <c:choose>
                        <c:when test="${friend.photo.length() < 5  }">
                           <img src="assets/img/uFp_tsTJboUY7kue5XAsGAs28.png" class="img-responsive" alt="">
                        </c:when>
                        <c:otherwise>
                           <img src="userPhoto/${friend.photo}" class="img-responsive" alt="">
                        </c:otherwise>
                     </c:choose>

                  </div>
                  <!-- END SIDEBAR USERPIC -->
                  <!-- SIDEBAR USER TITLE -->
                  <div class="profile-usertitle">
                     <div class="name profile-usertitle-name">${friend.name}
                        <input type="hidden" value="${friend.memberNum}">
                     </div>
                     <div class="profile-usertitle-job">${friend.id}</div>
                  </div>
                  <!-- END SIDEBAR USER TITLE -->
                  <!-- SIDEBAR BUTTONS -->
                  <div class="profile-userbuttons">
                     <button type="button" class="btn btn-success btn-sm" id="friendAccept" value="${friend.memberNum}">accept</button>
                     <button type="button" class="btn btn-danger btn-sm" id="friendRefuse" value="${friend.memberNum}">refuse</button>
                  </div>

                  <!-- END SIDEBAR BUTTONS -->
                  <!-- SIDEBAR MENU -->
                  
                  <!-- END MENU -->
               </div>
            </td>
         </c:forEach>
      </tr>
   </table>
</body>
</html>