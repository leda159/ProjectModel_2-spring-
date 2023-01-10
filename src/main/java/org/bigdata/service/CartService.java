package org.bigdata.service;

import org.bigdata.domain.CartDTO;

public interface CartService {

	//장바구니 추가
	public int addCart(CartDTO cart);
}
