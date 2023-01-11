package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CartDTO;

public interface CartService {

	//상의 장바구니 추가
	public int addCartCoat(CartDTO cart);
	
	//하의 장바구니 추가
	public int addCartPants(CartDTO cart);
		
	//신발 장바구니 추가
	public int addCartShoes(CartDTO cart);
	
	//상의 장바구니 정보 리스트
	public List<CartDTO>getCoatCartList(String memberId);
	
	//하의 장바구니 정보 리스트
	public List<CartDTO>getPantsCartList(String memberId);
	
	//신발 장바구니 정보 리스트
	public List<CartDTO>getShoesCartList(String memberId);
}
