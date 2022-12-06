package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		if(coat.getImageList() == null || coat.getImageList().size() <= 0) {
			return;
		}
		
		coat.getImageList().forEach(attach ->{
			
			attach.setCoatNumber(coat.getCoatNumber());
			adminMapper.productCoatImage(attach);
		});
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
		
		int result = adminMapper.productCoatUpdate(coat);
		
		if(result == 1 && coat.getImageList() != null && coat.getImageList().size() > 0) {
			adminMapper.deleteCoatImageAll(coat.getCoatNumber());
			
			coat.getImageList().forEach(attach -> {
				attach.setCoatNumber(coat.getCoatNumber());
				adminMapper.productCoatImage(attach);
			});
		}
		return result;
	}
	
	//상의 삭제
	@Override
	public int productCoatDelete(int coatNumber) {
		log.info("productCoatDelete메서드 실행");
		adminMapper.deleteCoatImageAll(coatNumber);
		return adminMapper.productCoatDelete(coatNumber);
	}
	
	//지정 상의 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachCoatInfo(int coatNumber) {
		log.info("getAttachCoatInfo메서드 실행");
		return adminMapper.getAttachCoatInfo(coatNumber);
	}	
	
	
	
	
	
	

	//하의 등록
	@Override
	public void productPants(PantsVO pants) {
		
		log.info("Service productPants");
		adminMapper.productPants(pants);
		
		if(pants.getImageList() == null || pants.getImageList().size() <= 0) {
			return;
		}
		
		pants.getImageList().forEach(attach ->{
			
			attach.setPantsNumber(pants.getPantsNumber());
			adminMapper.productPantsImage(attach);
		});
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
		
		int result = adminMapper.productPantsUpdate(pants);
		
		if(result == 1 && pants.getImageList() != null && pants.getImageList().size() > 0) {
			adminMapper.deletePantsImageAll(pants.getPantsNumber());
			
			pants.getImageList().forEach(attach -> {
				attach.setPantsNumber(pants.getPantsNumber());
				adminMapper.productPantsImage(attach);
			});
		}
		return result;
	}
	
	//하의 삭제
	@Override
	public int productPantsDelete(int pantsNumber) {
		log.info("productPantsDelete메서드 실행");
		adminMapper.deletePantsImageAll(pantsNumber);
		return adminMapper.productPantsDelete(pantsNumber);
	}	
	
	//지정 하의 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachPantsInfo(int pantsNumber) {
		log.info("getAttachPantsInfo메서드 실행");
		return adminMapper.getAttachPantsInfo(pantsNumber);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	

	//신발 등록
	@Override
	public void ProductShoes(ShoesVO shoes) {
		
		log.info("Service productShoes");
		adminMapper.productShoes(shoes);
		
		if(shoes.getImageList() == null || shoes.getImageList().size() <= 0) {
			return;
		}
		
		shoes.getImageList().forEach(attach ->{
			
			attach.setShoesNumber(shoes.getShoesNumber());
			adminMapper.productShoesImage(attach);
		});
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
		int result = adminMapper.productShoesUpdate(shoes);
		
		if(result == 1 && shoes.getImageList() != null && shoes.getImageList().size() > 0) {
			adminMapper.deleteShoesImageAll(shoes.getShoesNumber());
			
			shoes.getImageList().forEach(attach -> {
				attach.setShoesNumber(shoes.getShoesNumber());
				adminMapper.productShoesImage(attach);
			});
		}
		return result;
	}
	
	//신발 삭제
	@Override
	public int productShoesDelete(int shoesNumber) {
		log.info("productShoesDelete메서드 실행");
		return adminMapper.productShoesDelete(shoesNumber);
	}

	//지정 신발 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachShoesInfo(int shoesNumber) {
		log.info("getAttachShoesInfo메서드 실행");
		return adminMapper.getAttachShoesInfo(shoesNumber);
	}	



}
