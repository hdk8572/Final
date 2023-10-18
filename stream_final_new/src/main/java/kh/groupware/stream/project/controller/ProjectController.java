
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

import kh.groupware.stream.main.model.service.MaintaskService;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectInsertParamVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import lombok.experimental.PackagePrivate;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MaintaskService maintastService;

	@GetMapping("/member/projectlist")
	public String main() {
		System.out.println("정상적으로 돌았습니다");
		return "projectList";
	}
	
	@GetMapping("/member/projectOne")
	@ResponseBody
	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam) {
		System.out.println("pnoPrincipalParam :"+pnoPrincipalParam);
		ProjectVo vo = projectService.selectOne(pnoPrincipalParam);
		System.out.println("vo :"+vo);
		return vo;
	}
	 
	@GetMapping("/member/loadList")
	@ResponseBody
	public List<ProjectVo> loadList(Principal principal, String pname, HttpSession session) {
		System.out.println("loadList 돌았습니다");
		session.setAttribute("projectPname", pname);
		String userid = principal.getName();
		//MemberSimpleVo mvo = maintastService.findMname(userid);
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
	public List<ProjectVo> insert(ProjectInsertParamVo vo) {
		//String userid = principal.getName();
		List<ProjectVo> add = projectService.insertList(vo);
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
	
	@GetMapping("/member/serachProjectList")
	@ResponseBody
	public List<ProjectVo> search(String keyword, String userid) {
		ProjectVo pvo = new ProjectVo();
		pvo.setUserid(userid);
		pvo.setKeyword(keyword);
		return projectService.searchProjectList(pvo, keyword);
	}
	
	// 회사 소속 멤버 전체 조회 (addProjectModal 클릭 시)
	@GetMapping("/member/getCompanyMemberList")
	@ResponseBody
	public List<MemberSimpleVo> getCompanyMemberList(String userid) {
		return maintastService.companyMemberList(userid);
	}

	// 프로젝트 참여 멤버 전체 조회 (Update)
	@GetMapping("/member/getCurrentMemberList")
	@ResponseBody
	public List<MemberSimpleVo> currentMemberList(String pno) {
		return maintastService.currentMemberList(pno);
	}
	
	// 회사 멤버 1명 조회
//	@GetMapping("/member/getCompanyMemberList")
//	@ResponseBody
//	public MemberSimpleVo selectOneMember(String userid) {
//		return maintastService.selectOneMember(userid);
//	}
	
	// 회사 멤버 선택 시 추가
//	@GetMapping("/member/addCompanyMemberList")
//	@ResponseBody
//	public  getCompanyMemberList(String userid) {
//		
//	}
//	
}
