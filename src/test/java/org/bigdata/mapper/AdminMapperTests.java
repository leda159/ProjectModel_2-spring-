package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
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
	@Test
	public void productCoatTest() throws Exception{
		CoatVO coat = new CoatVO();
		
		coat.setCoatKey(400);
		coat.setCoatName("상의 이름");
		coat.setCoatPrice(10000);
		coat.setCoatStock(10);
		coat.setCoatDiscount(0.30);
		coat.setCoatContents("상의 소개");
		
		log.info("before CoatVO : " + coat);
		
		mapper.productCoat(coat);
		
		log.info("afger CoatVO : " + coat);
		
		
	}
		//하의 등록
		@Test
		public void productPantsTest() throws Exception{
			PantsVO pants = new PantsVO();
			
			
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
			
			
			shoes.setShoesName("신발 이름");
			shoes.setShoesPrice(10000);
			shoes.setShoesStock(10);
			shoes.setShoesDiscount(0.30);
			shoes.setShoesContents("신발 소개");
			
			mapper.productShoes(shoes);
			log.info(shoes);
		}
		
		
		@Test
		public void productGetListTest() {
			
			Criteria cri = new Criteria();
			
			// 검색조건 
			//cri.setKeyword("3");
			
			// 검색 리스트 
			//List list = mapper.productCoatGetList(cri);
			//for(int i = 0; i < list.size(); i++) {
			//	System.out.println("result......." + i + " : " + list.get(i));
			//}
			
			// 상품 총 갯수 
			int result = mapper.productCoatGetTotal(cri);
			System.out.println("resutl.........." + result);
			
			
		}
		
		//상품 조회 페이지
		@Test
		public void productGetDetailTest() {
			
			int coatNumber = 1004;
			
			CoatVO result = mapper.productCoatGetDetail(coatNumber);
			
			System.out.println("상품 조회 데이터 : " + result);
			
			
		}
		
		//상의 수정
		@Test
		public void productCoatUpdateTset() {
			
			CoatVO coat = new CoatVO();
			
			coat.setCoatNumber(1145);
			coat.setCoatName("테스트");
			coat.setCoatPrice(100000);
			coat.setCoatStock(10);
			coat.setCoatDiscount(0.50);
			coat.setCoatContents("테스트");
			
			mapper.productCoatUpdate(coat);
		}
		
		//상의 삭제
		@Test
		public void productCoatDeleteTset() {
			
			int coatNumber =2168;
			
			int result = mapper.productCoatDelete(coatNumber);
			
			if(result == 1) {
				log.info("삭제 성공");
			}
		}
		
		//상의 이미지 등록
		@Test
		public void productImageTest() {
			
			AttachImageVO vo = new AttachImageVO();
			
			vo.setCoatNumber(302);
			vo.setFileName("test300");
			vo.setUploadPath("test3000");
			vo.setUuid("test30002");
			
			mapper.productCoatImage(vo);
		}
		
		//하의 이미지 등록
		@Test
		public void productImagePantsTest() {
					
			AttachImageVO vo = new AttachImageVO();
					
			vo.setPantsNumber(274);
			vo.setFileName("test300");
			vo.setUploadPath("test3000");
			vo.setUuid("test30002");
					
			mapper.productPantsImage(vo);
		}		
		
		//지정 상의 이미지 삭제
		@Test
		public void deleteCoatImageAllTest() {
			int coatNumber = 330;
			
			mapper.deleteCoatImageAll(coatNumber);
		}
		
		@Test
		public void getAttachCoatInfoTest() {
			
			int coatNumber = 313;
			
			List<AttachImageVO> list = mapper.getAttachCoatInfo(coatNumber);
			
			log.info("list : " + list);
		}

		
		// 어제 날짜 이미지 리스트 
		@Test
		public void checkImageListTest() {
			
			mapper.checkFileList();
			
		}		

}














