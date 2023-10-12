package kh.groupware.stream.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.groupware.stream.attend.model.service.AttendService;

@Controller
public class AttendController {
	
	@Autowired
	private AttendService attendService;
	
	
	@GetMapping("/member/attend")
	public String showAttend(){
		return "/member/attend";
	}

	// 출근
	@PostMapping("/member/attendin")
	public String attendIn(String userid) {
		System.out.println("[jy] attendIn userid: " + userid);
		int result = 0;
		result = attendService.attendIn(userid);
		return "redirect:/member/attendin";
	}
}
