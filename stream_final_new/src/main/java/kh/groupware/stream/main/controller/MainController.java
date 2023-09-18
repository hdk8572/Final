package kh.groupware.stream.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.groupware.stream.main.model.service.MaintastService;
import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class MainController {
	@Autowired
	private MaintastService MaintastService;
	private PtaskService PtastService;
	
	@GetMapping("/maintask")
	public String maintask(Model model) {
		model.addAttribute("projectList", MaintastService.projectNameList());
		return "/task/maintask2";
	}
	

}
