package org.bigdata.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bigdata.domain.MemberVO;
import org.bigdata.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//http://localhost:8080/member
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	//로그인 페이지 이동
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public void loginGET() {
		log.info("로그인 화면 이동");
	}
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinGET() {
		log.info("회원가입 화면 이동");
	}
	
	//회원가입
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinPOST(MemberVO member)throws Exception{
		//회원가입 서비스 실행
		//memberservice.memberJoin(member);
		//log.info("join Service 성공");

        //회원가입 쿼리 실행
        memberservice.memberJoin(member);
		
		return "redirect:/main";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
			
		
		log.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(memberId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	//중복 아이디가 존재	
		} else {
			return "success";//중복 아이디 x
		}	
			
	} // memberIdChkPOST() 종료	
	
	
	//로그인
	//MemberVO : 데이터를 전달받기 위해
	//HttpServletRequest : 로그인 성공시 session에 회원 정보를 저장하기 위해
	//RedirectAttributes : 로그인 실패시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송하기 위해
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, 
							MemberVO member,
							RedirectAttributes rttr) throws Exception{
	
		//log.info("login 메서드 진입");
		//log.info("전달된 데이터:" + member);
		
		
		HttpSession session = request.getSession();
		MemberVO mvo = memberservice.memberLogin(member);
		
		//mvo == null > 로그인 실패 , 0:거짓 1:참
		if(mvo == null) {//DB에 아이디,비밀번호가 없는 경우
			
			int result = 0;
			
			rttr.addFlashAttribute("result",result);
			return "redirect:/member/login";
			
		}else{  //DB에 아이디,비밀번호가 있는 경우

			session.setAttribute("member", mvo);
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		log.info("logoutMainGET 메서드 진입");
		
		HttpSession session = request.getSession();	
		
		session.invalidate();//세션 삭제
		
		return "redirect:/main";
	}
}






