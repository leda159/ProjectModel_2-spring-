<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../includes/header.jsp" %>

<style>
.content_top{
	width: 100%;
	height: 400px;  	
}

.content_top:after {
	content: "";
	clear: both;
	display: table;
}   
 	
.ct_left_area{
	float: left;
	width: 30%;
	height: 100%;
}

.ct_right_area{
	float: left;
	width: 70%;
	height: 100%;
}


.image_wrap{
	height: 80%;
	width: 80%;
	margin: auto;
	top: 10%;
	position: relative;  		
}

.image_wrap img{
	max-width: 100%;
	height: auto;
	display: block;  		
}

.line{
	width: 100%;
	border-top:1px solid #c6c6cf;  		
}

.title{
	height: 20%;
	font-size: 17px;
	padding-left: 1%;
	margin-top: 10px;
 }
 


.price{
	line-height: 30px;
	padding: 2% 0 2% 3%;  		
}

.discount_price_number{
	line-height: 30px;
	font-size: 22px;
	color: #f84450;
	font-weight: bold;  			
}

.button{
	padding: 2% 2% 2% 3%;
}

.button_quantity{
	margin-bottom: 2%;
  				}
  				
.button_quantity input{
	height: 26px;
	width: 40px;
	text-align: center;
	font-weight: bold;  			
}

.button_quantity button{
	border: 1px solid #aaa;
	color: #3a60df;
	width: 20px;
	height: 20px;
	padding: 2px;
	background-color: #fff;
	font-weight: bold;
	font-size: 15px;
	line-height: 15px;
		  	  	
}

.btn_cart{
	display: inline-block;
	width: 140px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	background-color: #5e6b9f;
	border: 1px solid #5e6b9f;
	color: #fff;
	margin-right: 2px;  	  		
}

.btn_buy{
	display: inline-block;
	width: 140px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	background-color: #7b8ed1;
	border: 1px solid #7b8ed1;
	color: #fff;			  	  		
}

.product_content{
	width: 80%;
	margin-left:17px;	
	margin-top: 10px;
	margin-bottom: 10px;
}
  	
.content_bottom{
	width: 100%;
	min-height: 200px;
	 	
}

</style>
			
	<div class="content_top">
		<div class="ct_left_area">
			<div class="image_wrap" data-coatNumber ="${productCoatInfo.imageList[0].coatNumber}" data-path="${productCoatInfo.imageList[0].uploadPath}" data-uuid="${productCoatInfo.imageList[0].uuid}" data-filename="${productCoatInfo.imageList[0].fileName}">
				<img>
			</div>				
		</div>
		<div class="ct_right_area">
			<div class="title">
				<h1>
					${productCoatInfo.coatName}
				</h1>
			</div>
			<div class="line"></div>	
			<div class="price">
				<div class="sale_price">정가 : <fmt:formatNumber value="${productCoatInfo.coatPrice}" pattern="#,### 원" />
				</div>
				<div class="discount_price">
					판매가 : <span class="discount_price_number"><fmt:formatNumber value="${productCoatInfo.coatPrice - (productCoatInfo.coatPrice*productCoatInfo.coatDiscount)}" pattern="#,### 원" /></span> 
						[ <fmt:formatNumber value="${productCoatInfo.coatDiscount*100}" pattern="###" />%
				 		 &nbsp;<fmt:formatNumber value="${productCoatInfo.coatPrice*productCoatInfo.coatDiscount}" pattern="#,### 원" /> 할인]
				</div>							
			</div>			
			<div class="product_content">
				상품내용 : ${productCoatInfo.coatContents }
			</div>			
			<div class="line"></div>	
			<div class="button">						
				<div class="button_quantity">
							주문수량
					<input type="text" value="1">
						<span>
							<button>+</button>
							<button>-</button>
						</span>
				</div>
				<div class="button_set">
					<a class="btn_cart">장바구니 담기</a>
					<a class="btn_buy">바로구매</a>
				</div>
			</div>
		</div>
	</div>
	<div class="line"></div>				
	<div class="content_bottom">
		리뷰
	</div>

<%@ include file="../includes/footer.jsp" %>

<script>
$(document).ready(function(){
	//이미지 삽입 
	$(".image_wrap").each(function(i, obj){
		
		const cobj = $(obj);
		
		if(cobj.data("uuid")){
			const uploadPath = cobj.data("path");
			const uuid = cobj.data("uuid");
			const fileName = cobj.data("filename");	
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			cobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/images/No_Image.png');
		}
	});
});	
</script>


