package kh.groupware.stream.company.controller;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.company.model.service.CompanyService;
import kh.groupware.stream.company.model.vo.CompanyInsertParam;
import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Controller
public class CompanyContoller {

	@Autowired
	protected JavaMailSenderImpl mailSender;

	@Autowired
	private CompanyService companyService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("/newcompany")
	public ModelAndView showNewCompany(ModelAndView mv) {
		mv.setViewName("login/newcompany");
		return mv;
	}

	@PostMapping("/newcompany")
	public String newCompany(CompanyInsertParam cvo, RedirectAttributes ra) {
		if (cvo.getEmailArr() == null || cvo.getEmailArr().equals("")) {
			ra.addFlashAttribute("alertmsg", "최소 한개의 이메일을 등록해주세요!");
			return "redirect:/newcompany";
		} else {
			cvo.setPassword(bCryptPasswordEncoder.encode(cvo.getPassword()));
			int result = companyService.newCompany(cvo);
			try {
				for (String email : cvo.getEmailArr()) {
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

					mailHelper.setTo(email); // for문으로 아이디 받음
					mailHelper.setSubject("업무협업툴 Stream으로 여러분을 초대합니다!"); // Stream으로 여러분을 초대합니다!
					mailHelper.setText("다음 Url에 접속하셔서 " + "회원가입을 진행해주세요!" + "※회원가입시 본 이메일을 전송받은 이메일을 입력해주셔야합니다※"
							+ "회사코드: " + cvo.getCcode() + "http://127.0.0.1:8090/stream/newmember");

					mailSender.send(mail);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		ra.addFlashAttribute("alertmsg", "회사등록에 성공하였습니다. 문자로 회사 가입정보를 보내드렸습니다 확인해주세요!");
		return "redirect:/";
	}

	// 회사 사원 초대(추가)
	@GetMapping("/company/emailsend")
	public String emailSend() {
		return "/company/emailsend";
	}
//
//	@PostMapping(value = "/mailsend")
//	public String mailSend(@RequestParam("emailArr") String[] emailArr, CompanyInsertParam cvo) throws Exception {
//		System.out.println("[jy]: cvo " + cvo);
//		System.out.println("[jy]: emailArr " + emailArr);
//		try {
//			for (String email : emailArr) {
//				MimeMessage mail = mailSender.createMimeMessage();
//				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
//
//				mailHelper.setTo(email); // for문으로 아이디 받음
//				mailHelper.setSubject("업무협업툴 Stream으로 여러분을 초대합니다!"); // Stream으로 여러분을 초대합니다!
//				mailHelper.setText("다음 Url에 접속하셔서 " + "회원가입을 진행해주세요!" + "회사코드: " + cvo.getCcode());
//
//				mailSender.send(mail);
//			}
//		} catch (MessagingException e) {
//			e.printStackTrace();
//		}
//		return "/";
//	}
}
/*
 * @PostMapping(value = "/mailsend") public boolean
 * mailSend(@RequestParam("emailArr") String[] emailArr) throws Exception { try
 * { for (String email : emailArr) { MimeMessage mail =
 * mailSender.createMimeMessage(); MimeMessageHelper mailHelper = new
 * MimeMessageHelper(mail, "UTF-8");
 * 
 * mailHelper.setTo("orinog@naver.com"); // for문으로 아이디 받음
 * mailHelper.setSubject("제목입니다1006"); // Stream으로 여러분을 초대합니다!
 * mailHelper.setText("내용입니다");
 * 
 * mailSender.send(mail); } } catch (MessagingException e) {
 * e.printStackTrace(); } return true; }
 */

/*
 * @RequestMapping(value="/newdept", method = RequestMethod.POST) public String
 * newDept(@RequestBody List<DeptVo> deptList) { int result =
 * companyService.newDept(deptList); return "main"; }
 */
