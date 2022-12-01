package org.bigdata.domain;

import lombok.Data;

@Data
public class ShoesAttachImageVO {

	//경로
	private String uploadPath;
		
	//uuid
	private String uuid;
		
	//파일 이름
	private String fileName;
		
	//신발 번호
	private int ShoesNumber;

}
