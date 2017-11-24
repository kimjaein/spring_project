package repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.MemberMapper;
import repository.mapper.UserPageMapper;
import vo.FriendVO;
import vo.MemberVO;

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
}
