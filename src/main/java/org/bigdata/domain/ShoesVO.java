package org.bigdata.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShoesVO {

	//신발 번호
	private int shoesNumber;
	//신발 고유번호
	private int shoesKey;
	//신발 이름
	private String shoesName;
	//신발 가격
	private int shoesPrice;
	//신발 재고
	private int shoesStock;
	//신발 할인율(백분율)
	private double shoesDiscount;
	//신발 내용
	private String shoesContents;
	//등록 날짜
	private Date regDate;
	//수정 날짜
	private Date updateDate;
	//이미지 정보
	private List<AttachImageVO> imageList;
	
}
