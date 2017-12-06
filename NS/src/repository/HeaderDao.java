package repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.HeaderMapper;
import vo.AlarmVO;
import vo.MemberVO;

@Component("headerDao")
public class HeaderDao {
    @Autowired
    private SqlSessionTemplate session;
     
    public void setSession(SqlSessionTemplate session) {
        this.session = session;
    }
    
    public List<MemberVO> searchFriendList(String search){
    	HeaderMapper mapper = session.getMapper(HeaderMapper.class);
        return mapper.searchFriendList(search);
    }
    
    public List<AlarmVO> badgeList(@Param("memberNum")int memberNum) {
    	HeaderMapper mapper = session.getMapper(HeaderMapper.class);
        return mapper.badgeList(memberNum);
    }

	public MemberVO selectMember(String memberNum) {
		HeaderMapper mapper = session.getMapper(HeaderMapper.class);
        return mapper.selectMember(memberNum);
	}
}
