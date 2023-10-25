package kh.groupware.stream.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FirstController {

	@GetMapping({ "/main", "/" })
	public String streamMain(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		if (msg != null) {
			model.addAttribute("alertmsg", msg);
		}
		return "/main";
	}

	@GetMapping("/accessdenied")
	public String accessDenied(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		if (msg != null) {
			model.addAttribute("alertmsg", msg);
		}
		return "/access-denied";
	}
	
}
