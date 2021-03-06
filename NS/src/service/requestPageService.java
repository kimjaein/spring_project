package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.RequestPageDao;
import repository.mapper.RequestPageMapper;
import vo.AlarmVO;
import vo.FriendVO;
import vo.MemberVO;

@Component
public class requestPageService {
    @Autowired
    private RequestPageDao dao;
    public void setDao(RequestPageDao dao) {
        this.dao = dao;
    }
    public List<MemberVO> requestList(@Param("memberNum")int memberNum) {
    	return dao.requestList(memberNum);
    }  
    
    public int alarmDelete(AlarmVO alarm) {
    	return dao.alarmDelete(alarm);
    }
    
    public int friendInsert(AlarmVO alarm) {
    	return dao.friendInsert(alarm);
    }
    
    public int friendInsertsub(AlarmVO alarm) {
    	return dao.friendInsertsub(alarm);
    }
}
