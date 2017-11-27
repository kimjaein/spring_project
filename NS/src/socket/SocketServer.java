package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ws")
public class SocketServer {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void Open(Session session) {
		System.out.println("New client @"+session.getId());
		clients.add(session);
	}
	
	@OnMessage
	public void Message(Session session, String msg) {
		String memberNum = (String)session.getUserProperties().get("memberNum");
		if(memberNum == null) {
			session.getUserProperties().put("memberNum", msg);
			try {
				session.getBasicRemote().sendText("memberNum OKOKOK");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
		System.out.println(session.getUserProperties().get("memberNum") + ":::" + msg);
			try {
				for(Session s : clients) {
					if(s.getUserProperties().get("memberNum").equals(msg)) {
						s.getBasicRemote().sendText("alarm");
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnError
	public void Error(Throwable t) {
		t.printStackTrace();
	}
	
	@OnClose
	public void Close(Session session) {
		System.out.println("Client disconnected @" + session.getId());
		clients.remove(session);
	}
}
