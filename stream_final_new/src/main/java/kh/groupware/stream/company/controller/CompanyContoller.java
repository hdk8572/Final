package kh.groupware.stream.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.company.model.service.CompanyService;
import kh.groupware.stream.company.model.vo.CompanyVo;

@Controller
public class CompanyContoller {
	
	@Autowired
	private CompanyService companyService;

	@GetMapping("/newcompany")
	public ModelAndView newCompany(ModelAndView mv) {
		mv.setViewName("login/newcompany");
		return mv;
	}
	
	
}
