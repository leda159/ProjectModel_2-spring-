package org.bigdata.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bigdata.domain.MemberVO;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		//mov가 null이거나 getAdminCk() 메서드 반환값이 0이면 main 페이지로 리다이렉트
		if(mvo == null || mvo.getAdminCk() == 0 ) { //관리가 계정이 아닌 경우
			
			response.sendRedirect("/main");//메인 페이지 이동
			
			return false;
		}
		return true; //관리가 계정 로그인 경우
	}

	
}







