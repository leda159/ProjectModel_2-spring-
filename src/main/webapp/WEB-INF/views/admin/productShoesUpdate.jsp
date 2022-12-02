<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 신발 수정 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productShoesUpdate" name="productShoesUpdate" id="productShoesUpdate" method="post">
				
					<h3 style="text-align:center;">신발 수정</h3>
					
					<div class="form-group shoesId">
						<label>Number</label>
						<input type="text" name="shoesNumber " value='<c:out value="${productInfo.shoesNumber}" />'  class=" id_input form-control" readonly="readonly" >
					</div>
					<div class="form-group shoesKey">
						<label>신발 코드</label>
						<input type="text" name="shoesKey" value='<c:out value="${productInfo.shoesKey}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesName">
						<label>신발 이름</label>
						<input type="text" name="shoesName" value='<c:out value="${productInfo.shoesName}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesContents">
						<label>신발 내용</label>
						<input type="text" name="shoesContents" value='<c:out value="${productInfo.shoesContents}" />' class=" id_input form-control">
					</div>
					<div class="form-group shoesPrice">
						<label>신발 가격</label>
						<input type="text" name="shoesPrice" value='<c:out value="${productInfo.shoesPrice}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesStock">
						<label>신발 재고</label>
						<input type="text" name="shoesStock" value='<c:out value="${productInfo.shoesStock}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesDiscount">
						<!-- 할인율 값 -->
						<label>신발 할인율</label>
						<input type="hidden" id="shoesDiscount" name="shoesDiscount" value='<c:out value="${productInfo.shoesDiscount}" />'>
						<!-- 할인율 정수를 입력할 input -->
						<input id="shoesDiscount_interface" class="id_input form-control">
						<span class="step_val">할인 가격:<span class="span_discount"></span></span>
					</div>
					<input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">
				</form>
					<button class="btn btn-outline-dark ShoesUpdate_btn" id="ShoesUpdateBtn">수정</button>
					<button class="btn btn-outline-dark ShoesDelete_btn" id="ShoesDeleteBtn">삭제</button>
					<button class="btn btn-outline-dark ShoesCancel_btn" id="ShoesUpdateCancel">취소</button>
					
					
				<form id="actionForm" action="/admin/productShoesManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	
                    <input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>

<script>	

	// 할인율 인터페이스 출력 
	let shoesPriceInput = $("input[name='shoesPrice']");
	let shoesDiscountInput = $("input[name='shoesDiscount']");

	let shoesPrice = shoesPriceInput.val();
	let rawDiscountRate = shoesDiscountInput.val();
	let discountRate = rawDiscountRate * 100;


	let discountPrice = shoesPrice * (1-rawDiscountRate);
	
	
	$(".span_discount").html(discountPrice);
	$("#shoesDiscount_interface").val(discountRate);	


	$("#shoesDiscount_interface").on("propertychange change keyup paste input", function(){
	
		let userInput = $("#shoesDiscount_interface");
		let shoesDiscountInput = $("input[name='shoesDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productShoesPrice = $("input[name='shoesPrice']").val();// 원가
		let discountPrice = productShoesPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			shoesDiscountInput.val(sendDiscountRate);				
		}

	
	});	

	$("input[name='shoesPrice']").on("change", function(){
	
		let userInput = $("#shoesDiscount_interface");
		let shoesPriceInput = $("input[name='shoesDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productShoesPrice = $("input[name='shoesPrice']").val();	// 원가
		let discountPrice = productShoesPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			
			$(".span_discount").html(discountPrice);	
		}
	});	
	
	
	//수정 버튼
	$("#ShoesUpdateBtn").on("click",function(e){
	
		e.preventDefault();
		
		$("#productShoesUpdate").submit();
	});
	
	//취소 버튼
	$("#ShoesUpdateCancel").on("click",function(e){
	
		e.preventDefault();
		
		$("#actionForm").submit();
	});
	
	//삭제 버튼
	$("#ShoesDeleteBtn").on("click",function(e){
	
		e.preventDefault();
		
		let actionForm =$("#actionForm") ;
		actionForm.find("input").remove();
		actionForm.append('<input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">');
		actionForm.attr("action","/admin/productShoesDelete");
		actionForm.attr("method","post");
		actionForm.submit();
	});
</script>



















