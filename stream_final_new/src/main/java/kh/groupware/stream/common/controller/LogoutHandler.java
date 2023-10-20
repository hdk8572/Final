package kh.groupware.stream.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class LogoutHandler implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		String msg = null;
		
		if(authentication != null && authentication.getDetails() != null) {
			try {
				request.getSession().invalidate();
				msg = "성공적으로 로그아웃 되었습니다.";
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setStatus(HttpServletResponse.SC_OK);
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/stream/main");
	}

}
