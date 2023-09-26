package kh.groupware.stream.member.controller;

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
	//회원가입(update)
	@PostMapping("/newmember")
	public String signUp(MemberVo mvo, RedirectAttributes ra) {
		mvo.setPassword(bCryptPasswordEncoder.encode(mvo.getPassword()));
		System.out.println("[jy] MemberController: " + mvo);
		int result = memberService.signUp(mvo);
		if (result == 0) {
			ra.addFlashAttribute("msg", "회원가입에 실패하였습니다. 다시 시도해주세요!");
			return "redirect:/newmember";
		} else 
			ra.addFlashAttribute("msg", "회원가입에 성공했습니다. 로그인해주세요!");
		return "redirect:/main";
	}
	
	//로그인이동창
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("/login/login");
		return mv;
	}

	//마이페이지
	@GetMapping("/userpage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("/myPage");
		return mv;
	}


}
