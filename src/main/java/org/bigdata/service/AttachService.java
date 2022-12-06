package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.AttachImageVO;

public interface AttachService {

	//상의 이미지 데이터 반환
	public List<AttachImageVO> getAttachCoatList(int coatNumber);
	
	//하의 이미지 데이터 반환
	public List<AttachImageVO> getAttachPantsList(int pantsNumber);
		
	//신발 이미지 데이터 반환
	public List<AttachImageVO> getAttachShoesList(int shoesNumber);
}
