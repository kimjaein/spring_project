package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.UserPageMapper;
import vo.AlarmVO;
import vo.ArticlePhotoVO;
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
	
	public int alarmCheck(AlarmVO alarm) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.alarmCheck(alarm);		
	}
	
	public int alarmInsert(AlarmVO alarm) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.alarmInsert(alarm);
	}
	
	public int friendDelete(FriendVO friend) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.friendDelete(friend);
	}
	
	public int userPhotoUpdate(MemberVO member) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.userPhotoUpdate(member);
	}
	
	public String userPhotoSelect(MemberVO member) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.userPhotoSelect(member);
	}

	public List<MemberVO> selectFriendList(int memberNum) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.selectFriendList(memberNum);
	}
	
	public List<ArticlePhotoVO> photoGallery(int membernum) {
		UserPageMapper mapper = session.getMapper(UserPageMapper.class);
		return mapper.photoGallery(membernum);
	}
	
}
