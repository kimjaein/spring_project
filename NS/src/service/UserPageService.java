package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.UserPageDao;
import vo.AlarmVO;
import vo.ArticlePhotoVO;
import vo.FriendVO;
import vo.MemberVO;

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
	
	public int userPhotoUpdate(MemberVO member) {
		return dao.userPhotoUpdate(member);
	}
	
	public String userPhotoSelect(MemberVO member) {
		return dao.userPhotoSelect(member);
	}

	public List<MemberVO> selectFriendList(int memberNum) {
		return dao.selectFriendList(memberNum);
	}
	
	public List<ArticlePhotoVO> photoGallery(int membernum) {
		return dao.photoGallery(membernum);
	}
}
