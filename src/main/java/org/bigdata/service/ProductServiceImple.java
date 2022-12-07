package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImple implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	//상의 검색
	@Override
	public List<CoatVO> getProductCoatList(Criteria cri) {
		log.info("getProductCoatList 메서드 ");
		return productMapper.getProductCoatList(cri);
	}

	//상의 총 갯수
	@Override
	public int coatProductGetTotal(Criteria cri) {
		log.info("coatProductGetTotal 메서드 ");
		return productMapper.coatProductGetTotal(cri);
	}

	//하의 검색
	@Override
	public List<PantsVO> getProductPantsList(Criteria cri) {
		log.info("getProductPantsList 메서드 ");
		return productMapper.getProductPantsList(cri);
	}

	//하의 총 갯수
	@Override
	public int pantsProductGetTotal(Criteria cri) {
		log.info("pantsProductGetTotal 메서드 ");
		return productMapper.pantsProductGetTotal(cri);
	}

	//신발 검색
	@Override
	public List<ShoesVO> getProductShoesList(Criteria cri) {
		log.info("getProductShoesList 메서드 ");
		return productMapper.getProductShoesList(cri);
	}

	//신발 총 갯수
	@Override
	public int shoesProductGetTotal(Criteria cri) {
		log.info("shoesProductGetTotal 메서드 ");
		return productMapper.shoesProductGetTotal(cri);
	}

}
