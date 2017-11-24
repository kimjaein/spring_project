package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.UserPageService;
import vo.FriendVO;

@Controller
public class UserPageController {
    @Autowired
    private UserPageService service;
    public void setService(UserPageService service) {
        this.service = service;
    }
    
    @RequestMapping("friendCheck.ns")
    public void friendCheck(FriendVO friend, HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("³ª"+friend.getOne_member_num());
    	System.out.println("³Ê"+friend.getOther_member_num());
    	int result = service.friendCheck(friend);
    	try {
			PrintWriter writer = response.getWriter();
			writer.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
//    	return 1;
    }
    
}
