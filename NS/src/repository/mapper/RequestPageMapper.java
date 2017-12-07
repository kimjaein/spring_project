package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.AlarmVO;
import vo.FriendVO;
import vo.MemberVO;

   public interface RequestPageMapper {
      public List<MemberVO> requestList(@Param("memberNum")int memberNum);
      public int alarmDelete(AlarmVO alarm);
      public int friendInsert(AlarmVO alarm);
      public int friendInsertsub(AlarmVO alarm);
}
