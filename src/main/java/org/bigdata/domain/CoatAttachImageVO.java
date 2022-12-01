package org.bigdata.domain;

import lombok.Data;

@Data
public class CoatAttachImageVO {

	//경로
	private String uploadPath;
	
	//uuid
	private String uuid;
	
	//파일 이름
	private String fileName;
	
	//상의 id
	private int coatId;
	
}
