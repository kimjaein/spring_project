<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
        //WebSocketEx�� ������Ʈ �̸�
        //websocket Ŭ���� �̸�
        var webSocket = new WebSocket("ws://localhost:8888/NS/ws");
        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onopen = function(message){
        	
        };
        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onclose = function(message){
        };
        
		function sendMessage(){
			var message = document.getElementById("textMessage");
			webSocket.send(message.value);
			message.value = "";
		}
        
        //������ ����
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
    					var iframe;
    					iframe= "<iframe src='http://localhost:8888/NS/'></iframe>";
    					$('#test2').html(iframe);
    				},
    				error:function(){
    					alert('ajax ��û ����');
    				}
    				
    			})
    		})
    	})
    	
    	window.onload=function(){
    		var iframe;
			iframe= "<iframe src='http://localhost:8888/NS/'></iframe>";
			$('#test2').html(iframe);
    	}
    </script>
    
    

</head>
<body>
���̵� : ${sessionScope.loginId}<br>
�����ȣ :  ${sessionScope.memberNum}
	<form>
		<input id="textMessage" type="text">
		<input onclick="sendMessage()" value="Send" type="button">
	</form>
	
<div id="test2"></div>
	<input type="button" id="btnComment">
</body>
</html>