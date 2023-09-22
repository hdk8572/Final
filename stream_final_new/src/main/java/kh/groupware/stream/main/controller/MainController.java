package kh.groupware.stream.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.main.model.service.MaintaskService;
import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class MainController {
	@Autowired
	private MaintaskService MaintastService;
	private PtaskService PtastService;
	
	@GetMapping("/maintask")
	public String maintask(Model model) {
		model.addAttribute("projectList", MaintastService.projectNameList());
		return "/task/maintask2";
	}
	
	@ResponseBody
	@PostMapping("/innertaskinsert")
	public PtaskVo insert(PtaskVo vo){
		PtaskVo add = MaintastService.insertInnerTask(vo);
		return add;
	}
}
