package kh.groupware.stream.main.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.main.model.service.MaintaskService;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class MainController {
	@Autowired
	private MaintaskService maintastService;
//	@Autowired
//	private PtaskService ptastService;
	
	@GetMapping("/member/maintask")
	public String maintask(Model model, Principal principal) {
		String userid = principal.getName();
		model.addAttribute("projectList", maintastService.projectNameList(userid));
		model.addAttribute("findMname", maintastService.findMname(userid));
		return "task/maintask";
	}
	
	@PostMapping("/member/innertaskinsert")
	@ResponseBody
	public ProjectVo insert(PtaskVo vo){
		ProjectVo projectTaskList = maintastService.insertInnerTask(vo);
		return projectTaskList;
	}
	
	@GetMapping("/member/showprojectmemberlist")
	@ResponseBody
	public List<MemberSimpleVo> memberlist(String pno) {
		List<MemberSimpleVo> projectMemberList = maintastService.projectMemberList(pno);
		return projectMemberList;
	}
	
	@PostMapping("/member/sort")
	@ResponseBody
	public List<ProjectVo> sort(MaintaskSortVo vo) {
		List<ProjectVo> sortList = maintastService.TaskSortList(vo);
		return sortList;
	}
	/*
	 * Exception 처리하는법
	@ExceptionHandler
	private ModelAndView exceptionHandler(Exception e) {
		e.printStackTrace();
		HttpSession session;
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("selectedPno")!=null){
			mv.setViewName("redirect:/xxxx?pno?=");
		}else {
			mv.setViewName("redirect:/xxxx");
		}
		//pno가 없다. > 마지막 동작의 pno 세션에 저장해서 가지고 다녀야 함.
		//controller에서 session에 pno 들고다님.
		//매개인자로 HttpSession session 추가.
		//session.setAttribute(selectedPno, pno);
		return mv;
	}
	*/
}
