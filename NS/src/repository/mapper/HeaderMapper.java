package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.AlarmVO;
import vo.MemberVO;

public interface HeaderMapper {
	public List<MemberVO> searchFriendList(@Param("search")String search);
	public List<AlarmVO> badgeList(@Param("memberNum")int memberNum);
}
