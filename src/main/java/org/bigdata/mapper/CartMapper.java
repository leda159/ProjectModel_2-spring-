package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.CartDTO;

public interface CartMapper {

	//상의
	
	//카트 추가
	//row 반환 성공 : 1 ,  반환 실패 : 0 
	public int addCartCoat(CartDTO cart) throws Exception;
	
	//카트 삭제
	public int deleteCartCoat(int cartId);
	
	//카트 수량 수정
	public int modifyCountCoat(CartDTO cart);
	
	//카트 목록
	public List<CartDTO> getCartCoat(String memberId);
	
	//카트 확인
	public CartDTO checkCartCoat(CartDTO cart);
	
	
	//하의
	
	//카트 추가
	//row 반환 성공 : 1 ,  반환 실패 : 0 
	public int addCartPants(CartDTO cart);
	
	//카트 삭제
	public int deleteCartPants(int cartId);
	
	//카트 수량 수정
	public int modifyCountPants(CartDTO cart);
	
	//카트 목록
	public List<CartDTO> getCartPants(String memberId);
	
	//카트 확인
	public CartDTO checkCartPants(CartDTO cart);
	
	
	//신발
	
	//카트 추가
	//row 반환 성공 : 1 ,  반환 실패 : 0 
	public int addCartShoes(CartDTO cart);
	
	//카트 삭제
	public int deleteCartShoes(int cartId);
	
	//카트 수량 수정
	public int modifyCountShoes(CartDTO cart);
	
	//카트 목록
	public List<CartDTO> getCartShoes(String memberId);
	
	//카트 확인
	public CartDTO checkCartShoes(CartDTO cart);	
}
