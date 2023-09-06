package kh.groupware.stream.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.groupware.stream.task.model.service.TaskService;
import kh.groupware.stream.task.model.vo.TaskVo;

@Controller
public class TaskController {

	@Autowired
	private TaskService service;
	
	@GetMapping("/project")
	public String pSelectOne(Model model, String pno) {
		TaskVo tlist = service.selectOne(pno);
		model.addAttribute("tlist", tlist);
		return "/project";
	}
	
}
