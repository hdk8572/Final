package kh.groupware.stream.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.groupware.stream.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/admin/main")
	public String adminPage(Model model) {
		model.addAttribute("CNT", adminService.cnt());
		
		return "admin/main";
	}
	
	
}
