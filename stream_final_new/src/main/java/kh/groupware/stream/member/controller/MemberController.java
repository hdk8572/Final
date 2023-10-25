package kh.groupware.stream.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.company.model.service.CompanyService;
import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.member.model.service.MemberService;
import kh.groupware.stream.member.model.service.MemberServiceImpl;
import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// 회원가입 페이지
	@GetMapping("/newmember")
	public ModelAndView newMember(ModelAndView mv) {
		mv.setViewName("login/newmember");
		return mv;
	}

	// 회원가입(update)
	@PostMapping("/newmember")
	public String signUp(MemberVo mvo, RedirectAttributes ra) throws Exception {
		int idCheck = 0;
		int ccodeCheck = 0;
		String result = null;

		idCheck = memberService.idCheck(mvo.getUserid());
		ccodeCheck = memberService.ccodeCheck(mvo);
		if (idCheck == 0) {
			ra.addFlashAttribute("alertmsg", "존재하지 않는 정보입니다. 링크를 전달받은 이메일 주소를 입력해주세요.");
			return "redirect:/newmember";

		} else if (ccodeCheck == 0) {
			ra.addFlashAttribute("alertmsg", "회사코드를 잘못 입력하셨습니다.");
			return "redirect:/newmember";

		} else {

			mvo.setPassword(bCryptPasswordEncoder.encode(mvo.getPassword()));

			int result1 = memberService.signUp(mvo);

			if (result1 == 0) {
				ra.addFlashAttribute("alertmsg", "회원가입에 실패하였습니다. 다시 시도해주세요!");
				return "redirect:/newmember";

			} else
				ra.addFlashAttribute("alertmsg", "회원가입에 성공했습니다. 로그인해주세요!");
			return "redirect:/main";
		}
	}

	// 로그인 페이지
	@GetMapping("/login")
	public String login(Model model
			, HttpSession session) {
		String msg = (String)session.getAttribute("msg");
		session.removeAttribute("msg");
		if(msg != null) {
			model.addAttribute("alertmsg", msg);
		}
		return "login/login";
	}

	// 마이페이지
	@GetMapping("/showmypage")
	@ResponseBody
	public MyPageVo showMyPage(String userid) {
		MyPageVo showMyPage = memberService.showMyPage(userid);
		return showMyPage;
	}

	// 마이페이지 정보수정 페이지
	@GetMapping("/member/editmypage")
	public String showEditMyPage(Principal principal, Model model) {
		MyPageVo mvo = memberService.showEditMyPage(principal.getName());
		model.addAttribute("mvo", mvo);
		System.out.println("[jy] mvo: " + mvo);
		return "member/mypage";
	}

	// 마이페이지 정보수정
	@PostMapping("/member/editmypage")
	public String editMyPage(MemberVo mvo, RedirectAttributes ra) {
		String result = null;
		System.out.println("[jy] 정보수정시 mvo: " + mvo);
		if (mvo.getPassword() == null || mvo.getPassword().equals("")) {
			int result2 = memberService.editMyPage2(mvo);
			if (result2 == 0) {
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 실패하였습니다. 다시 시도해주세요!");
				return "redirect:/member/editmypage";
			} else
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 성공했습니다.");
		} else {
			mvo.setPassword(bCryptPasswordEncoder.encode(mvo.getPassword()));
			int result1 = memberService.editMyPage(mvo);

			if (result1 == 0) {
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 실패하였습니다. 다시 시도해주세요!");
				return "redirect:/member/editmypage";

			} else
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 성공했습니다.");

		}
		return "redirect:/member/projectlist";
	}

	@ExceptionHandler
	public String exception(RedirectAttributes ra) {
		ra.addFlashAttribute("alertmsg", "오류가 발생하여 메인페이지로 이동합니다.");
		return "redirect:/";
	}

}
