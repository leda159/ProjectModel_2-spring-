package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;

public interface ProductService {

	//상의 검색
	public List<CoatVO> getProductCoatList(Criteria cri);
	
	//상의 총 갯수
	public int coatProductGetTotal(Criteria cri);
	
	
	//하의 검색
	public List<PantsVO> getProductPantsList(Criteria cri);
	
	//하의 총 갯수
	public int pantsProductGetTotal(Criteria cri);
	
	
	//신발 검색
	public List<ShoesVO> getProductShoesList(Criteria cri);
	
	//신발 총 갯수
	public int shoesProductGetTotal(Criteria cri);	
}
