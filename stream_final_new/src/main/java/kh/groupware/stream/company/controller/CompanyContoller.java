package kh.groupware.stream.company.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.company.model.service.CompanyService;
import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Controller
public class CompanyContoller {
	
	@Autowired
	private CompanyService companyService;

	@GetMapping("/newcompany")
	public ModelAndView showNewCompany(ModelAndView mv) {
		mv.setViewName("login/newcompany");
		return mv;
	}
	
	@PostMapping("/newcompany")
	public String newCompany(CompanyVo cvo) {
		int result = companyService.newCompany(cvo);
		return "main";
	}
	
	@RequestMapping(value="/newdept", method = RequestMethod.POST)
	public String newDept(@RequestBody List<DeptVo> deptList) {
		int result = companyService.newDept(deptList);
		return "main";
	}
	
	
}
