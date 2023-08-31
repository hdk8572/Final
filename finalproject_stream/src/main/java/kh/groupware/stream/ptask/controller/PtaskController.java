package kh.groupware.stream.ptask.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PtaskController {

	@GetMapping("/adminkit/project/ptask")
	public String ptask() {
		
		return "test/ptask";
	}
	
}
