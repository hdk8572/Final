package kh.groupware.stream.company.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
import kh.groupware.stream.company.model.vo.DeptVo;

@Controller
public class CompanyContoller {

	@Autowired
	protected JavaMailSenderImpl mailSender;

	@Autowired
	private CompanyService companyService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// 회사 메인 페이지
	@GetMapping("/company/main")
	public String companyMain(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		if (msg != null) {
			model.addAttribute("alertmsg", msg);
		}
		return "/company/main";
	}

	// 회사 가입 페이지
	@GetMapping("/newcompany")
	public ModelAndView showNewCompany(ModelAndView mv) {
		mv.setViewName("login/newcompany");
		return mv;
	}

	// 회사 가입
	@PostMapping("/newcompany")
	public String newCompany(CompanyInsertParam cvo, RedirectAttributes ra) {

		if (cvo.getDeptArr() == null || cvo.getDeptArr().equals("")) {
			ra.addFlashAttribute("alertmsg", "최소 한개의 부서를 등록해주세요!");
			return "redirect:/newcompany";
		} else if (cvo.getEmailArr() == null || cvo.getEmailArr().equals("")) {
			ra.addFlashAttribute("alertmsg", "최소 한개의 이메일을 등록해주세요!");
			return "redirect:/newcompany";
		} else {
			cvo.setPassword(bCryptPasswordEncoder.encode(cvo.getPassword()));
			int result = companyService.newCompany(cvo);
			try {
				for (String email : cvo.getEmailArr()) {
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

					mailHelper.setTo(email);
					mailHelper.setSubject("업무협업툴 Stream으로 여러분을 초대합니다!");
					mailHelper.setText("다음 Url에 접속하셔서 회원가입을 진행해주세요! \n ※회원가입시 본 이메일을 전송받은 이메일을 입력해주셔야합니다※ \n 회사코드: "
							+ cvo.getCcode() + "\n http://ec2-15-164-211-70.ap-northeast-2.compute.amazonaws.com:8080/newmember");

					mailSender.send(mail);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		ra.addFlashAttribute("alertmsg", "회사등록에 성공하였습니다.\n회사아이디: " + cvo.getCcode() + "@stream.com\n회사 비밀번호: 1234");
		return "redirect:/";
	}

	// 회사 사원초대(추가) 페이지
	@GetMapping("/company/emailsend")
	public String showEmailSend() {
		return "/company/emailsend";
	}

	// 회사 사원초대(추가)
	@PostMapping("/company/emailsend")
	public String inviteMember(CompanyInsertParam cvo, RedirectAttributes ra, Principal principal) {
		String cname = principal.getName();
		String ccode = companyService.selectCcode(cname);

		cvo.setCcode(ccode);
		System.out.println("[jy] cvo.getCcode(): " + cvo.getCcode());
		System.out.println("[jy] cvo.getDefaultDeptCode(): " + cvo.getDefaultDeptCode());

		if (cvo.getEmailArr() == null || cvo.getEmailArr().equals("")) {
			ra.addFlashAttribute("alertmsg", "최소 한개의 이메일을 등록해주세요!");
			return "redirect:/company/emailsend";
		} else {
			int result = companyService.inviteMember(cvo);
			try {
				for (String email : cvo.getEmailArr()) {
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

					mailHelper.setTo(email);
					mailHelper.setSubject("업무협업툴 Stream으로 여러분을 초대합니다!");
					mailHelper.setText("다음 Url에 접속하셔서 회원가입을 진행해주세요! \n ※회원가입시 본 이메일을 전송받은 이메일을 입력해주셔야합니다※ \n 회사코드: "
							+ cvo.getCcode() + "\n http://ec2-15-164-211-70.ap-northeast-2.compute.amazonaws.com:8080/newmember");

					mailSender.send(mail);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		ra.addFlashAttribute("alertmsg", "성공적으로 초대되었습니다.");
		return "redirect:/company/emailsend";
	}

	// 회사코드로 부서찾기
	@PostMapping("/deptlist")
	@ResponseBody
	public List<DeptVo> deptList(String ccode) {
		List<DeptVo> deptList = companyService.deptList(ccode);
		return deptList;
	}

}
