package vo;

public class FriendVO {
	private int one_member_num;
	private int other_member_num;

	public FriendVO() {
		
	}
	
	public FriendVO(int one_member_num, int other_member_num) {
		this.one_member_num = one_member_num;
		this.other_member_num = other_member_num;
	}

	public int getOne_member_num() {
		return one_member_num;
	}

	public void setOne_member_num(int one_member_num) {
		this.one_member_num = one_member_num;
	}

	public int getOther_member_num() {
		return other_member_num;
	}

	public void setOther_member_num(int other_member_num) {
		this.other_member_num = other_member_num;
	}

	@Override
	public String toString() {
		return "FriendVO [one_member_num=" + one_member_num + ", other_member_num=" + other_member_num + "]";
	}
	
}
