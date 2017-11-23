package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import service.HeaderService;
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
}
