package org.bigdata.service;

import java.util.ArrayList;
import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.domain.CoatVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j	
public class AdminServiceTests {

	
	@Autowired
	private AdminService service;
	
	
	//상품등록, 상품 이미지 등록 테스트
	@Test
	public void productCoatTest() {
		
		//상품 정보
		CoatVO coat = new CoatVO();
		
		coat.setCoatName("testNmae");
		coat.setCoatKey(123);
		coat.setCoatPrice(10000);
		coat.setCoatStock(10);
		coat.setCoatContents("내용");
		
		
		//이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();

		
		image1.setFileName("test image1");
		image1.setUploadPath("test image1");
		image1.setUuid("test111");
		
		image2.setFileName("test image1");
		image2.setUploadPath("test image1");
		image2.setUuid("test111");
		
		
		imageList.add(image1);
		//imageList.add(image2);
		
		coat.setImageList(imageList);
		
		service.productCoat(coat);
		
		log.info("등록된 VO : " + coat);
		
		
	}
}


















