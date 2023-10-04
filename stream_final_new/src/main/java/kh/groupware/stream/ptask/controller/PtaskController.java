package kh.groupware.stream.ptask.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class PtaskController {

	@Autowired
	private PtaskService ptaskService;

	@GetMapping("/ptasklist")
	public String ptasklist(Model model, String pno) {
		List<PtaskVo> tlist = ptaskService.pselectList(pno);
		model.addAttribute("pno", pno);
		model.addAttribute("tlist", tlist);
		return "project";
	}

	@PostMapping("/insertPtask")
	public String insertTask(Model model, PtaskVo vo) {
		System.out.println("asdasdasdasd :" + vo);
		ptaskService.insertTask(vo);
		/* return "redirect:ptasklist?pno="+vo.getPno(); */
		return "redirect:ptasklist?pno="+vo.getPno();
	}
	
	// 아래는 진짜 암기하자
	/* @GetMapping("/ptaskselectOne")
	@ResponseBody
	public Map<String, Object> selectOne(String pno, String tno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("tno", tno);
		return map;
	} */
	 
	
	@GetMapping("/ptaskselectOne") 
	@ResponseBody
	public PtaskVo selectOne( PnoTnoParam pnoTnoParam) {
		return ptaskService.selectOneInner(pnoTnoParam);
	}
}
