package kh.groupware.stream.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@GetMapping("/indexchat")
	public String maintask() {
		return "/indexchat";
	}
	@GetMapping("/searchbar")
	public String searchbar() {
		return "/searchbar";
	}
	@GetMapping("/signuptest")
	public String signuptest() {
		return "/login/signuptest";
	}
}
