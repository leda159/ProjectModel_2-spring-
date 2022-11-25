package org.bigdata.service;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//상의 등록
	@Override
	public void productCoat(CoatVO coat) {
		
		log.info("Service productCoat");
		adminMapper.productCoat(coat);
		
	}

	//하의 등록
	@Override
	public void productPants(PantsVO pants) {
		
		log.info("Service productPants");
		adminMapper.productPants(pants);
	}

	//신발 등록
	@Override
	public void ProductShoes(ShoesVO shoes) {
		
		log.info("Service ProductShoes");
		adminMapper.productShoes(shoes);
	}

}
