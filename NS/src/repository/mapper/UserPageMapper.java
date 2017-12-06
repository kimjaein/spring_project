package repository.mapper;

import java.util.List;

import vo.AlarmVO;
import vo.FriendVO;
import vo.MemberVO;

public interface UserPageMapper {
	public int friendCheck(FriendVO friend);
	public int alarmCheck(AlarmVO alarm);
	public int alarmInsert(AlarmVO alarm);
	public int friendDelete(FriendVO friend);
	public int userPhotoUpdate(MemberVO member);
	public String userPhotoSelect(MemberVO member);
	public List<MemberVO> selectFriendList(int memberNum);
}
