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
	public List<AttachImageVO> getAttachList(int coatNumber) {
		
		log.info("getAttachList......");
		
		return attachMapper.getAttachList(coatNumber);
	}
}
