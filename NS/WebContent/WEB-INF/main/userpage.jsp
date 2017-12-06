<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
<link href="assets/css/myNew.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var iframe = "<iframe src='single.ns' width='100%' height='600px'></iframe>";
		$('#articlePage').html(iframe);
		
		friendStatus();
		
		function friendStatus (){
			$.ajax({
				type : 'post',
				url : 'friendCheck.ns',
				data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
				dataType : 'text',
				success : function(resultData) {
					var friendStatus = "";
					if(resultData == 'friendDelete'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>ģ������</button>";
					}else if(resultData == 'friendRequest'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>��û��</button>";
					}else if(resultData == 'friendInsert'){
						friendStatus += "<button id='friendBtn' value='"+resultData+"'>ģ���߰�</button>";
					}
					$('#friendDiv').html(friendStatus);
				},
				error : function() {
					alert('ajax ��û ����');
				}		
			})	
		}
		
		$(document).on('click','#friendBtn',function(){
			var friendVal = $(this).val();
			
			if(friendVal == 'friendInsert'){
				$.ajax({
					type : 'post',
					url : 'friendInsert.ns',
					data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
					dataType : 'text',
					success : function(resultData) {
						if(resultData == 1){
							friendStatus ();
							parent.sendMessage(${searchUserNum});
						}
					},
					error : function() {
						alert('ajax ��û ����');
					}		
				})
			}else if(friendVal == 'friendDelete'){
				$.ajax({
					type : 'post',
					url : 'friendDelete.ns',
					data : 'one_member_num=' + ${sessionScope.memberNum} + '&other_member_num=' + ${searchUserNum},
					dataType : 'text',
					success : function(resultData) {
						alert(resultData);
						friendStatus ();
					},
					error : function() {
						alert('ajax ��û ����');
					}		
				})
			}else if(friendVal == 'friendRequest'){
				alert("��û���Դϴ�. �̰� �ʿ��Ѱ�? �ٸ� �����ž���?");
			}
		})
		
	})

</script>
</head>
<body>
                <header id="header">

  <div class="slider">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Wrapper for slides -->
  <div class="carousel-inner" >
    <div class="item active">
      <img src="assets/img/bg_5.jpg">
    </div>
  </div>

  <!-- Controls -->
 
</div>
                	</div><!--slider-->
                	<nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">

                          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNav">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                          </button>
                          <a class="navbar-brand2" href="#"><img class="img-responsive" src="http://rolyart.ro/wp-content/uploads/2016/07/roland-maruntelu-freelancer-romania.jpg"></a>
                          <span class="site-name"><b>Roland</b> Maruntelu</span>
                          <button>ģ���߰�</button>
                        </div>
                    
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="mainNav" >
                          <ul class="nav main-menu navbar-nav">
                            <li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                          </ul>
                          
                           <ul class="nav  navbar-nav navbar-right">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                          </ul>
                        </div><!-- /.navbar-collapse -->
					</nav>
                    
                </header><!--/#HEADER-->
                <div id="articlePage"></div>
</body>
</html>