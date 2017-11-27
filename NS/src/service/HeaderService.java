package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.HeaderDao;
import vo.AlarmVO;
import vo.MemberVO;

@Component
public class HeaderService {
    @Autowired
    private HeaderDao dao;
    public void setDao(HeaderDao dao) {
        this.dao = dao;
    }
    
    public List<MemberVO> searchFriendList(String search){
    	return dao.searchFriendList(search);
    }
    
    public List<AlarmVO> badgeList(@Param("memberNum")int memberNum) {
    	return dao.badgeList(memberNum);
    }
}
