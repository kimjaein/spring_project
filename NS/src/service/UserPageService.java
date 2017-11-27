package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.UserPageDao;
import repository.mapper.UserPageMapper;
import vo.AlarmVO;
import vo.FriendVO;

@Component
public class UserPageService {
    @Autowired
    private UserPageDao dao;
    public void setDao(UserPageDao dao) {
        this.dao = dao;
    }
    
	public int friendCheck(FriendVO friend) {
		return dao.friendCheck(friend);
	}
	
	public int alarmCheck(AlarmVO alarm) {
		return dao.alarmCheck(alarm);
	}
	
	public int alarmInsert(AlarmVO alarm) {
		return dao.alarmInsert(alarm);
	}
	
	public int friendDelete(FriendVO friend) {
		return dao.friendDelete(friend);
	}
}
