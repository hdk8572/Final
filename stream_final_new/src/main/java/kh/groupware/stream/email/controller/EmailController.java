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
	
	@PostMapping("/send")
	public ModelAndView send(EmailVo vo, ModelAndView mv) {
		mv.setViewName("/projectlist");
		System.out.println("[jy] EmailVo: " + vo);
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = 
						new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				helper.setText(vo.getText(), true);
				
			}
		};
		mailSender.send(preparator);
		return mv;
	}
}
