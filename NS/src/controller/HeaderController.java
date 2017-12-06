package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.HeaderService;
import vo.AlarmVO;
import vo.MemberVO;

@Controller
public class HeaderController {
	    @Autowired
	    private HeaderService service;
	    public void setService(HeaderService service) {
	        this.service = service;
	    }
	    
		@RequestMapping("searchfriend.ns")
		public void searchfriend(String search, HttpServletRequest request, HttpServletResponse response) {
			List<MemberVO> searchFriendList = service.searchFriendList(search);
			try {
				PrintWriter writer = response.getWriter();
				Gson gson = new Gson();
				System.out.println(gson.toJson(searchFriendList));
				writer.print(gson.toJson(searchFriendList));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		@RequestMapping("userPage.ns")
		public ModelAndView userPage(String memberNum) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("searchUserNum", memberNum);
			mv.setViewName("userpage");
			return mv;
		}
		
		@RequestMapping("badgeList.ns")
		public void badgeList(int memberNum, HttpServletRequest request, HttpServletResponse response) {
			List<AlarmVO> list = service.badgeList(memberNum);
			try {
				PrintWriter writer = response.getWriter();
				Gson gson = new Gson();
				System.out.println(gson.toJson(list));
				writer.print(gson.toJson(list));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
}
