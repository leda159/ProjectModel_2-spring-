package org.bigdata.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bigdata.domain.MemberVO;
import org.springframework.web.servlet.HandlerInterceptor;

// "/cart/**" url을 이용하는 사용자가 요청을 했을때 Controller로 요청이 가기 전
// 요청자가 로그인을 했는지 확인함

public class CartIntreceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//sesseion을 불러서 데이터기 있는지 없는지 확인 후
		//Controller or 메인페이지로 이동
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo == null) {
			response.sendRedirect("/main");
			return false;
		} else {
			return true;
		}		
	}
	
}
