package kh.groupware.stream.attend.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.groupware.stream.attend.model.service.AttendService;
import kh.groupware.stream.attend.model.vo.AttendVo;

@Controller
public class AttendController {
	
	@Autowired
	private AttendService attendService;
	
	// 출근
	@PostMapping("/member/attendin")
	public String attendIn(AttendVo avo) {
//		int checkDate = attendService.checkDate(avo);
//		if (checkDate == 1) {
//			//update code
//		} else if 
		System.out.println("[jy]attendIn2 avo:" + avo);
		int result = 0;
		result = attendService.attendIn(avo);
		return " redirect:/member/attendin";
	}
	
	// 근태리스트
	@GetMapping("/member/attend")
	public String attendList(Principal principal) {
		String userid = principal.getName();
		System.out.println("[jy] attendList userid: " + userid);
		List<AttendVo> result = attendService.attendList(userid);
		System.out.println("[jy] List<AttendVo> result: " + result);
		return "/member/attend";
		
	}
	
}
