package kh.groupware.stream.email.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.email.model.vo.EmailVo;

@Controller
public class EmailController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@GetMapping("/send")
	public String send() {
		System.out.println("[jy] mail 전송페이지");
		return "emailsend";
	}
	
}
