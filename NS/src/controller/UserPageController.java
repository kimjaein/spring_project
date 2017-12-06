package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.UserPageService;
import vo.AlarmVO;
import vo.ArticlePhotoVO;
import vo.FriendVO;
import vo.MemberVO;

@Controller
public class UserPageController {
    @Autowired
    private UserPageService service;
    public void setService(UserPageService service) {
        this.service = service;
    }
    @RequestMapping("friendCheck.ns")
    public void friendCheck(FriendVO friend, AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("친구나"+friend.getOne_member_num());
    	System.out.println("친구너"+friend.getOther_member_num());
    	alarm.setTo_member_num(friend.getOne_member_num());
    	alarm.setFrom_member_num(friend.getOther_member_num());
    	System.out.println("알람나"+alarm.getTo_member_num());
    	System.out.println("알람나"+alarm.getFrom_member_num());
    	
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(friend.getOne_member_num() == friend.getOther_member_num()) {
    			writer.print("mypage");
    		}else {
	    		if(service.friendCheck(friend) != 0) {
	    			writer.print("friendDelete"); // 친구삭제버튼
	    		}else {
	    			if(service.alarmCheck(alarm) != 0) {
	    				writer.print("friendRequest"); // 요청중
	    			}else {
	    				writer.print("friendInsert"); // 친구추가버튼
	    			}
	    		}
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    @RequestMapping("friendInsert.ns")
    public void friendInsert(FriendVO friend, AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
    	alarm.setTo_member_num(friend.getOne_member_num());
    	alarm.setFrom_member_num(friend.getOther_member_num());
    	alarm.setType(1);
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(service.alarmCheck(alarm) == 0) {
    			if(service.alarmInsert(alarm) > 0) {
    				writer.print(1);
    			}
    		}else {
    			writer.print("insertrequestttt");
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    @RequestMapping("friendDelete.ns")
    public void friendDelete(FriendVO friend, HttpServletRequest request, HttpServletResponse response) {
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(service.friendCheck(friend) != 0) {
    			if(service.friendDelete(friend) > 0) {
    				writer.print("deleteOK");
    			}
    		}else {
    			writer.print("deleterequestttt");
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
	@RequestMapping("/userPhotoUpload.ns")
	public ModelAndView upload(MemberVO member, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("userpage");
		System.out.println("사진내번호:"+member.getMemberNum());
		String uploadPath = req.getServletContext().getRealPath("userPhoto");
		System.out.println("uploadPath:"+uploadPath);
		File dir = new File(uploadPath);

		if (!dir.exists()) {
			dir.mkdir(); // 해당 디렉토리 없으면 생성
		}

		// 업로드 받은 파일을 아래 이름의 파일로 만들어서
		// 서버측에 저장시키기
		String savedName = new Random().nextInt(100) + member.getPhotoFile().getOriginalFilename();
		System.out.println("savedName:"+savedName);
		member.setPhoto(savedName);
		File savedFile = new File(uploadPath + "/" + savedName);
		mv.addObject("searchUserNum", member.getMemberNum());
		mv.addObject("imgPath", "userPhoto/" + savedName);
		// 전달받은 파일 업로드 작업.
		try {
			member.getPhotoFile().transferTo(savedFile);
			
			int updateResult = service.userPhotoUpdate(member);
			System.out.println("업로드 결과"+updateResult);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
    
    @RequestMapping("userPhoto.ns")
    public void userPhoto(MemberVO member, HttpServletRequest request, HttpServletResponse response) {
    	System.out.println(member.getMemberNum());
    	try {
    		PrintWriter writer = response.getWriter();
    		String photo = service.userPhotoSelect(member);
    		if(photo.length() != 0) {
    			writer.print(photo);
    		}else {
    			writer.print("no");
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    @RequestMapping("friendList.ns")
    public ModelAndView friendList(HttpSession session) {
    	ModelAndView mv = new ModelAndView("myFriendList");
    	
    	int memberNum = (int) session.getAttribute("memberNum");
    	List<MemberVO> friendList = service.selectFriendList(memberNum);
    	
    	mv.addObject("friendList",friendList);
    	return mv;
    }
    
    @RequestMapping("photoGallery.ns")
  	public ModelAndView phtoGallery(HttpServletRequest request,ArticlePhotoVO photo) {
      	ModelAndView mv = new ModelAndView("photoGallery");
  		String member_num = request.getParameter("memberNum");
  		int memberNum = Integer.parseInt(member_num);
  		List<ArticlePhotoVO> vo = service.photoGallery(memberNum);
  		System.out.println("asdasdasasdasdasd"+vo);
  		
  		mv.addObject("photoList",vo);
  		return mv;
  		
  	}
}
