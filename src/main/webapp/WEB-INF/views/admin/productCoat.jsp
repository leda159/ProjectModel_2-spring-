<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productCoat" name="productCoat" id="productCoat" method="post">
				
					<h3 style="text-align:center;">상의 등록</h3>
					
					<div class="form-group coatId">
						<input type="text" name="coatId" class=" id_input form-control" placeholder="상의 ID" maxlength="20">
						<span class="ck_coat ck_coatI">상의 ID를 입력해 주세요.</span>
					</div>
					<div class="form-group coatName">
						<input type="text" name="coatName" class=" id_input form-control" placeholder="상의 이름" maxlength="20">
						<span class="ck_coat ck_coatN">상의 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group coatPrice">
						<input type="text" name="coatPrice" class=" id_input form-control" placeholder="상의 가격" maxlength="20">
						<span class="ck_coat ck_coatP">상의 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group coatStock">
						<input type="text" name="coatStock" class=" id_input form-control" placeholder="상의 재고" maxlength="20">
						<span class="ck_coat ck_coatS">상의 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group coatDiscount">
						<input type="text" name="coatDiscount" class=" id_input form-control" placeholder="상의 할인율"  maxlength="20">
						<span class="ck_coat ck_coatD">상의 할인율을 입력해 주세요.</span>
					</div>
					<div class="form-group coatContents">
						<input type="text" name="coatContents" class=" id_input form-control" placeholder="상의 내용"  maxlength="20">
						<span class="ck_coat ck_coatC">상의 내용을 입력해 주세요.</span>
					</div>
					<input type="button" id="register_button" class="btn btn-dark" value="등록" >
					<input type="button" id="cancel_button" class="btn btn-dark" value="취소" >
				</form>
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>



<script>
	
	let productCoat = $("#productCoat")
	
	//등록 버튼
	$("#register_button").click(function(e){
		
		e.preventDefault();
		 
		//체크 변수
		
		let ck_coatId = false;
		let ck_coatName = false;
		let ck_coatPrice = false;
		let ck_coatStock = false;
		let ck_coatDiscount = false;
		let ck_coatContents = false;
		
		//체크 대상 변수
		
		let coatId = $("input[name='coatId']").val();
		let coatName = $("input[name='coatName']").val();
		let coatPrice = $("input[name='coatPrice']").val();
		let coatStock = $("input[name='coatStock']").val();
		let coatDiscount = $("input[name='coatDiscount']").val();
		let coatContents = $("input[name='coatContents']").val();
		
		//빈칸 체크
		
		if(coatId){
			$(".ck_coatI").css('display','none');
			ck_coatId = true;
		} else {
			$(".ck_coatI").css('display','block');
			ck_coatId = false;
		}
		
		if(coatName){
			$(".ck_coatN").css('display','none');
			ck_coatName = true;
		} else {
			$(".ck_coatN").css('display','block');
			ck_coatName = false;
		}
		
		if(coatPrice){
			$(".ck_coatP").css('display','none');
			ck_coatPrice = true;
		} else {
			$(".ck_coatP").css('display','block');
			ck_coatPrice = false;
		}	
		
		if(coatStock){
			$(".ck_coatS").css('display','none');
			ck_coatStock = true;
		} else {
			$(".ck_coatS").css('display','block');
			ck_coatStock = false;
		}
		
		if(coatDiscount){
			$(".ck_coatD").css('display','none');
			ck_coatDiscount = true;
		} else {
			$(".ck_coatD").css('display','block');
			ck_coatDiscount = false;
		}	
		
		if(coatContents){
			$(".ck_coatC").css('display','none');
			ck_coatContents = true;
		} else {
			$(".ck_coatC").css('display','block');
			ck_coatContents = false;
		}	
		
		
		if(ck_coatId && ck_coatName && ck_coatPrice && ck_coatStock && 
		   ck_coatDiscount && ck_coatContents){
			
			//alert('통과');
			productCoat.submit(); 
			
		} else {
			return false;
		}
		
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productCoatManage"
	});
	
	
	
</script>






















