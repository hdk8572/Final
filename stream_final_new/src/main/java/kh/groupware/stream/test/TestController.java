package kh.groupware.stream.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@GetMapping("test/full")
	public ModelAndView FullCalendar(ModelAndView mv) {
		mv.setViewName("calendar/calendar");
		
		return mv;
	}
	@GetMapping("/indexchat")
	public String maintask() {
		return "/indexchat";
	}
}
