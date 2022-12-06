package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.AttachImageVO;

public interface AttachMapper {

	//상의
	public List<AttachImageVO> getAttachCoatList(int coatNumber);
	
	//하의
	public List<AttachImageVO> getAttachPantsList(int pantsNumber);
		
	//신발
	public List<AttachImageVO> getAttachShoesList(int shoesNumber);	
}
