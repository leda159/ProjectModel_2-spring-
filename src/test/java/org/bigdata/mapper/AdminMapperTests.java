package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	//상의등록
	@Ignore
	public void productCoatTest() throws Exception{
		CoatVO coat = new CoatVO();
		
		coat.setCoatId(4);
		coat.setCoatName("상의 이름");
		coat.setCoatPrice(10000);
		coat.setCoatStock(10);
		coat.setCoatDiscount(0.30);
		coat.setCoatContents("상의 소개");
		
		mapper.productCoat(coat);
		log.info(coat);
	}
		//하의 등록
		@Test
		public void productPantsTest() throws Exception{
			PantsVO pants = new PantsVO();
			
			pants.setPantsId(1);
			pants.setPantsName("하의 이름");
			pants.setPantsPrice(10000);
			pants.setPantsStock(10);
			pants.setPantsDiscount(0.30);
			pants.setPantsContents("하의 소개");
			
			mapper.productPants(pants);
			log.info(pants);
		}
		//신발등록
		@Test
		public void productShoesTest() throws Exception{
			ShoesVO shoes = new ShoesVO();
			
			shoes.setShoesId(4);
			shoes.setShoesName("신발 이름");
			shoes.setShoesPrice(10000);
			shoes.setShoesStock(10);
			shoes.setShoesDiscount(0.30);
			shoes.setShoesContents("신발 소개");
			
			mapper.productShoes(shoes);
			log.info(shoes);
		}
		
		
		@Test
		public void goodsGetListTest() {
			
			Criteria cri = new Criteria();
			
			/* 검색조건 */
			cri.setKeyword("1");
			
			/* 검색 리스트 */
			List list = mapper.productCoatGetList(cri);
			for(int i = 0; i < list.size(); i++) {
				System.out.println("result......." + i + " : " + list.get(i));
			}
			
			/* 상품 총 갯수 */
			int result = mapper.productCoatGetTotal(cri);
			System.out.println("resutl.........." + result);
			
			
		}

}














