package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.UserPageService;
import vo.AlarmVO;
import vo.FriendVO;

@Controller
public class UserPageController {
    @Autowired
    private UserPageService service;
    public void setService(UserPageService service) {
        this.service = service;
    }
    
    @RequestMapping("friendCheck.ns")
    public void friendCheck(FriendVO friend, AlarmVO alarm, HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("ģ����"+friend.getOne_member_num());
    	System.out.println("ģ����"+friend.getOther_member_num());
    	alarm.setTo_member_num(friend.getOne_member_num());
    	alarm.setFrom_member_num(friend.getOther_member_num());
    	System.out.println("�˶���"+alarm.getTo_member_num());
    	System.out.println("�˶���"+alarm.getFrom_member_num());
    	
    	try {
    		PrintWriter writer = response.getWriter();
    		
    		if(friend.getOne_member_num() == friend.getOther_member_num()) {
    			writer.print("mypage");
    		}else {
	    		if(service.friendCheck(friend) != 0) {
	    			writer.print("friendDelete"); // ģ��������ư
	    		}else {
	    			if(service.alarmCheck(alarm) != 0) {
	    				writer.print("friendRequest"); // ��û��
	    			}else {
	    				writer.print("friendInsert"); // ģ���߰���ư
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
}
