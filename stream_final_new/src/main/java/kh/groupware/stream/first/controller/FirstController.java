package kh.groupware.stream.first.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FirstController {

	@GetMapping({"/main","/"})
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	
	@GetMapping("letsmodal")
	public ModelAndView modalMain(ModelAndView mv) {
		mv.setViewName("main-modal");
		return mv;
	}
	@GetMapping("/link")
	public String link() {
		return "link";
	}
	@GetMapping("/company/main")
	public String cmain() {
		return "company/main";
	}
//	@GetMapping("/admin/main")
//	public String amain() {
//		return "admin/main";
//	}
}
