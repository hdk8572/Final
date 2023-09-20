package kh.groupware.stream.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.groupware.stream.dept.model.service.DeptService;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService DeptService;
	
	@PostMapping("/deptlist")
	@ResponseBody
	public List<DeptVo> deptList( String ccode) {
		List<DeptVo> deptList = DeptService.deptList(ccode);
		//model.addAttribute("deptList", DeptService.deptList(ccode));
		return deptList;
	}
}
