package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.mapper.AttachMapper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService {

	private AttachMapper attachMapper;

	@Override
	public List<AttachImageVO> getAttachCoatList(int coatNumber) {
		
		log.info("getAttachList......");
		
		return attachMapper.getAttachCoatList(coatNumber);
	}
	
	@Override
	public List<AttachImageVO> getAttachPantsList(int pantsNumber) {
		
		log.info("getAttachList......");
		
		return attachMapper.getAttachPantsList(pantsNumber);
	}
	
	@Override
	public List<AttachImageVO> getAttachShoesList(int shoesNumber) {
		
		log.info("getAttachList......");
		
		return attachMapper.getAttachShoesList(shoesNumber);
	}
}
