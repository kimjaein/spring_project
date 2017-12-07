package repository.mapper;

import java.util.List;

import vo.AlarmVO;
import vo.MemberVO;

	public interface RequestPageMapper {
		public int requestCheck(AlarmVO alarm);
		public int requestAccept(AlarmVO alarm);
		public String requestPhotoSelect(MemberVO member);
		public List<MemberVO> requestList(int memberNum);
}


