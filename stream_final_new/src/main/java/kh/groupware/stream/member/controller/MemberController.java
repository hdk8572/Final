package kh.groupware.stream.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 회원가입이동창
	@GetMapping("/newmember")
	public ModelAndView newMember(ModelAndView mv) {
		mv.setViewName("login/newmember");
		return mv;
	}

	// 회원가입(update)
	@PostMapping("/newmember")
	public String signUp(MemberVo mvo, RedirectAttributes ra) {
		int idCheck = 0;
		String result = null;

		idCheck = memberService.idCheck(mvo.getUserid());

		if (idCheck == 0) {
			ra.addFlashAttribute("alertmsg", "존재하지 않는 정보입니다. 링크를 전달받은 이메일 주소를 입력해주세요.");
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

	// 로그인이동창
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("/login/login");
		return mv;
	}

	// 마이페이지
	@GetMapping("/member/showmypage")
	@ResponseBody
	public MyPageVo showMyPage(String userid) {
		MyPageVo showMyPage = memberService.showMyPage(userid);
		return showMyPage;
	}

	@GetMapping("/member/editmypage")
	public String showEditMyPage(Principal principal, Model model) {
		MemberVo mvo = memberService.showEditMyPage(principal.getName());
		model.addAttribute("mvo", mvo);
		System.out.println("[jy] mvo: " + mvo);
		return "member/mypage";
	}
	
	// 마이페이지 정보수정
	@PostMapping("/member/editmypage")
	public String editMyPage(MemberVo mvo, RedirectAttributes ra) {
		int idCheck=0;
		String result = null;
			int result1 = memberService.editMyPage(mvo);

			if (result1 == 0) {
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 실패하였습니다. 다시 시도해주세요!");
				return "redirect:/newmember";

			} else
				ra.addFlashAttribute("alertmsg", "회원정보 수정에 성공했습니다.");
			return "redirect:/projectlist";
		}
}
