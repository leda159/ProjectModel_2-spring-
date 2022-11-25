package org.bigdata.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CoatVO {

	//상의 아이디
	private int coatId;
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
	private Date regDate;
	//수정 날짜
	private Date updateDate;
	
}
