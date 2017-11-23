package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.HeaderMapper;
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
}
