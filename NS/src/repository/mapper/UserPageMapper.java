package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.AlarmVO;
import vo.ArticlePhotoVO;
import vo.FriendVO;
import vo.MemberVO;

public interface UserPageMapper {
	public int friendCheck(FriendVO friend);
	public int alarmCheck(AlarmVO alarm);
	public int alarmInsert(AlarmVO alarm);
	public int friendDelete(FriendVO friend);
	public int userPhotoUpdate(MemberVO member);
	public String userPhotoSelect(MemberVO member);
	public List<MemberVO> selectFriendList(int memberNum);
	public List<ArticlePhotoVO> photoGallery(@Param("member_num")int membernum);
}
