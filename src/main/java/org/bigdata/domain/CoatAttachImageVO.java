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
	
	//상의 번호
	private int coatNumber;
	
	//하의 번호
	private int pantsNumber;
	
	//신발 번호
	private int shoesNumber;
}
