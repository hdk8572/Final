package kh.groupware.stream.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.groupware.stream.main.model.service.MaintastService;

@Controller
public class MainServlet {
	@Autowired
	private MaintastService service;
	
	@GetMapping("/maintask")
	public String maintask(Model model) {
		model.addAttribute("projectList", service.projectNameList());
		return "/task/maintask2";
	}

}
