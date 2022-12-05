package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.AttachImageVO;

public interface AttachService {

	//이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int coatNumber);
}
