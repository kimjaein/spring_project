package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.RequestPageMapper;
import repository.mapper.UserPageMapper;
import vo.AlarmVO;
import vo.FriendVO;
import vo.MemberVO;

@Component("requestpageDao")
public class RequestPageDao {

	@Autowired
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	
	public int requestCheck(AlarmVO alarm) {
		RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
		return mapper.requestCheck(alarm);
	}
	public int requestAccept(AlarmVO alarm) {
		RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
		return mapper.requestAccept(alarm);
	}
		
	public List<MemberVO> requestList(int memberNum){
		RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
		return mapper.requestList(memberNum);
	}
	public String requestPhotoSelect(MemberVO member) {
		RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
		return mapper.requestPhotoSelect(member);
	}
}