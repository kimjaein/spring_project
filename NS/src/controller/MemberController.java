package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println(member.getId());
		System.out.println(member.getPw());
		
		ModelAndView mv = new ModelAndView();
		int memberNum = service.memberJoin(member);
		System.out.println("¸â¹ö¹øÈ£"+memberNum);
		mv.addObject("memberNum", memberNum);
		mv.setViewName("join_success");
		
		return mv;
	}
	
	@RequestMapping("login.ns")
	public String login(String id, String pw, HttpSession session) {
		MemberVO member = service.memberLogin(id, pw);
		session.setAttribute("Name", member.getName());
		session.setAttribute("memberNum", member.getMemberNum());
		return "main";
	}
	
	@RequestMapping("iframetest.ns")
	public String iframetest() {
		return "iframetest";
	}
	
}
