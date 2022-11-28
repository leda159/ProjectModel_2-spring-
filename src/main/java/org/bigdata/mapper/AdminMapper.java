package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.MemberVO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;

public interface AdminMapper {

	//상의 등록
	public void productCoat(CoatVO coat);
	
	//상의 상품 리스트
	public List<CoatVO> productCoatGetList(Criteria cri);
	
	//상의 상품 총 개수
	public int productCoatGetTotal(Criteria cri);
	
	
	
	
	
	//하의 등록
	public void productPants(PantsVO pants);
	
	//신발 등록
	public void productShoes(ShoesVO shoes);
	
	

}