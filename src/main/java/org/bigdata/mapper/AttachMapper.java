package org.bigdata.mapper;

import java.util.List;

import org.bigdata.domain.AttachImageVO;

public interface AttachMapper {

	public List<AttachImageVO> getAttachList(int coatNumber);
}
