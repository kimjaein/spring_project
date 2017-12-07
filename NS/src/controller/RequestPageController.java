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
    	
    	List<MemberVO> requestList = service.requestList(memberNum);
    	
    	mv.addObject("requestList",requestList);
    	return mv;
    }
    
	@RequestMapping("requestPage.ns")
	public ModelAndView requestPage(String memberNum) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("requestList", requestList);
		mv.setViewName("requestpage");
		return mv;
	}

    @RequestMapping("requestAccept.ns")
    public void requestAccept(FriendVO friend, HttpServletRequest request, HttpServletResponse response) {
    	friend.getOne_member_num();
    	friend.
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
    
    @RequestMapping("requestBlock.ns")
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
}
