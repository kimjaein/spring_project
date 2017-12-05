package socket;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class ListFriendDecoder implements Decoder.Text<ListFriend>{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListFriend decode(String arg0) throws DecodeException {
		JsonObject jsonObject = Json.createReader(new StringReader(arg0)).readObject();
		ListFriend friend = new ListFriend();
		friend.setListFriend(jsonObject.getString("friend"));
		return friend;
	}

	@Override
	public boolean willDecode(String arg0) {
		// TODO Auto-generated method stub
		return false;
	}

}
