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

	
	
	/*
	 * @GetMapping("/ptasklist") public String selectList(Model model) {
	 * model.addAttribute("ptasklist", service.selectList()); return "/project"; }
	 */

	@GetMapping("/ptasklist")
	public String pSelectOne(Model model, String pno) {
		List<PtaskVo> tlist = service.pselectList(pno);
		model.addAttribute("pno", pno);
		model.addAttribute("tlist", tlist);
		return "project";
	}

	@PostMapping("/insertPtask")
	public String insertTask(Model model, PtaskVo vo) {
		System.out.println("asdasdasdasd :" + vo);
		service.insertTask(vo);
		/* return "redirect:ptasklist?pno="+vo.getPno(); */
		return "redirect:ptasklist?pno="+vo.getPno();
	}
	
}
