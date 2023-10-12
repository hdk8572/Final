package kh.groupware.stream.attend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendController {
	
	@GetMapping("/member/attend")
	public String showAttend(){
		return "/member/attend";
	}

}
