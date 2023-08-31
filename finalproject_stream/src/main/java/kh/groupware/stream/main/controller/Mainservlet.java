package kh.groupware.stream.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Mainservlet {
	
	@GetMapping("/test/maintask")
	public String MainTask() {
		
		return "test/maintask";
	}
	@GetMapping("/test/maintask2")
	public String Maintast2() {
		return "test/maintask2";
	}
	

}
