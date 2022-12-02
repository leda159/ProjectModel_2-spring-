<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 5%;
	    right: 5%;
	    
	    background-color: black;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
	.btn-upload {
  		width: 150px;
  		height: 30px;
 		background: #fff;
  		border: 1px solid rgb(77,77,77);
  		border-radius: 10px;
  		font-weight: 500;
  		cursor: pointer;
  		display: flex;
  		align-items: center;
 		justify-content: center;
	}

	#formFile {
  		display: none;
	}	


</style>


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productShoes" name="productShoes" id="productShoes" method="post">
				
					<h3 style="text-align:center;">신발 등록</h3>
					
					<div class="form-group shoesKey">
						<label class="mt-2">&nbsp;신발 코드</label>
						<input type="text" name="shoesKey" class=" id_input form-control" placeholder="신발 코드를 입력해 주세요.">
						<span class="ck_shoes ck_shoesK">신발 코드를 입력해 주세요.</span>
					</div>
					<div class="form-group shoesName">
						<label class="mt-2">&nbsp;신발 이름</label>
						<input type="text" name="shoesName" class=" id_input form-control" placeholder="신발 이름을 입력해 주세요.">
						<span class="ck_shoes ck_shoesN">신발 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesContents">
						<label class="mt-2">&nbsp;신발 내용</label>
						<input type="text" name="shoesContents" class=" id_input form-control" placeholder="신발 내용을 입력해 주세요">
						<span class="ck_shoes ck_shoesC">신발 내용을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesPrice">
						<label class="mt-2">&nbsp;신발 가격</label>
						<input type="text" name="shoesPrice" class=" id_input form-control" placeholder="신발 가격을 입력해 주세요.">
						<span class="ck_shoes ck_shoesP">신발 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesStock">
						<label class="mt-2">&nbsp;신발 재고</label>
						<input type="text" name="shoesStock" class=" id_input form-control" placeholder="신발 재고를 입력해 주세요.">
						<span class="ck_shoes ck_shoesS">신발 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group shoesDiscount">
						<label class="mt-2">&nbsp;신발 할인율</label>
						<input type="hidden" name="shoesDiscount" class=" id_input form-control">
						<input id="shoesDiscount_interface" class="id_input form-control" maxlength="2" placeholder="할인율을 입력해 주세요."  >
						<span class="step_val text-secondary">&nbsp; 할인 가격 : <span class="span_discount"></span></span>
					</div>
					<input type="button" id="register_button" class="btn btn-dark" value="등록" >
					<input type="button" id="cancel_button" class="btn btn-dark" value="취소" >
				</form>
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>



<script>
	
	let productShoes = $("#productShoes")
	
	//등록 버튼
	$("#register_button").click(function(e){
		
		e.preventDefault();
		
		//체크 변수
		
		let ck_shoesKey = false;
		let ck_shoesName = false;
		let ck_shoesPrice = false;
		let ck_shoesStock = false;
		let ck_shoesDiscount = false;
		let ck_shoesContents = false;
		
		//체크 대상 변수
		
		let shoesKey = $("input[name='shoesKey']").val();
		let shoesName = $("input[name='shoesName']").val();
		let shoesPrice = $("input[name='shoesPrice']").val();
		let shoesStock = $("input[name='shoesStock']").val();
		let shoesDiscount = $("input[name='shoesDiscount']").val();
		let shoesContents = $("input[name='shoesContents']").val();
		
		//빈칸 체크
		
		if(shoesKey){
			$(".ck_shoesK").css('display','none');
			ck_shoesKey = true;
		} else {
			$(".ck_shoesK").css('display','block');
			ck_shoesKey = false;
		}
		
		if(shoesName){
			$(".ck_shoesN").css('display','none');
			ck_shoesName = true;
		} else {
			$(".ck_shoesN").css('display','block');
			ck_shoesName = false;
		}
		
		if(shoesPrice){
			$(".ck_shoesP").css('display','none');
			ck_shoesPrice = true;
		} else {
			$(".ck_shoesP").css('display','block');
			ck_shoesPrice = false;
		}	
		
		if(shoesStock){
			$(".ck_shoesS").css('display','none');
			ck_shoesStock = true;
		} else {
			$(".ck_shoesS").css('display','block');
			ck_shoesStock = false;
		}
		
		if(shoesDiscount){
			$(".ck_shoesD").css('display','none');
			ck_shoesDiscount = true;
		} else {
			$(".ck_shoesD").css('display','block');
			ck_shoesDiscount = false;
		}	
		
		if(shoesContents){
			$(".ck_shoesC").css('display','none');
			ck_shoesContents = true;
		} else {
			$(".ck_shoesC").css('display','block');
			ck_shoesContents = false;
		}	
		
		
		if(ck_shoesKey && ck_shoesName && ck_shoesPrice && ck_shoesStock && 
		   ck_shoesDiscount && ck_shoesContents){
			
			//alert('통과');
			productShoes.submit();   
			
		} else {
			return false;
		}		 
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productShoesManage"
	});
	
	//할인율 input 처리
	$("#shoesDiscount_interface").on("propertychange change keyup paste input",function(){
		
		let userInput = $("#shoesDiscount_interface");
		let discountInput = $("input[name='shoesDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productShoesPrice = $("input[name='shoesPrice']").val(); //원가
		let discountShoesPrice = productShoesPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountShoesPrice);
			discountInput.val(sendDiscountRate);
	
	});
	
	
	//상품가격 , 상품 할인율 순으로 입력을 했다가 다시 상품가격을 수정하는 경우 > 할인 가격을 바로 볼 수 있도록 처리
	$("#shoesPrice").on("change",function(){
		
		let userInput = $("#shoesDiscount_interface");
		let discountInput = $("input[name='shoesDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productShoesPrice = $("input[name='shoesPrice']").val(); //원가
		let discountShoesPrice = productShoesPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountShoesPrice);
		
	});
	
</script>






















