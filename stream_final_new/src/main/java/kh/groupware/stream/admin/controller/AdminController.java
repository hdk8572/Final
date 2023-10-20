package kh.groupware.stream.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.groupware.stream.admin.model.service.AdminService;
import kh.groupware.stream.admin.model.vo.PagingVo;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/admin/main")
	public String adminPage(Model model, PagingVo vo, 
			@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpSession session) {

		String msg = (String)session.getAttribute("msg");
		session.removeAttribute("msg");
		if(msg!= null) {
			model.addAttribute("alertmsg", msg);
		}
		
		model.addAttribute("CNT", adminService.cnt());
		
//		model.addAttribute("companyList", adminService.companyList());
		
		int total = adminService.countCompany();
		if(nowPage ==null && cntPerPage == null) {
			nowPage="1";
			cntPerPage="5";
		}else if(nowPage==null) {
			nowPage="1";
		}else if (cntPerPage==null) {
			cntPerPage="5";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adminService.pagingCompanyList(vo));
		return "admin/main";
	}
	
}
