package org.bigdata.domain;

import lombok.Data;

@Data
public class CartDTO {

	private int cartId;
	
	private String memberId;
	
	private int coatNumber;
	
	private int coatCount;
	
	private int pantsNumber;
	
	private int pantsCount;
	
	private int shoesNumber;
	
	private int shoesCount;
	
	
	//coat
	private String coatName;
	
	private int coatPrice;

	private double coatDiscount;
	
	
	//pants
	private String pantsName;
	
	private int pantsPrice;

	private double pantsDiscount;
	
	
	//shoes
	private String shoesName;
	
	private int shoesPrice;

	private double shoesDiscount;
	
	
	
	//상의 할인 적용한 판매가격
	private int coatSalePrice;
	
	//상의 판매가격 * 수량 
	private int coatTotalPrice;
	
	//하의 할인 적용한 판매가격
	private int pantsSalePrice;
	
	//하의 판매가격 * 수량 
	private int pantsTotalPrice;
	
	//신발 할인 적용한 판매가격
	private int shoesSalePrice;
	
	//신발 판매가격 * 수량 
	private int shoesTotalPrice;
	
	
	
	
	public void intiSaleTotal() {
		this.coatSalePrice = (int) (this.coatPrice * (1-this.coatDiscount));
		this.coatTotalPrice = this.coatSalePrice * this.coatCount;
	}
	
	public void pantsTotalPrice() {
		this.pantsSalePrice = (int) (this.pantsPrice * (1-this.pantsDiscount));
		this.pantsTotalPrice = this.pantsSalePrice * this.coatCount;
	}
	
	public void shoesTotalPrice() {
		this.shoesSalePrice = (int) (this.shoesPrice * (1-this.shoesDiscount));
		this.shoesTotalPrice = this.shoesSalePrice * this.shoesCount;
	}
	
}
