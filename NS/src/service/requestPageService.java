package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.RequestPageDao;
import repository.mapper.RequestPageMapper;
import vo.AlarmVO;
import vo.MemberVO;

@Component
public class requestPageService {
    @Autowired
    private RequestPageDao dao;
    public void setDao(RequestPageDao dao) {
        this.dao = dao;
    }
    
	public int requestCheck(AlarmVO alarm) {
		return dao.requestCheck(alarm);
	}
	
	public int requestAccept(AlarmVO alarm) {
		return dao.requestAccept(alarm);
	}
	
	public String requestPhotoSelect(MemberVO member) {
		return dao.requestPhotoSelect(member);
	}
	
	public List<MemberVO> requestList(int memberNum){
		return dao.requestList(memberNum);
	}
}
