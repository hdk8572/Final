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

		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_A"))) {
			response.sendRedirect("admin/main");
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_C"))) {
			response.sendRedirect("company/main");
		}else {
			response.sendRedirect("link");
		}
	}

}
