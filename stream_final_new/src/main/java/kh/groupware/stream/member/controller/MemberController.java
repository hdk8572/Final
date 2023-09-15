package kh.groupware.stream.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	// 회원가입
	@GetMapping("/newmember")
	public ModelAndView newMember(ModelAndView mv) {
		mv.setViewName("login/newmember");
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("/login/login");
		return mv;
	}

	// security login
	@GetMapping("/login.do")
	public void getLoginView() {
	}

	@GetMapping("/userpage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("/myPage");
		return mv;
	}

	/*
	 * //member login
	 * 
	 * @PostMapping("/login.member")
	 * 
	 * @ResponseBody public String login(Model model, MemberVo mvo) { return
	 * memberService.selectOne(mvo); }
	 */

	// post 방식에서 return String
	// ajax 자료형 그자체

}
