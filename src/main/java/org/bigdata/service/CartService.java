package org.bigdata.service;

import org.bigdata.domain.CartDTO;

public interface CartService {

	//상의 장바구니 추가
	public int addCartCoat(CartDTO cart);
	
	//하의 장바구니 추가
	public int addCartPants(CartDTO cart);
		
	//신발 장바구니 추가
	public int addCartShoes(CartDTO cart);
}
