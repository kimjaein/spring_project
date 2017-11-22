<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
        //WebSocketEx는 프로젝트 이름
        //websocket 클래스 이름
        var webSocket = new WebSocket("ws://localhost:8888/NS/ws");
        //웹 소켓이 연결되었을 때 호출되는 이벤트
        webSocket.onopen = function(message){
            alert("connect");
        };
        //웹 소켓이 닫혔을 때 호출되는 이벤트
        webSocket.onclose = function(message){
        };
        
		function sendMessage(){
			var message = document.getElementById("textMessage");
			webSocket.send(message.value);
			message.value = "";
		}
        
        //웹소켓 종료
        webSocket.close = function(message){
        	
        };
        
        
    	$(function(){
    		$(document).on('click','#btnComment',function(){
    			$.ajax({
    				type:'post',
    				url:'iframetest.ns', 
    				data:'',
    				dataType:'text',
    				success:function(resultData){
    					alert("1234");
    					var test;
    					test= "<iframe src='http://localhost:8888/NS/'></iframe>";
    					$('#test2').html(test);
    				},
    				error:function(){
    					alert('ajax 요청 실패');
    				}
    				
    			})
    		})
    	})
    </script>
    
    

</head>
<body>
메인임<br>
<%-- 아이디 : ${sessionScope.loginId}<br> --%>
<%-- 멤버번호 :  ${sessionScope.memberNum} --%>
	<form>
		<input id="textMessage" type="text">
		<input onclick="sendMessage()" value="Send" type="button">
	</form>
	
	<iframe src='http://localhost:8888/NS/'>
		
	
	</iframe>
	
	
<!-- 	<form action="iframetest.ns"> -->
<!-- 		<button i>test</button> -->
<!-- 	</form> -->
<div id="test2"></div>
	<input type="button" id="btnComment">
</body>
</html>