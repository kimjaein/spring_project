package socket;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonWriter;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import service.SocketService;
import vo.MemberVO;

@ServerEndpoint(value="/ws")
public class SocketServer {
	public SocketServer() {
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
		System.out.println("socket server 持失切");
	}
	
	@Autowired
	private SocketService service;

	public void setService(SocketService service) {
		System.out.println("set service");
		this.service = service;
	}
	
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
		}else if(msg.equals("list")) {
			int getMemberNum = Integer.parseInt((String) session.getUserProperties().get("memberNum"));
			int memberCount = 0;
			List<String> onlineMemberList = new ArrayList<>();
			List<MemberVO> MemberList = service.friendNameList(getMemberNum);
			System.out.println("select 衣引 " + MemberList);
			for(Session ss : clients) {
				for(MemberVO m : MemberList) {
					if(m.getMemberNum() == Integer.parseInt((String) ss.getUserProperties().get("memberNum"))) {
						onlineMemberList.add(memberCount, m.getName());
						memberCount++;
					}
				}
			}
			try {
				session.getBasicRemote().sendText(buildJsonData(onlineMemberList));
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
	
	public String buildJsonData(List<String> friendList){
		int listCount = 0;
//		String listData = "";
//		for(String sub :  friendList) {
//			listData += friendList.get(listCount);
//			listCount++;
//		}
//		JsonObject jsonObject = Json.createObjectBuilder().add("friendList", friendList.toString()).add("listCount", listCount).build();
		JsonObjectBuilder jsonObject = Json.createObjectBuilder();
		
		for(String sub :  friendList) {
			sub = friendList.get(listCount);
			jsonObject.add("friendList"+listCount, sub);
			listCount++;
		}
		jsonObject.add("listCount", listCount);
		JsonObject totalJson = jsonObject.build();
		
		StringWriter stringwriter =  new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringwriter)){
                jsonWriter.write(totalJson);
        };
        return stringwriter.toString();
    }
}
