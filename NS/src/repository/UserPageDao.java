package repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.UserPageMapper;
import vo.AlarmVO;
import vo.FriendVO;

@Component("userpageDao")
public class UserPageDao {

	@Autowired
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	    
	public int friendCheck(FriendVO friend) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.friendCheck(friend);
	}
	
	public int alarmCheck(AlarmVO alarm) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.alarmCheck(alarm);		
	}
}
