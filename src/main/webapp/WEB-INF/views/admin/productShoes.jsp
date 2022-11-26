<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 신발 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productShoes" name="productShoes" id="productShoes" method="post">
				
					<h3 style="text-align:center;">신발 등록</h3>
					
					<div class="form-group shoesId">
						<input type="text" name="shoesId" class=" id_input form-control" placeholder="신발 ID" maxlength="20">
						<span class="ck_shoes ck_shoesI">신발 ID를 입력해 주세요.</span>
					</div>
					<div class="form-group shoesName">
						<input type="text" name="shoesName" class=" id_input form-control" placeholder="신발 이름" maxlength="20">
						<span class="ck_shoes ck_shoesN">신발 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesPrice">
						<input type="text" name="shoesPrice" class=" id_input form-control" placeholder="신발 가격" maxlength="20">
						<span class="ck_shoes ck_shoesP">신발 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesStock">
						<input type="text" name="shoesStock" class=" id_input form-control" placeholder="신발 재고" maxlength="20">
						<span class="ck_shoes ck_shoesS">신발 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group shoesDiscount">
						<input type="text" name="shoesDiscount" class=" id_input form-control" placeholder="신발 할인율"  maxlength="20">
						<span class="ck_shoes ck_shoesD">신발 할인율을 입력해 주세요.</span>
					</div>
					<div class="form-group shoesContents">
						<input type="text" name="shoesContents" class=" id_input form-control" placeholder="신발 내용"  maxlength="20">
						<span class="ck_shoes ck_shoesC">신발 내용을 입력해 주세요.</span>
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
		
		let ck_shoesId = false;
		let ck_shoesName = false;
		let ck_shoesPrice = false;
		let ck_shoesStock = false;
		let ck_shoesDiscount = false;
		let ck_shoesContents = false;
		
		//체크 대상 변수
		
		let shoesId = $("input[name='shoesId']").val();
		let shoesName = $("input[name='shoesName']").val();
		let shoesPrice = $("input[name='shoesPrice']").val();
		let shoesStock = $("input[name='shoesStock']").val();
		let shoesDiscount = $("input[name='shoesDiscount']").val();
		let shoesContents = $("input[name='shoesContents']").val();
		
		//빈칸 체크
		
		if(shoesId){
			$(".ck_shoesI").css('display','none');
			ck_shoesId = true;
		} else {
			$(".ck_shoesI").css('display','block');
			ck_shoesId = false;
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
		
		
		if(ck_shoesId && ck_shoesName && ck_shoesPrice && ck_shoesStock && 
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
	
	
</script>






















