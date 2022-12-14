package org.bigdata.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PantsVO {

	//하의 번호
	private int pantsNumber;
	//하의 아이디
	private int pantsKey;
	//하의 이름
	private String pantsName;
	//하의 가격
	private int pantsPrice;
	//하의 재고
	private int pantsStock;
	//하의 할인율(백분율)
	private double pantsDiscount;
	//하의 내용
	private String pantsContents;
	//등록 날짜
	private Date regDate;
	//수정 날짜
	private Date updateDate;
	//이미지 정보
	private List<AttachImageVO> imageList;
	
}
