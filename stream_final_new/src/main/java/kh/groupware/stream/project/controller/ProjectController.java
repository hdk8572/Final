
package kh.groupware.stream.project.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectVo;
import lombok.experimental.PackagePrivate;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@GetMapping("/member/projectlist")
	public String main() {
		System.out.println("정상적으로 돌았습니다");
		return "projectList";
	}

	
	@GetMapping("/member/projectOne")
	@ResponseBody
	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam) {
		ProjectVo vo = projectService.selectOne(pnoPrincipalParam);
		return vo;
	}
	
	/*
	 * @GetMapping("/projectOne/{pno}")
	 * 
	 * @ResponseBody public ProjectVo selectOne(@PathVariable("pno") String pno,
	 * Principal principal) { ProjectVo vo = projectService.selectOne(pno, userid);
	 * return vo; }
	 */
	 
	@GetMapping("/member/loadList")
	@ResponseBody
	public List<ProjectVo> loadList(Principal principal, String pname, HttpSession session) {
		System.out.println("loadList 돌았습니다");
		session.setAttribute("projectPname", pname);
		String userid = principal.getName();
		List<ProjectVo> list = projectService.selectList(userid);
		return list;
	}

	@GetMapping("/member/loadHide")
	@ResponseBody
	public List<ProjectVo> loadHide(Principal principal) {
		System.out.println("loadHide 돌았습니다");
		String userid = principal.getName();
		List<ProjectVo> list = projectService.selectHide(userid);
		return list;
	}

	@PostMapping("/member/projectInsert")
	@ResponseBody
	public List<ProjectVo> insert(ProjectVo vo, Principal principal) {
		String userid = principal.getName();
		List<ProjectVo> add = projectService.insertList(vo, userid);
		return add;
	}

	@GetMapping("/member/deleteList.ajax")
	@ResponseBody
	public Map<String, Object> delete(String pno) {
		int deletedLists = projectService.delete(pno);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", deletedLists);
		map.put("pno", pno);
		return map;
	}

	@GetMapping("/member/doUpdateProject")
	@ResponseBody
	public int update(ProjectVo vo) {
		int result = projectService.update(vo);
		return result;
	}

	@GetMapping("/member/doUpdateProject.direct")
	@ResponseBody
	public int updateBtn(PnoPrincipalParam pnoPrincipalParam) {
		ProjectVo currentVo = projectService.selectOne(pnoPrincipalParam);
		System.out.println(currentVo);
		currentVo.setPstatus("숨김");
		int result = projectService.update(currentVo);
		return 0;
	}
}
