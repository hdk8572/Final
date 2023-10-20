package kh.groupware.stream.info.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	@GetMapping("/member/info")
	public ModelAndView info(ModelAndView mv,Principal principal) {
		String userId = principal.getName();
		mv.setViewName("info/main");
		
		return mv;
	}
}
