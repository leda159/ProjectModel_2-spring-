package org.bigdata.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
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
		
		
		@GetMapping("/display")
		public ResponseEntity<byte[]> getImage(String fileName){
			
			log.info("getImage메서드 실행 " + fileName);
			File file = new File("c:\\upload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
													header,HttpStatus.OK);
			}catch(IOException e) {
				e.printStackTrace();
			}
			return result;
		}
}
