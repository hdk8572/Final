package kh.groupware.stream.attend.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.groupware.stream.attend.model.service.AttendService;
import kh.groupware.stream.attend.model.vo.AttendVo;

@Controller
public class AttendController {

	@Autowired
	private AttendService attendService;

	// 근태 퇴근
	@PostMapping("/member/attendout")
	@ResponseBody
	public String attendOut(AttendVo avo, RedirectAttributes ra) {
		int checkDate = attendService.checkDate(avo);
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (checkDate == 0) {
			msg = "출근이 이루어지지 않았습니다. 출근버튼을 눌러주세요.";
			map.put("msg", msg);
		} else {
			int result1 = 0;
			int result2 = 0;
			result1 = attendService.attendUpdate(avo);
			System.out.println("[jy] attendUpdate: " + result1);
			result2 = attendService.workHour(avo);
			System.out.println("[jy] workHour: " + result2);
			List<AttendVo> attendList = attendService.attendList(avo.getUserid());
			map.put("attendList", attendList);
		}
		
		return new Gson().toJson(map);
	}
	// 근태 출근
	@PostMapping("/member/attendin")
	@ResponseBody
	public String attendIn(AttendVo avo, RedirectAttributes ra) {
		int checkDate = attendService.checkDate(avo);
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (checkDate == 1) {
			msg = "이미 출근처리가 되어있습니다.";
			map.put("msg", msg);
		} else {
			int result = 0;
			result = attendService.attendIn(avo);
			List<AttendVo> attendList = attendService.attendList(avo.getUserid());
			System.out.println("[jy] attendList:" + attendList);
			map.put("attendList", attendList);
		}
	
		return new Gson().toJson(map);
	}

	@GetMapping("/member/attend")
	public String showAttend() {
		return "/member/attend";
	}

	// 근태리스트
	@PostMapping("/member/attend")
	@ResponseBody
	public List<AttendVo> attendList(String userid) {
		System.out.println("[jy] attendList userid: " + userid);
		List<AttendVo> attendList = attendService.attendList(userid);
		System.out.println("[jy] List<AttendVo> result: " + attendList);
		return attendList;

	}

}
