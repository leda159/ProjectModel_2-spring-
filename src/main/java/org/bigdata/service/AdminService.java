package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;

public interface AdminService {

	//상의 등록
	public void productCoat(CoatVO coat);
	//상의 리스트
	public List<CoatVO> productCoatGetList(Criteria cri);
	//상의 총 개수
	public int productCoatGetTotal(Criteria cri);
	
	
	
	
	//하의 등록
	public void productPants(PantsVO pants);
	//신발 등록
	public void ProductShoes(ShoesVO shoes);
}