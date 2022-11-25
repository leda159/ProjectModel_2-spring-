package org.bigdata.service;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;

public interface AdminService {

	//상의 등록
	public void productCoat(CoatVO coat);
	//하의 등록
	public void productPants(PantsVO pants);
	//신발 등록
	public void ProductShoes(ShoesVO shoes);
}
