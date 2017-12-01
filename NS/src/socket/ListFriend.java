package socket;

import java.util.ArrayList;
import java.util.List;

public class ListFriend {
	List<String> friend = new ArrayList<>();

	public String getFriend() {
		return this.friend.toString();
	}

	public void setFriend(List<String> friend) {
		this.friend = friend;
	}

	public void setListFriend(String friend) {
		this.friend.add(friend);
	}
}
