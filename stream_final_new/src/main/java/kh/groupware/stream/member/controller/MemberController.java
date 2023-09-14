package kh.groupware.stream.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.company.model.service.CompanyService;
import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.member.model.service.MemberService;
import kh.groupware.stream.member.model.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/newmember")
	public ModelAndView newMember(ModelAndView mv) {
		mv.setViewName("login/newmember");
		return mv;
	}
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login/login");
		return mv;
	}
	@GetMapping("/userpage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("/myPage");
		return mv;
	}
	
	
	//member login
	@PostMapping("/login.member")
	@ResponseBody
	public String login(Model model, MemberVo mvo) {
		return memberService.selectOne(mvo);

	}
	
	
	
	//post 방식에서 return String
	//ajax 자료형 그자체
	
}
