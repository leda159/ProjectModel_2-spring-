package org.bigdata.domain;

import lombok.Data;

@Data
public class PantsAttachImageVO {

	//경로
	private String uploadPath;
		
	//uuid
	private String uuid;
		
	//파일 이름
	private String fileName;
		
	//하의 번호
	private int PantsNumber;



}
