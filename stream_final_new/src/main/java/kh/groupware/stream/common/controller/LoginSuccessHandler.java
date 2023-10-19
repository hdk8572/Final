package kh.groupware.stream.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		// session에 이름담기
		// HttpSession session = request.getSession();
		// session.setAttribute("userid", authentication.getName());
		// String userid = authentication.getName();
		
		String msg;
		
		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_A"))) {
			response.sendRedirect("admin/main");
			msg = "반갑습니다. 관리자님";
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_C"))) {
			msg = "Stream에 성공적으로 로그인하셨습니다.";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("company/main");
	
		}else {
			msg = "Stream에 성공적으로 로그인하셨습니다.";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("member/projectlist");
		}
		
	}

}
