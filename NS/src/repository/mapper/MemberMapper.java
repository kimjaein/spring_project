package repository.mapper;

import org.apache.ibatis.annotations.Param;

import com.google.gson.JsonElement;

import vo.MemberVO;

public interface MemberMapper {
	public int memberInsert(MemberVO member);
	public MemberVO memberLogin(@Param("id")String id, @Param("pw")String pw);
	public int insertFriend(int memberNum);
	public MemberVO selectUserInfo(int memberNum);
	public int updateUserInfo(MemberVO member);
}
