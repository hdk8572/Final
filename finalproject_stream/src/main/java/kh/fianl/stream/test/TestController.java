package kh.fianl.stream.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@GetMapping("test/full")
	public ModelAndView testFull(ModelAndView mv) {
		mv.setViewName("test/fullcalendar");
		
		return mv;
	}

}
