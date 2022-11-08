package org.bigdata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/")
public class MainController {

	//로그인 페이지 이동
		@RequestMapping(value = "/main",method = RequestMethod.GET)
		public void loginGET() {
			log.info("메인 화면 이동");
		}
}
