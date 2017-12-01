package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.MemberVO;

public interface SocketMapper {
	public List<MemberVO> friendNameList(@Param("memberNum")int memberNum);
}
