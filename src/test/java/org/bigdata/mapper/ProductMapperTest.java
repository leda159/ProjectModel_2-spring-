package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.service.AdminService;
import org.bigdata.service.ProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {

	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private ProductService service;
	
	//키워드 55
	//cri.setKeyword("55")
	@Test
	public void getProductCoatListTest() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("55");
		log.info("cri :" + cri);
		
		List<CoatVO> list = mapper.getProductCoatList(cri);
		log.info("list :" + list);
		
		log.info("=================");
		int coatProductTotal = mapper.coatProductGetTotal(cri);
		log.info("total : " + coatProductTotal );
	}
	
	@Test
	public void getProductShoesListTest() {
		
		Criteria cri = new Criteria();
		//cri.setKeyword("55");
		log.info("cri :" + cri);
		
		List<ShoesVO> list = mapper.getProductShoesList(cri);
		log.info("list :" + list);
		
		log.info("=================");
		int shoesProductTotal = mapper.shoesProductGetTotal(cri);
		log.info("total : " + shoesProductTotal );
	}
	
	@Test
	public void getProductPantsListTest() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("55");
		log.info("cri :" + cri);
		
		List<PantsVO> list = mapper.getProductPantsList(cri);
		log.info("list :" + list);
		
		log.info("=================");
		int pantsProductTotal = mapper.pantsProductGetTotal(cri);
		log.info("total : " + pantsProductTotal );
	}
	
	// 상품 정보 
	@Test
	public void getProductCoatInfo() {
		int coatNumber = 346;
		CoatVO coat = mapper.getProductCoatInfo(coatNumber);
		System.out.println("===========================");
		System.out.println(coat);
		System.out.println("===========================");
		
	}
	
	//상의 상품 상세 정보
	@Test
	public void getProductInfoTest() {
		
		int coatNumber = 346;
		
		CoatVO coat = service.getProductCoatInfo(coatNumber);
		
		log.info("=================");
		log.info("전체 : " + coat);
		log.info("coatNumber :"  + coat.getCoatNumber() );
		log.info("이미지 정보 : " + coat.getImageList().isEmpty());
	
	}
	
}
























