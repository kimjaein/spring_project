package repository.mapper;

import vo.AlarmVO;
import vo.FriendVO;

public interface UserPageMapper {
	public int friendCheck(FriendVO friend);
	public int alarmCheck(AlarmVO alarm);
}
