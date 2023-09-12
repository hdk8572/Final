
package kh.groupware.stream.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Controller
public class ajaxProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping("/projectlist")
	public String main() {
		return "projectList_ajax";
	}
	
	@RequestMapping("/projectlist.ajax")
	public @ResponseBody List<ProjectVo> insertList() {
		List<ProjectVo> list = service.selectList();
		return list;
	}


	
}
