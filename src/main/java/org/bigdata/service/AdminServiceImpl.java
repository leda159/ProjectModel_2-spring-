package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
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
	
	//상의 조회
	@Override
	public CoatVO productCoatGetDetail(int coatId) {
		log.info("productCoatGetDetail메서드 실행" + coatId);
		return adminMapper.productGetDetail(coatId);
	}
	
	//상의 수정
	@Override
	public int productCoatUpdate(CoatVO coat) {
		log.info("productCoatUpdate메서드 실행");
		return adminMapper.productCoatUpdate(coat);
	}
	
	//상의 삭제
	@Override
	public int productCoatDelete(int coatId) {
		log.info("productCoatDelete메서드 실행");
		return adminMapper.productCoatDelete(coatId);
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
