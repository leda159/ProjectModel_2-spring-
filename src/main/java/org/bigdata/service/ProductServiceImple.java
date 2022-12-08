package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.mapper.AdminMapper;
import org.bigdata.mapper.AttachMapper;
import org.bigdata.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImple implements ProductService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private ProductMapper productMapper;

	
/////////////////// 상의	/////////////////////////////////
	//상의 검색
	@Override
	public List<CoatVO> getProductCoatList(Criteria cri) {
		log.info("getProductCoatList 메서드 ");
		
		List<CoatVO> list = productMapper.getProductCoatList(cri);
		
		list.forEach(coat -> {
			
			int coatNumber = coat.getCoatNumber();
			
			List<AttachImageVO> imageList = attachMapper.getAttachCoatList(coatNumber);
			
			coat.setImageList(imageList);	
		});
		
		return list;
	}

	//상의 총 갯수
	@Override
	public int coatProductGetTotal(Criteria cri) {
		log.info("coatProductGetTotal 메서드 ");
		return productMapper.coatProductGetTotal(cri);
	}
	
	//상의 정보
	@Override
	public CoatVO getProductCoatInfo(int coatNumber) {
		CoatVO productCoatInfo = productMapper.getProductCoatInfo(coatNumber);
		productCoatInfo.setImageList(adminMapper.getAttachCoatInfo(coatNumber));
		
		return productCoatInfo;
	}

	
/////////////////////////// 하의 /////////////////////////////////////
	
	
	//하의 검색
	@Override
	public List<PantsVO> getProductPantsList(Criteria cri) {
		log.info("getProductPantsList 메서드 ");
		
		List<PantsVO> list = productMapper.getProductPantsList(cri);
		
		list.forEach(coat -> {
			
			int pantsNumber = coat.getPantsNumber();
			
			List<AttachImageVO> imageList = attachMapper.getAttachPantsList(pantsNumber);
			
			coat.setImageList(imageList);	
		});
		return list;
	}
	
	//하의 정보
	@Override
	public PantsVO getProductPantsInfo(int pantsNumber) {
		PantsVO productPantsInfo = productMapper.getProductPantsInfo(pantsNumber);
		productPantsInfo.setImageList(adminMapper.getAttachPantsInfo(pantsNumber));
		
		return productPantsInfo;
	}

	//하의 총 갯수
	@Override
	public int pantsProductGetTotal(Criteria cri) {
		log.info("pantsProductGetTotal 메서드 ");
		return productMapper.pantsProductGetTotal(cri);
	}

	
/////////////////////////// 신발 /////////////////////////////////////////	
	
	
	
	//신발 검색
	@Override
	public List<ShoesVO> getProductShoesList(Criteria cri) {
		log.info("getProductShoesList 메서드 ");
		
		List<ShoesVO> list = productMapper.getProductShoesList(cri);
		
		list.forEach(coat -> {
			
			int shoesNumber = coat.getShoesNumber();
			
			List<AttachImageVO> imageList = attachMapper.getAttachShoesList(shoesNumber);
			
			coat.setImageList(imageList);	
		});
		return list;
	}
	

	//신발 정보
	@Override
	public ShoesVO getProductShoesInfo(int shoesNumber) {
		ShoesVO productShoesInfo = productMapper.getProductShoesInfo(shoesNumber);
		productShoesInfo.setImageList(adminMapper.getAttachShoesInfo(shoesNumber));
		
		return productShoesInfo;
	}

	//신발 총 갯수
	@Override
	public int shoesProductGetTotal(Criteria cri) {
		log.info("shoesProductGetTotal 메서드 ");
		return productMapper.shoesProductGetTotal(cri);
	}


}
