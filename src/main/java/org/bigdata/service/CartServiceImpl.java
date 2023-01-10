package org.bigdata.service;

import org.bigdata.domain.CartDTO;
import org.bigdata.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	
	@Override
	public int addCartCoat(CartDTO cart) {
		
		//상의 장바구니 데이터 체크
		CartDTO checkCartCoat = cartMapper.checkCartCoat(cart);
		
		if(checkCartCoat != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCartCoat(cart);
		} catch (Exception e) {
			return 0;		
		}
	
	}
	
	@Override
	public int addCartPants(CartDTO cart) {

		//하의 장바구니 데이터 체크
		CartDTO checkCartPants = cartMapper.checkCartPants(cart);
		
		if(checkCartPants != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCartPants(cart);
		} catch (Exception e) {
			return 0;		
		}		
	}

	
	@Override
	public int addCartShoes(CartDTO cart) {
		
		//신발 장바구니 데이터 체크
		CartDTO checkCartShoes = cartMapper.checkCartShoes(cart);
		
		if(checkCartShoes != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCartShoes(cart);
		} catch (Exception e) {
			return 0;		
		}
	}
}