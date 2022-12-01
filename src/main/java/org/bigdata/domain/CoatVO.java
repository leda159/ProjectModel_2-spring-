package org.bigdata.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CoatVO {

	//상의 번호
	private int coatNumber;
	//상의 상품번호
	private int coatKey;
	//상의 이름
	private String coatName;
	//상의 가격
	private int coatPrice;
	//상의 재고
	private int coatStock;
	//상의 할인율(백분율)
	private double coatDiscount;
	//상의 내용
	private String coatContents;
	//등록 날짜
	//@JsonFormat(pattern="yyyy-MM-dd" ,timezone="Asia/Seoul")
	private Date regDate;
	//수정 날짜
	//@JsonFormat(pattern="yyyy-MM-dd" ,timezone="Asia/Seoul")
	private Date updateDate;
	
	//이미지 정보
	private List<CoatAttachImageVO> imageVO;
	
}
