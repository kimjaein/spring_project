package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.MemberVO;

public interface HeaderMapper {
	public List<MemberVO> searchFriendList(@Param("search")String search);
}
