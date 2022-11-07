package org.bigdata.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//http://localhost:8080/member
@RequestMapping(value = "/member")
public class MemberController {

	//로그인 페이지 이동
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public void loginGET() {
		log.info("로그인 화면 이동");
	}
	//회원가입 페이지 이동
	@RequestMapping(value = "join",method = RequestMethod.GET)
	public void joinGET() {
		log.info("회원가입 화면 이동");
	}
}
