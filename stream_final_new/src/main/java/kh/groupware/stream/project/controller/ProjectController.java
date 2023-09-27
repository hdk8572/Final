
package kh.groupware.stream.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/projectlist")
	public String main() {
		System.out.println("정상적으로 돌았습니다");
		return "projectList";
	}

	@GetMapping("/projectOne/{pno}")
	@ResponseBody
	public ProjectVo selectOne(@PathVariable("pno") String pno) {
		ProjectVo vo = projectService.selectOne(pno);
		return vo;
	}
	
	@GetMapping("/loadList")
	@ResponseBody 
	public List<ProjectVo> loadList() {
		System.out.println("loadList 돌았습니다");
		List<ProjectVo> list = projectService.selectList();
		return list;
	}
	
	@GetMapping("/loadHide")
	@ResponseBody 
	public List<ProjectVo> loadHide() {
		System.out.println("loadHide 돌았습니다");
		List<ProjectVo> list = projectService.selectHide();
		return list;
	}

	@PostMapping("/projectInsert")
	@ResponseBody
	public List<ProjectVo> insert(ProjectVo vo) {
		List<ProjectVo> add = projectService.insertList(vo);
		return add;
	}
	
	@GetMapping("/deleteList.ajax")
	@ResponseBody
	public Map<String, Object> delete(String pno) {
	    int deletedLists = projectService.deleteList(pno);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("result", deletedLists);
	    map.put("pno", pno);
	    return map;
	}
	
	@GetMapping("/doUpdateProject")
	@ResponseBody
	public int update(ProjectVo vo) {
		int result = projectService.update(vo);
		return result;
	}
	
	@GetMapping("/doUpdateProject.direct")
	@ResponseBody
	public int updateBtn(String pno) {
		ProjectVo currentVo = projectService.selectOne(pno);
		currentVo.setPstatus("숨김");
		int result = projectService.update(currentVo);
		return 0;
	}
	
}
