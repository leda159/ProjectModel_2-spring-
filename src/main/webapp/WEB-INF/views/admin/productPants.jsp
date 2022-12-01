<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productPants" name="productPants" id="productPants" method="post">
				
					<h3 style="text-align:center;">하의 등록</h3>
					
					<div class="form-group pantsId">
						<input type="text" name="pantsKey" class=" id_input form-control" placeholder="하의 ID" maxlength="20">
						<span class="ck_pants ck_pantsK">하의 ID를 입력해 주세요.</span>
					</div>
					<div class="form-group pantsName">
						<input type="text" name="pantsName" class=" id_input form-control" placeholder="하의 이름" maxlength="20">
						<span class="ck_pants ck_pantsN">하의 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsPrice">
						<input type="text" name="pantsPrice" class=" id_input form-control" placeholder="하의 가격" maxlength="20">
						<span class="ck_pants ck_pantsP">하의 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsStock">
						<input type="text" name="pantsStock" class=" id_input form-control" placeholder="하의 재고" maxlength="20">
						<span class="ck_pants ck_pantsS">하의 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group pantsDiscount">
						<input type="text" name="pantsDiscount" class=" id_input form-control" placeholder="하의 할인율"  maxlength="20">
						<span class="ck_pants ck_pantsD">하의 할인율을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsContents">
						<input type="text" name="pantsContents" class=" id_input form-control" placeholder="하의 내용"  maxlength="20">
						<span class="ck_pants ck_pantsC">하의 내용을 입력해 주세요.</span>
					</div>
					<input type="button" id="register_button" class="btn btn-dark" value="등록" >
					<input type="button" id="cancel_button" class="btn btn-dark" value="취소" >
				</form>
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>



<script>
	
	let productPants = $("#productPants")
	
	//등록 버튼
	$("#register_button").click(function(e){
		
		e.preventDefault();
		
		
		//체크 변수
		
		let ck_pantsId = false;
		let ck_pantsName = false;
		let ck_pantsPrice = false;
		let ck_pantsStock = false;
		let ck_pantsDiscount = false;
		let ck_pantsContents = false;
		
		//체크 대상 변수
		
		let pantsId = $("input[name='pantsId']").val();
		let pantsName = $("input[name='pantsName']").val();
		let pantsPrice = $("input[name='pantsPrice']").val();
		let pantsStock = $("input[name='pantsStock']").val();
		let pantsDiscount = $("input[name='pantsDiscount']").val();
		let pantsContents = $("input[name='pantsContents']").val();
		
		//빈칸 체크
		
		if(pantsKey){
			$(".ck_pantsK").css('display','none');
			ck_pantsKey = true;
		} else {
			$(".ck_pantsK").css('display','block');
			ck_pantsKey = false;
		}
		
		if(pantsName){
			$(".ck_pantsN").css('display','none');
			ck_pantsName = true;
		} else {
			$(".ck_pantsN").css('display','block');
			ck_pantsName = false;
		}
		
		if(pantsPrice){
			$(".ck_pantsP").css('display','none');
			ck_pantsPrice = true;
		} else {
			$(".ck_pantsP").css('display','block');
			ck_pantsPrice = false;
		}	
		
		if(pantsStock){
			$(".ck_pantsS").css('display','none');
			ck_pantsStock = true;
		} else {
			$(".ck_pantsS").css('display','block');
			ck_pantsStock = false;
		}
		
		if(pantsDiscount){
			$(".ck_pantsD").css('display','none');
			ck_pantsDiscount = true;
		} else {
			$(".ck_pantsD").css('display','block');
			ck_pantsDiscount = false;
		}	
		
		if(pantsContents){
			$(".ck_pantsC").css('display','none');
			ck_pantsContents = true;
		} else {
			$(".ck_pantsC").css('display','block');
			ck_pantsContents = false;
		}	
		
		
		if(ck_pantsKey && ck_pantsName && ck_pantsPrice && ck_pantsStock && 
		   ck_pantsDiscount && ck_pantsContents){
			
			//alert('통과');
			productPants.submit();  
			
		} else {
			return false;
		}		

	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productPantsManage"
	});
	
	
</script>






















