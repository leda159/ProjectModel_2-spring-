package org.bigdata.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.mapper.AttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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

	@Autowired
	private AttachMapper attachMapper;
	
	//로그인 페이지 이동
	@RequestMapping(value = "/main",method = RequestMethod.GET)
	public void loginGET() {
		log.info("메인 화면 이동");
	}
	
	//이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		log.info("getImage메서드 실행  : " + fileName);
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
	
	//상의 이미지 정보 반환
	@GetMapping(value="/getAttachCoatList" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>>getAttachCoatList(int coatNumber){
		
		log.info("getAttachCoatList....." + coatNumber);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachCoatList(coatNumber),HttpStatus.OK);
	}
	
	//하의 이미지 정보 반환
	@GetMapping(value="/getAttachPantsList" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>>getAttachPantsList(int pantsNumber){
		
		log.info("getAttachPantsList....." + pantsNumber);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachPantsList(pantsNumber),HttpStatus.OK);
	}
	
	
	//신발 이미지 정보 반환
	@GetMapping(value="/getAttachShoesList" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>>getAttachShoesList(int shoesNumber){
		
		log.info("getAttachShoesList....." + shoesNumber);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachShoesList(shoesNumber),HttpStatus.OK);
	}
	
	
}
















