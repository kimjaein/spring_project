package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.SocketDao;
import vo.MemberVO;

@Component
public class SocketService {
	public SocketService() {
//		System.out.println("socket service »ý¼ºÀÚ");
	}
	
	@Autowired
    private SocketDao dao;
    public void setDao(SocketDao dao) {
        this.dao = dao;
    }
    
    public List<MemberVO> friendNameList(int memberNum) {
		return dao.friendNameList(memberNum);
	}
}
