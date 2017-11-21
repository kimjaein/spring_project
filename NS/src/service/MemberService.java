package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.MemberVO;

@Component
public class MemberService {
    @Autowired
    private MemberDao dao;
    public void setDao(MemberDao dao) {
        this.dao = dao;
    }
    
    public int memberJoin(MemberVO member) {
        if(dao.memberJoin(member) > 0) {
            return member.getMemberNum();
        }else {
            return -1;
        }
    }
    
    public MemberVO memberLogin(String id, String pw) {
    	return dao.memberLogin(id, pw);
    }
}
