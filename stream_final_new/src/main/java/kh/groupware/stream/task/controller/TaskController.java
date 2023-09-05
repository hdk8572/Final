package kh.groupware.stream.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kh.groupware.stream.task.model.service.TaskService;
import kh.groupware.stream.task.model.vo.TaskVo;

@Controller
public class TaskController {

	@Autowired
	private TaskService service;
	
	/*
	 * @GetMapping("/adminkit/project/ptask") public String list(Model model) {
	 * model.addAttribute("volist", service.selectList()); return
	 * "views/task/ptask"; }
	 */
	
	@GetMapping("/project")
	public String selectOne(Model model, String pno) {
		TaskVo vo = service.selectOne(pno);
		model.addAttribute("vo", vo);
		return "/project";
	}
	
	
	@GetMapping("/project?pno=#{pno}")
	public String selectList(Model model) {
		model.addAttribute("tlist", service.selectList());
		return "/project";
	}
	
	
	
}
