package kh.groupware.stream.calendar.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.groupware.stream.calendar.model.service.CalendarService;
import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

@Controller
public class CalendarController {
	
	@Autowired 
	private CalendarService calendarService;
	
	@GetMapping({"/pcal", "/pcal/{pno}"})
	public ModelAndView selectList(ModelAndView mv, @PathVariable(name = "pno", required = false) String pno
			, Principal principal
			, RedirectAttributes rttr
			) {
		
		if(pno != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pno", pno);
			map.put("userid", principal.getName());
			// 해당 프로젝트에 참여여부 확인
			int result = calendarService.isAttendedProject(map);
			if(result < 1) {
				// 해당 프로젝트에 참여하고 있지 않은 회원으로 프로젝트 리스트 화면으로 이동하게 함.
				rttr.addFlashAttribute("alertmsg", "소속된 프로젝트를 선택하세요.");
				mv.setViewName("redirect:/projectlist");
				return mv;
			}
		}
		mv.addObject("pno", pno);
		mv.setViewName("calendar/projectcalendar");
		return mv;
	}
	
	//캘린더 전체 조회 //달력에 표시할 모든 일정 목록을 가져오는 역할을 한다.
//	@GetMapping({"/pcalselectlist", "/pcalselectlist/{pno}"}) //1번처럼 들어올 수도 있고 2번처럼 들어올 수도 있다. //{}중괄호를 치고 번호를 적는 것임
//	@ResponseBody
//	public String calSelectList(@PathVariable(name = "pno", required = false) String pno) { //String pno->pno값을 들고올 수도 있는데(null값이 있을 수도 있음) 안 들고올 수도 있으니깐 앞에 저렇게 적어줌.required = false->꼭 pno가 있지 않을 수도 있어 
//		List<CalendarVo> calendarList = null;
//		calendarList = calendarService.selectList(pno);
//		return new Gson().toJson(calendarList);	//캘린터 정보를 DB에서 조회한 후 JSON 형식으로 클라이언트에게 반환하는 것이다.
//	}
	//캘린더 전체 조회 //달력에 표시할 모든 일정 목록을 가져오는 역할을 한다.
	@GetMapping({"/pcalselectlist"})
	@ResponseBody
	public String calSelectList(CalendarParamVo paramvo) { //String pno->pno값을 들고올 수도 있는데(null값이 있을 수도 있음) 안 들고올 수도 있으니깐 앞에 저렇게 적어줌.required = false->꼭 pno가 있지 않을 수도 있어 
		List<CalendarVo> calendarList = null;
		calendarList = calendarService.selectList(paramvo);
		return new Gson().toJson(calendarList);	//캘린터 정보를 DB에서 조회한 후 JSON 형식으로 클라이언트에게 반환하는 것이다.
	}
	
	
	//캘린더 일정 상세 조회
	@GetMapping("/pcalselectone")
	public String calSelectOne(Model model, String sno) { 
		CalendarVo cal = calendarService.selectOne(sno);
		model.addAttribute("cal", cal);
		return "calendar"; //화면에 뿌릴 것을 return해야함
	}
	
	//작성자도 포함
	//참석자 후보 조회 -  MemberProject 조회
	@GetMapping("/memberProjectList")
	@ResponseBody
	public String memberProjectList(CalendarParamVo param) {
		return new Gson().toJson(calendarService.memberProjectList(param));
	}//짧게 쓰는 방법임

	
	//캘린더 등록 
	@PostMapping("/insertpcal")
	public String insert(Model model, CalendarVo cal) {
		List<String> attenduseridArr = Arrays.asList(cal.getAttenduseridArr());
		List<MemberSimpleVo> attenduseridList= new ArrayList<MemberSimpleVo>();
		
		for(String userId : attenduseridArr) {
			MemberSimpleVo member = new MemberSimpleVo();
			member.setUserid(userId);
			attenduseridList.add(member);
		}
		cal.setAttenduseridList(attenduseridList);
		System.out.println("aaaa :" + cal);
		calendarService.insert(cal);
		return "redirect:pcal?sno="+cal.getSno();
	}
	
	//캘린더 수정
	@PostMapping("/updatepcal")
	@ResponseBody
	public int update(CalendarVo cal) {
		int result = calendarService.update(cal);
		return result;
	}

	
	//캘린더 삭제
	@PostMapping("/deletepcal")
	@ResponseBody
	public int delete(@RequestParam(name = "sno") String sno) {
	    return calendarService.delete(sno);
	}
	
	
}
