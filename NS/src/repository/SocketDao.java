package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.SocketMapper;
import vo.MemberVO;

@Component("socketDao")
public class SocketDao {
	@Autowired
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	
	public List<MemberVO> friendNameList(int memberNum) {
		SocketMapper mapper = session.getMapper(SocketMapper.class);
		return mapper.friendNameList(memberNum);
	}
}
