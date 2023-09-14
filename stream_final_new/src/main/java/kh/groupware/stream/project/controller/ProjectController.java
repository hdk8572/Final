
package kh.groupware.stream.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	@GetMapping("/projectlist")
	public String main() {
		return "projectList_ajax";
	}
	
	@GetMapping("/projectlist.ajax")
	@ResponseBody 
	public List<ProjectVo> insertList() {
		List<ProjectVo> list = service.selectList();
		return list;
	}

	@PostMapping("/projectInsert")
	@ResponseBody
	public List<ProjectVo>  insertList(ProjectVo vo) {
		List<ProjectVo> add = service.insertList(vo);
		return add;
	}
	 
	
}
