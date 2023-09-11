package kh.groupware.stream.ptask.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class PtaskController {

	@Autowired
	private PtaskService service;
	
	@PostMapping("/ptasklist")
	public String pSelectOne(Model model, String pno) {
		List<PtaskVo> tlist = service.selectList(pno);
		model.addAttribute("tlist", tlist);
		return "/project";
	}
	
	@PostMapping("/insertPtask")
	public String insertTask(Model model, PtaskVo vo) {
		service.insertTask(vo);
		return "redirect:ptasklist";
	}
	
}
