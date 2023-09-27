package kh.groupware.stream.main.controller;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.main.model.service.MaintaskService;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class MainController {
	@Autowired
	private MaintaskService maintastService;
//	@Autowired
//	private PtaskService ptastService;
	
	@GetMapping("/maintask")
	public String maintask(Model model, Principal principal) {
		String userid = principal.getName();
		model.addAttribute("projectList", maintastService.projectNameList(userid));
		return "task/maintask";
	}
	
	@PostMapping("/innertaskinsert")
	@ResponseBody
	public ProjectVo insert(PtaskVo vo){
		ProjectVo projectTaskList = maintastService.insertInnerTask(vo);
		return projectTaskList;
	}
}
