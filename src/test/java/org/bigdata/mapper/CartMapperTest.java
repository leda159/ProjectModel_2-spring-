package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.CartDTO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {

	@Autowired
	private CartMapper cartMapper;
	
	//상의카트 등록
	@Ignore
	public void addCart() {
		
		String memberId = "admin";
		
		int coatNumber = 294;
		
		int count = 1;
		
		CartDTO cart = new CartDTO();
		
		
		cart.setMemberId(memberId);
		cart.setCoatNumber(coatNumber);
		cart.setCoatCount(count);
		
		int result = 0;
		//result = cartMapper.addCartCoat(cart);
		
		log.info("결과 " + result);
	}
	
	//상의 카트 삭제
	@Test
	public void deleteCartCoat() {
		
		int cartId = 7;
		
		cartMapper.deleteCartCoat(cartId);
	}
	
	
	//상의 카트 수정
	@Test
	public void modifyCartCoat() {
		
		int cartId = 4;
		int count = 5;
		
		CartDTO cart = new CartDTO();
		
		cart.setCartId(cartId);
		cart.setCoatCount(count);
		
		cartMapper.modifyCountCoat(cart);
	}
	
	//상의 카트 목록
	@Test
	public void getCartCoat() {
		
		String memberId = "test";
		
		List<CartDTO> list = cartMapper.getCartCoat(memberId);
		
		for(CartDTO cart : list) {
			log.info(cart);
			cart.coatSaleTotal();
			log.info("init cart :" +cart);
		}
	}
	
	//상의 카트 확인
	@Test
	public void checkCartCoat() {
		
		String memberId = "test";
		int coatNumber = 334;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setCoatNumber(coatNumber);
		
		CartDTO resutlCart = cartMapper.checkCartCoat(cart);
		log.info("결과 : " +resutlCart);
	}

}
















