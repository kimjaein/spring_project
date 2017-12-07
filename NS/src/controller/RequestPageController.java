package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.requestPageService;
import service.UserPageService;
import vo.AlarmVO;
import vo.ArticlePhotoVO;
import vo.FriendVO;
import vo.MemberVO;

@Controller
public class RequestPageController {

	@Autowired
	private requestPageService service;

	public void setService(requestPageService service) {
		this.service = service;
	}

	@RequestMapping("requestCheck.ns")
	public void requestCheck(AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter writer = response.getWriter();

			if (service.requestCheck(alarm) != 0) {
				if (service.requestCheck(alarm) > 0) {
					writer.print("delete");
				}
			} else {
				writer.print("add");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("requestList.ns")
	public ModelAndView requestList(int memberNum) {
		ModelAndView mv = new ModelAndView("myrequestList");

		List<MemberVO> requestList = service.requestList(memberNum);

		mv.addObject("requestList", requestList);
		return mv;
	}

//    @RequestMapping("userPhoto.ns")
//    public void userPhoto(MemberVO member, HttpServletRequest request, HttpServletResponse response) {
//    	System.out.println(member.getMemberNum());
//    	try {
//    		PrintWriter writer = response.getWriter();
//    		String photo = service.userPhotoSelect(member);
//    		if(photo.length() != 0) {
//    			writer.print(photo);
//    		}else {
//    			writer.print("no");
//    		}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//    }
}
