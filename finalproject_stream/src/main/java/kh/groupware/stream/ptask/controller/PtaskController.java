package kh.groupware.stream.ptask.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.groupware.stream.ptask.model.service.PtaskService;

@Controller
public class PtaskController {

	@Autowired
	private PtaskService ptaskservice;
	
	@GetMapping("/adminkit/project/ptask")
	public String list(Model model) {
		model.addAttribute("volist", ptaskservice.selectList());
		return "test/ptask";
	}
	
}
