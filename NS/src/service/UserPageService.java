package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.UserPageDao;
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
}
