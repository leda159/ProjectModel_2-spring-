package org.bigdata.service;


import org.bigdata.domain.CartDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j	
public class CartServiceTest {

	@Autowired
	private CartService service;

	// 1 : 등록 성공
	// 2 : 등록된 데이터 존재
	// 5 : 로그인 필요
	
	
	//상의 등록 테스트
	@Test
	public void addCartCoatTest() {
		//given
			String memberId = "admin";
			int coatNumber = 362;
			int coatCount = 5;
			
			CartDTO dto = new CartDTO(); 
			dto.setMemberId(memberId);
			dto.setCoatNumber(coatNumber);
			dto.setCoatCount(coatCount);
		
		//when
			int result = service.addCartCoat(dto);
		
		//then
			System.out.println("** result : " + result);
		
		
	}
	
	//하의 등록 테스트
	@Test
	public void addCartPantsTest() {
		//given
			String memberId = "admin";
			int pantsNumber = 288;
			int pantsCount = 5;
			
			CartDTO dto = new CartDTO(); 
			dto.setMemberId(memberId);
			dto.setPantsNumber(pantsNumber);
			dto.setPantsCount(pantsCount);
		
		//when
			int result = service.addCartPants(dto);
		
		//then
			System.out.println("** result : " + result);
		
		
	}
	
	//신발 등록 테스트
	@Test
	public void addCartShoesTest() {
		//given
			String memberId = "admin";
			int shoesNumber = 262;
			int shoesCount = 5;
			
			CartDTO dto = new CartDTO(); 
			dto.setMemberId(memberId);
			dto.setShoesNumber(shoesNumber);
			dto.setShoesCount(shoesCount);
		
		//when
			int result = service.addCartShoes(dto);
		
		//then
			System.out.println("** result : " + result);
		
		
	}		
}
