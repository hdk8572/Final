package kh.groupware.stream.calendar.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.groupware.stream.calendar.model.dao.CalendarDao;
import kh.groupware.stream.calendar.model.service.CalendarService;
import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

@Controller
public class CalendarController {
	
	@Autowired 
	private CalendarService calendarService;

	@GetMapping({"/member/pcal"})
	public ModelAndView selectList(ModelAndView mv, Principal principal, RedirectAttributes rttr
			) {
		mv.setViewName("calendar/projectcalendar");
		return mv;
	}
	
	//캘린더 전체 조회 
	@GetMapping({"/member/pcalselectlist"})
	@ResponseBody
	public String calSelectList(String pno, CalendarParamVo paramvo, HttpSession session) throws Exception { 
		List<CalendarVo> calendarList = null;
		calendarList = calendarService.selectList(paramvo);
		session.setAttribute("selectedPno", pno);
		return new Gson().toJson(calendarList);	
	}
	
	//캘린더 일정 상세 조회
	@GetMapping("/member/pcalselectone")
	@ResponseBody
	public String calSelectOne(String sno) throws Exception { 
		CalendarVo cal = calendarService.selectOne(sno);
		return new Gson().toJson(cal); //화면에 뿌릴 것을 return해야함
	}
	
	//작성자도 포함
	//참석자 후보 조회 -  MemberProject 조회
	@GetMapping("/member/memberProjectList")
	@ResponseBody
	public String memberProjectList(CalendarParamVo param) throws Exception{
		return new Gson().toJson(calendarService.memberProjectList(param));
	}
	
	//캘린더 등록 
	@PostMapping("/member/insertpcal")
	public String insert(Model model, CalendarVo cal, RedirectAttributes rttr) throws Exception {
		if(cal.getAttenduseridArr() != null && cal.getAttenduseridArr().length > 0) {
			List<String> attenduseridArr = Arrays.asList(cal.getAttenduseridArr());
			List<MemberSimpleVo> attenduseridList= new ArrayList<MemberSimpleVo>();
			
			for(String userId : attenduseridArr) {
				MemberSimpleVo member = new MemberSimpleVo();
				member.setUserid(userId);
				attenduseridList.add(member);
			}
			cal.setAttenduseridList(attenduseridList);
		}
		System.out.println("[lim] :" + cal);
		calendarService.insert(cal);
		rttr.addFlashAttribute("projectTabs", "TabCalendar"); //projectTabs에 tabcalendar를 채워서 간다.
		return "redirect:/member/ptasklist?pno=" + cal.getPno();
	}
	
	//캘린더 삭제
	@PostMapping("/member/deletepcal")
	@ResponseBody
	public int delete(String sno) throws Exception { 
		return calendarService.delete(sno); 
	}
		
	//캘린더 수정
	@PostMapping("/member/updatepcal")
	@ResponseBody
	public String update(CalendarVo cal) throws Exception {
		int result = calendarService.update(cal);
		if(result > 0) {
			return "TabCalendar";
		}else {
			return "0"; 
		}
	}

	// 예외처리
	@ExceptionHandler
	private ModelAndView exceptionHandler(Exception e, RedirectAttributes rttr, HttpSession session) {
	    e.printStackTrace();
	    ModelAndView mv = new ModelAndView();
	    rttr.addFlashAttribute("projectTabs", "TabCalendar");

	    if (session.getAttribute("selectedPno") != null) {
	    	mv.setViewName("redirect:/member/ptasklist?pno=" + session.getAttribute("selectedPno")); // 사용자가 선택한 프로젝트로 리디렉션
	    }else {
	    	mv.setViewName("redirect:/member/projectlist?"); 
	    }

	    return mv;
	}
  
}
