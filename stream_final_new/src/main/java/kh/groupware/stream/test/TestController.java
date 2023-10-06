package kh.groupware.stream.test;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@Autowired
	protected JavaMailSenderImpl mailSender;
	
	@GetMapping("/indexchat")
	public String maintask() {
		return "/indexchat";
	}

	@GetMapping("/searchbar")
	public String searchbar() {
		return "/searchbar";
	}

}
