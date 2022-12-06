package org.bigdata.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttachMapperTests {

	@Autowired
	private AttachMapper attachMapper;
	
	//이미지 정보 전환
	@Test
	public void getAttachListTests() {
		int coatNumber = 325;
		
		log.info("이미지 정보 : " + attachMapper.getAttachCoatList(coatNumber));
	}
}
