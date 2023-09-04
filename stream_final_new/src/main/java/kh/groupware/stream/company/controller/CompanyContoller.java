package kh.groupware.stream.company.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class CompanyContoller {

	@GetMapping("/newcompany")
	public ModelAndView newCompany(ModelAndView mv) {
		mv.setViewName("login/newcompany.jsp");
		return mv;
	}
}
