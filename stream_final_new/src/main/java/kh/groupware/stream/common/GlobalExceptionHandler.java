package kh.groupware.stream.common;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobalExceptionHandler {
/*
 * 
 * EXCEPTION 처리 예제
	@ExceptionHandler(Exception.class )
	private ModelAndView exceptionHandler(Exception e, HttpSession session, RedirectAttributes rtts) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("selectedPno")!=null){
			mv.setViewName("redirect:/xxxx?pno?=");
		}else {
			mv.setViewName("redirect:/xxxx");
		}
		//pno가 없다. > 마지막 동작의 pno 세션에 저장해서 가지고 다녀야 함.
		//controller에서 session에 pno 들고다님.
		//매개인자로 HttpSession session 추가.
		//session.setAttribute(selectedPno, pno);
		return mv;
	}
	
	@ExceptionHandler(SQLException.class )
	private ModelAndView exceptionHandler(SQLException e, HttpSession session, RedirectAttributes rtts) {
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("selectedPno")!=null){
			mv.setViewName("redirect:/xxxx?pno?=");
		}else {
			mv.setViewName("redirect:/xxxx");
		}
		//pno가 없다. > 마지막 동작의 pno 세션에 저장해서 가지고 다녀야 함.
		//controller에서 session에 pno 들고다님.
		//매개인자로 HttpSession session 추가.
		//session.setAttribute(selectedPno, pno);
		return mv;
	}
*/
}
