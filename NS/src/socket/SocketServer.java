package socket;

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
		
		System.out.println(session.getId() + ":::" + msg);
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
