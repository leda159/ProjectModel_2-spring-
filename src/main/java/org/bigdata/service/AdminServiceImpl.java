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
	public CoatVO productCoatGetDetail(int coatNumber) {
		log.info("productCoatGetDetail메서드 실행" + coatNumber);
		return adminMapper.productCoatGetDetail(coatNumber);
	}
	
	//상의 수정
	@Override
	public int productCoatUpdate(CoatVO coat) {
		log.info("productCoatUpdate메서드 실행");
		return adminMapper.productCoatUpdate(coat);
	}
	
	//상의 삭제
	@Override
	public int productCoatDelete(int coatNumber) {
		log.info("productCoatDelete메서드 실행");
		return adminMapper.productCoatDelete(coatNumber);
	}
	
	
	
	
	
	

	//하의 등록
	@Override
	public void productPants(PantsVO pants) {
		
		log.info("Service productPants");
		adminMapper.productPants(pants);
	}
	
	//하의 리스트
	@Override
	public List<PantsVO> productPantsGetList(Criteria cri) {
		log.info("productPantsGetList메소드 실행");
		return adminMapper.productPantsGetList(cri);
	}

	//하의 총 갯수
	@Override
	public int productPantsGetTotal(Criteria cri) {
		log.info("productPantsGetTotal메소드 실행");
		return adminMapper.productPantsGetTotal(cri);
	}
	
	//하의 조회
	@Override
	public PantsVO productPantsGetDetail(int pantsNumber) {
		log.info("productPantsGetDetail메서드 실행" + pantsNumber);
		return adminMapper.productPantsGetDetail(pantsNumber);
	}
	
	//하의 수정
	@Override
	public int productPantsUpdate(PantsVO pants) {
		log.info("productPantsUpdate메서드 실행");
		return adminMapper.productPantsUpdate(pants);
	}
	
	//하의 삭제
	@Override
	public int productPantsDelete(int pantsNumber) {
		log.info("productPantsDelete메서드 실행");
		return adminMapper.productPantsDelete(pantsNumber);
	}	
	
	
	
	

	//신발 등록
	@Override
	public void ProductShoes(ShoesVO shoes) {
		
		log.info("Service ProductShoes");
		adminMapper.productShoes(shoes);
	}

	//신발 리스트
	@Override
	public List<ShoesVO> productShoesGetList(Criteria cri) {
		log.info("productShoesGetList메소드 실행");
		return adminMapper.productShoesGetList(cri);
	}

	//신발 총 갯수
	@Override
	public int productShoesGetTotal(Criteria cri) {
		log.info("productShoesGetTotal메소드 실행");
		return adminMapper.productShoesGetTotal(cri);
	}
	
	//신발 조회
	@Override
	public ShoesVO productShoesGetDetail(int shoesNumber) {
		log.info("productShoesGetDetail메서드 실행" + shoesNumber);
		return adminMapper.productShoesGetDetail(shoesNumber);
	}
	
	//신발 수정
	@Override
	public int productShoesUpdate(ShoesVO shoes) {
		log.info("productShoesUpdate메서드 실행");
		return adminMapper.productShoesUpdate(shoes);
	}
	
	//신발 삭제
	@Override
	public int productShoesDelete(int shoesNumber) {
		log.info("productShoesDelete메서드 실행");
		return adminMapper.productShoesDelete(shoesNumber);
	}	



}
