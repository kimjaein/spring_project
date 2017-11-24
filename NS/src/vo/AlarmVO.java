package vo;

public class AlarmVO {
	private int to_member_num;
	private int from_member_num;
	private int type;
	
	public AlarmVO() {
		
	}
	
	public AlarmVO(int to_member_num, int from_member_num, int type) {
		this.to_member_num = to_member_num;
		this.from_member_num = from_member_num;
		this.type = type;
	}

	public int getTo_member_num() {
		return to_member_num;
	}

	public void setTo_member_num(int to_member_num) {
		this.to_member_num = to_member_num;
	}

	public int getFrom_member_num() {
		return from_member_num;
	}

	public void setFrom_member_num(int from_member_num) {
		this.from_member_num = from_member_num;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "AlarmVO [to_member_num=" + to_member_num + ", from_member_num=" + from_member_num + ", type=" + type
				+ "]";
	}
	
}
