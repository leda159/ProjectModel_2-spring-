package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
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

	//상의 리스트
	@Override
	public List<CoatVO> productCoatGetList(Criteria cri) {
		log.info("productCoatGetList메소드 실행");
		return adminMapper.productCoatGetList(cri);
	}

	//상의 총 갯수
	@Override
	public int productCoatGetTotal(Criteria cri) {
		log.info("productCoatGetTotal메소드 실행");
		return adminMapper.productCoatGetTotal(cri);
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
