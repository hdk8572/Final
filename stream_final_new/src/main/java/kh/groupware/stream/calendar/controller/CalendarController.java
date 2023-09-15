package kh.groupware.stream.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.groupware.stream.calendar.model.service.CalendarService;
import kh.groupware.stream.calendar.model.vo.CalendarVo;

@Controller
public class CalendarController {
	
	@Autowired 
	private CalendarService calendarService;
	
	@GetMapping("/pcal")
	public ModelAndView selectList(ModelAndView mv) {
		mv.setViewName("calendar/calendar");
		return mv;
	}
	
	//캘린더 전체 조회 //달력에 표시할 모든 일정 목록을 가져오는 역할을 한다.
	@GetMapping("/pcalselectlist")
	@ResponseBody
	public String calSelectList() {
		List<CalendarVo> calendarList = null;
		calendarList = calendarService.selectList();
		return new Gson().toJson(calendarList);	//캘린터 정보를 DB에서 조회한 후 JSON 형식으로 클라이언트에게 반환하는 것이다.
	}
	
	//캘린더 등록
	@PostMapping("/insertpcal")
	public String insert(Model model, CalendarVo cal) {
		System.out.println("aaaa :" + cal);
		calendarService.insert(cal);
		return "redirect:pcal?sno="+cal.getSno();
	}
	
	//캘린더 일정상세 조회
	@GetMapping("/pcalselectone")
	public String calSelectOne(Model model, String sno) { 
		CalendarVo cal = calendarService.selectOne(sno);
		model.addAttribute("sno", sno);
		return "calendar"; //화면에 뿌릴 것을 return해야함
	}
	
}
