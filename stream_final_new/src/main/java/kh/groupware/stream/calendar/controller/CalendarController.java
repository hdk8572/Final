package kh.groupware.stream.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.calendar.model.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired 
	private CalendarService calendarService;
	
	@GetMapping("/pcal")
	public ModelAndView Calendar(ModelAndView mv) {
		mv.setViewName("calendar/calendar");
		return mv;
	}
	//maincal
	
	 
	 

}
