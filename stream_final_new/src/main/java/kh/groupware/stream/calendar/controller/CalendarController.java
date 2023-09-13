package kh.groupware.stream.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/pcalselectlist")
	@ResponseBody
	public String calendarSelectList() {
		List<CalendarVo> calendarList = null;
		calendarList = calendarService.selectList();
		return new Gson().toJson(calendarList);
	}
	@GetMapping("/pcallist")
	public ModelAndView selectList(ModelAndView mv) {
//		List<CalendarVo> calendarList = null;
//		calendarList = calendarService.selectList();
//		mv.addObject("calendarList", calendarList);
		mv.setViewName("calendar/calendar");
		return mv;
	}
	
	@PostMapping("/insertpcal")
	public String insert(Model model, CalendarVo cal) {
		System.out.println("aaaa :" + cal);
		calendarService.insert(cal);
		return "redirect:pcal?sno="+cal.getSno();
	}

}
