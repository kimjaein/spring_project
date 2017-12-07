package repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;

import repository.mapper.MemberMapper;
import vo.MemberVO;

@Component("memberDao")
public class MemberDao {
    @Autowired
    private SqlSessionTemplate session;
     
    public void setSession(SqlSessionTemplate session) {
        this.session = session;
    }
    
    public int memberJoin(MemberVO member) {
        MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.memberInsert(member);
    }
    
    public MemberVO memberLogin(String id, String pw) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.memberLogin(id, pw);
    }

	public int insertFriend(int memberNum) {
		 MemberMapper mapper = 
	                session.getMapper(MemberMapper.class);
	        return mapper.insertFriend(memberNum);
	}

	public MemberVO selectUserInfo(int memberNum) {
		MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
		return mapper.selectUserInfo(memberNum);
	}

	public int updateUserInfo(MemberVO member) {
		MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
		return mapper.updateUserInfo(member);
	}

}
