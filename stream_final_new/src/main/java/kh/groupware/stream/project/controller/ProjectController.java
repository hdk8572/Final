
package kh.groupware.stream.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;

	@GetMapping("/projectlist")
	public String selectList(Model model) {
		model.addAttribute("list", service.selectList());
		return "/projectList";
	}

	@PostMapping("projectInsert")
	public String insertList(Model model, ProjectVo vo) {
		service.insertList(vo);
		return "redirect:/projectlist";
	}

}
