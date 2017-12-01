package socket;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import javax.json.Json;

public class ListFriendEncoder implements Encoder.Text<ListFriend>{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(ListFriend arg0) throws EncodeException {
		return Json.createObjectBuilder().add("friend", arg0.getFriend()).build().toString();
	}

}
