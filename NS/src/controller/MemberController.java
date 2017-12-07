package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
    @Autowired
    private MemberService service;
    public void setService(MemberService service) {
        this.service = service;
    }
	
	@RequestMapping(value="join.ns", method=RequestMethod.POST)
	public ModelAndView join(MemberVO member) {
//		System.out.println(member.getId());
//		System.out.println(member.getPw());
		
		ModelAndView mv = new ModelAndView();
		int memberNum = service.memberJoin(member);
//		System.out.println("¸â¹ö¹øÈ£"+memberNum);
		mv.addObject("memberNum", memberNum);
		mv.setViewName("join_success");
		
		return mv;
	}
	
	@RequestMapping("login.ns")
	public String login(String id, String pw, HttpSession session) {
		MemberVO member = service.memberLogin(id, pw);
		if(member == null) {
			return "login_fail";
		}
		session.setAttribute("Name", member.getName());
		member.setId(id);
		session.setAttribute("id", member.getId());
		session.setAttribute("memberNum", member.getMemberNum());
		return "main";
	}
	
	@RequestMapping("iframetest.ns")
	public String iframetest() {
		return "iframetest";
	}
	
	@RequestMapping("userPageEx.ns")
	public String itest() {
		return "userpage";
	}
	
	@RequestMapping(value="set.ns",method=RequestMethod.POST)
	public void set(HttpServletResponse response,MemberVO member,HttpServletRequest request) throws IOException {
		String memberstNum  = request.getParameter("membernum");
		int memberNum = Integer.parseInt(memberstNum);
		member = service.selectUserInfo(memberNum);
		PrintWriter writer;
		response.setContentType("text/json;charset=euc-kr");
		writer = response.getWriter();
		Gson gson = new Gson();
		writer.println(gson.toJson(member));
		
	}
	
	@RequestMapping(value="setInfo.ns",method=RequestMethod.POST)
	public void setInfo(HttpServletResponse response,MemberVO member,HttpServletRequest request) throws IOException {
		String memberstNum  = request.getParameter("membernum");
		int memberNum = Integer.parseInt(memberstNum);
		member.setMemberNum(memberNum);
		int result = 0;
		result = service.updateUserInfo(member);
		member = service.selectUserInfo(memberNum);
		PrintWriter writer;
		response.setContentType("text/json;charset=euc-kr");
		writer = response.getWriter();
		Gson gson = new Gson();
		writer.println(gson.toJson(member));
		
	}

}
