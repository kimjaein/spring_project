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

	@RequestMapping("requestList.ns")
	public ModelAndView requestList(int memberNum) {
		ModelAndView mv = new ModelAndView("requestpage");
		List<MemberVO> friendList = service.requestList(memberNum);
		System.out.println(friendList);
		mv.addObject("friendList", friendList);
		return mv;
	}
	@RequestMapping("friendRefuse.ns")
	public void friendRefuse(AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(service.alarmDelete(alarm) != 0) {
    			writer.print(1);
    		}else {
    			writer.print(0);
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("friendAccept.ns")
	public void friendAccept(AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(service.alarmDelete(alarm) != 0) {
    			service.friendInsert(alarm);
    			service.friendInsertsub(alarm);
    			writer.print(1);
    		}else {
    			writer.print(0);
    		}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
