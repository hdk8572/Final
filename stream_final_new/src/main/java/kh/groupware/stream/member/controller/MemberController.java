package kh.groupware.stream.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@GetMapping("/newmember")
	public ModelAndView newMember(ModelAndView mv) {
		mv.setViewName("login/newmember.jsp");
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView logIn(ModelAndView mv) {
		mv.setViewName("login/login.jsp");
		return mv;
	}
	
	//post 방식에서 return String
	//ajax 자료형 그자체
	
}
