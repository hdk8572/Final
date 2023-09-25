package kh.groupware.stream.common.controller;

import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.member.model.vo.MemberVo;

@Controller
public class TestController01 {

	@GetMapping("/test01")
	public ModelAndView test01(ModelAndView mv) {
		mv.setViewName("login/signuptest");
		return mv;

	}
	@GetMapping("/test02")
	public String getUserName(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username= auth.getName();
		
		model.addAttribute("username", username);
		return "login/signuptest";
	}
	//사용하지않는방법

}
