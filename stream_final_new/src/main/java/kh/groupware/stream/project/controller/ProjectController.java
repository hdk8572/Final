package kh.groupware.stream.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@GetMapping("/projectlist")
	public String selectList(Model model) {
		model.addAttribute("list", service.selectList());
		return "/projectList";
	}
	

	
}
