package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.MemberVO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;

public interface AdminMapper {
	
	/////////// 상의 ////////////////
	
	//상의 등록
	public void productCoat(CoatVO coat);
	
	//상의 상품 리스트
	public List<CoatVO> productCoatGetList(Criteria cri);
	
	//상의 상품 총 개수
	public int productCoatGetTotal(Criteria cri);
	
	//상의 조회
	public CoatVO productCoatGetDetail(int coatNumber);
	
	//상의 수정
	public int productCoatUpdate(CoatVO coat);
	
	//상의 삭제
	public int productCoatDelete(int coatNumber); 
	
	
	
	
	/////////// 하의 ////////////////
	
	//하의 등록
	public void productPants(PantsVO pants);

	//하의 상품 리스트
	public List<PantsVO> productPantsGetList(Criteria cri);
	
	//하의 상품 총 개수
	public int productPantsGetTotal(Criteria cri);
	
	//하의 조회
	public PantsVO productPantsGetDetail(int pantsNumber);
	
	//하의 수정
	public int productPantsUpdate(PantsVO pants);
	
	//하의 삭제
	public int productPantsDelete(int pantsNumber); 
	
	
	
	
	/////////// 신발 ////////////////
	
	//신발 등록
	public void productShoes(ShoesVO shoes);
	
	//신발 상품 리스트
	public List<ShoesVO> productShoesGetList(Criteria cri);
	
	//신발 상품 총 개수
	public int productShoesGetTotal(Criteria cri);
	
	//신발 조회
	public ShoesVO productShoesGetDetail(int shoesNumber);
	
	//신발 수정
	public int productShoesUpdate(ShoesVO shoes);
	
	//신발 삭제
	public int productShoesDelete(int shoesNumber); 
	
	
	
	
	/////////// 이미지 ////////////////	
	
	//상의 이미지 등록
	public void productCoatImage(AttachImageVO vo);
	
	//지정 상의 이미지 전체 삭제
	public void deleteCoatImageAll(int coatNumber);
	
	// 지정 상의 이미지 정보 얻기
	public List<AttachImageVO> getAttachCoatInfo(int coatNumber);
	
	
	//하의 이미지 등록
	public void productPantsImage(AttachImageVO vo);
	
	//지정 하의 이미지 전체 삭제
	public void deletePantsImageAll(int pantsNumber);
	
	// 지정 하의 이미지 정보 얻기
	public List<AttachImageVO> getAttachPantsInfo(int pantsNumber);	

	
	//신발 이미지 등록
	public void productShoesImage(AttachImageVO vo);
	
	//지정 신발 이미지 전체 삭제
	public void deleteShoesImageAll(int shoesNumber);
	
	// 지정 신발 이미지 정보 얻기
	public List<AttachImageVO> getAttachShoesInfo(int shoesNumber);		
	
	
	//어제 날짜 이미지 리스트
	public List<AttachImageVO> checkFileList();
	

}









