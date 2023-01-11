package org.bigdata.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bigdata.domain.CartDTO;
import org.bigdata.domain.MemberVO;
import org.bigdata.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@PostMapping("/cart/CoatAdd")
	@ResponseBody
	//상의
	public String addCartCoatPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.addCartCoat(cart);
		
		return result + "";
	}
	
	@PostMapping("/cart/PantsAdd")
	@ResponseBody
	//하의
	public String addCartPantsPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.addCartPants(cart);
		
		return result + "";
	}
	
	@PostMapping("/cart/ShoesAdd")
	@ResponseBody
	//신발
	public String addCartShoesPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.addCartShoes(cart);
		
		return result + "";
	}		
}
