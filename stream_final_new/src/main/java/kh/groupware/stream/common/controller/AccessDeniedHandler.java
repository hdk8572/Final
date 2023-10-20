package kh.groupware.stream.common.controller;

import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomAccessDeniedHandler{
	
	@GetMapping("/accessDenied")
	public ModelAndView accessDenied(ModelAndView mv) {
		mv.setViewName("accessDenied");
		return mv;
	}
}
