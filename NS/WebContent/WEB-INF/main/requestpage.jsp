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
	<tr class="requestList">
	
	<c:forEach var="request" items="${requestList}">

<div class="request-list">
	<div class="row">
        <div class="span12">
    		<ul class="thumbnails">
                <li class="span5 clearfix">
                  <div class="thumbnail clearfix">
                   	<c:choose>
                   		<c:when test="${request.photo.length() < 5  }">
                    <img src="http://placehold.it/320x200" alt="" class="pull-left span2 clearfix" style='margin-right:10px'>
                   		<c:otherwise >
                   		</c:when>
                   	<img src="" alt="userPhoto/${friend.photo}" class="pull-left span2 clearfix" style='margin-right:10px'>
                   		</c:otherwise>
                   	</c:choose>
                   	
                    <div class="caption" class="pull-left">
                      <a href="http://bootsnipp.com/" class="btn btn-primary icon  pull-right">수락</a>
                    <div class="caption" class="pull-left">
                      <a href="http://bootsnipp.com/" class="btn btn-primary icon  pull-right">거절</a>
                      <h4>      
                      <a href="#" >${friend.name}</a>
                    </div>
                  </div>
                </li>
            </ul>
        </div>
	</div>
</div>
	
	
	</c:forEach>

		</tr>
	</table>
</body>
</html>