package org.bigdata.controller;





import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {

	//프로젝트 실행시 main.jsp 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {

		log.info("메인페이지 실행");
			return "main";
	}
	
}
