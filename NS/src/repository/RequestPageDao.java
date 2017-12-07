package repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.HeaderMapper;
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
   
    public List<MemberVO> requestList(@Param("memberNum")int memberNum) {
       RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
        return mapper.requestList(memberNum);
    }
    
    public int alarmDelete(AlarmVO alarm) {
       RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
        return mapper.alarmDelete(alarm);
    }
    
    public int friendInsert(AlarmVO alarm) {
       RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
        return mapper.friendInsert(alarm);
    }
    
    public int friendInsertsub(AlarmVO alarm) {
       RequestPageMapper mapper = session.getMapper(RequestPageMapper.class);
        return mapper.friendInsertsub(alarm);
    }
}