<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 수정 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productPantsUpdate" name="productPantsUpdate" id="productPantsUpdate" method="post">
				
					<h3 style="text-align:center;">하의 수정</h3>
					
					<div class="form-group pantsId">
						<label>Number</label>
						<input type="text" name="pantsNumber" value='<c:out value="${productInfo.pantsNumber}" />'  class=" id_input form-control" readonly="readonly" >
					</div>
					<div class="form-group pantsKey">
						<label>하의 ID</label>
						<input type="text" name="pantsKey" value='<c:out value="${productInfo.pantsKey}" />'  class=" id_input form-control">
					</div>
					<div class="form-group pantsName">
						<label>하의 이름</label>
						<input type="text" name="pantsName" value='<c:out value="${productInfo.pantsName}" />'  class=" id_input form-control">
					</div>
					<div class="form-group pantsContents">
						<label>하의 내용</label>
						<input type="text" name="pantsContents" value='<c:out value="${productInfo.pantsContents}" />' class=" id_input form-control">
					</div>
					<div class="form-group pantsPrice">
						<label>하의 가격</label>
						<input type="text" name="pantsPrice" value='<c:out value="${productInfo.pantsPrice}" />'  class=" id_input form-control">
					</div>
					<div class="form-group pantsStock">
						<label>하의 재고</label>
						<input type="text" name="pantsStock" value='<c:out value="${productInfo.pantsStock}" />'  class=" id_input form-control">
					</div>
					<div class="form-group pantsDiscount">
						<!-- 할인율 값 -->
						<label>하의 할인율</label>
						<input type="hidden" id="pantsDiscount" name="pantsDiscount" value='<c:out value="${productInfo.pantsDiscount}" />'>
						<!-- 할인율 정수를 입력할 input -->
						<input id="pantsDiscount_interface" class="id_input form-control">
						<span class="step_val">할인 가격:<span class="span_discount"></span></span>
					</div>
					<input type="hidden" name="pantsNumber" value="${productInfo.pantsNumber}">
				</form>
					<button class="btn btn-outline-dark PantsUpdate_btn" id="PantsUpdateBtn">수정</button>
					<button class="btn btn-outline-dark PantsDelete_btn" id="PantsDeleteBtn">삭제</button>
					<button class="btn btn-outline-dark PantsCancel_btn" id="PantsUpdateCancel">취소</button>
					
					
				<form id="actionForm" action="/admin/productPantsManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	
                    <input type="hidden" name="pantsNumber" value="${productInfo.pantsNumber}">  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>

<script>	
	// 할인율 인터페이스 출력 
	let pantsPriceInput = $("input[name='pantsPrice']");
	let pantsDiscountInput = $("input[name='pantsDiscount']");

	let pantsPrice = pantsPriceInput.val();
	let rawDiscountRate = pantsDiscountInput.val();
	let discountRate = rawDiscountRate * 100;


	let discountPrice = pantsPrice * (1-rawDiscountRate);
	
	
	$(".span_discount").html(discountPrice);
	$("#pantsDiscount_interface").val(discountRate);	


	$("#pantsDiscount_interface").on("propertychange change keyup paste input", function(){
	
		let userInput = $("#pantsDiscount_interface");
		let pantsDiscountInput = $("input[name='pantsDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productPantsPrice = $("input[name='pantsPrice']").val();// 원가
		let discountPrice = productPantsPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			pantsDiscountInput.val(sendDiscountRate);				
		}

	
	});	

	$("input[name='pantsPrice']").on("change", function(){
	
		let userInput = $("#pantsDiscount_interface");
		let pantsPriceInput = $("input[name='pantsDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productPantsPrice = $("input[name='pantsPrice']").val();	// 원가
		let discountPrice = productPantsPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			
			$(".span_discount").html(discountPrice);	
		}
	});	
	
	
	//수정 버튼
	$("#PantsUpdateBtn").on("click",function(e){
	
		e.preventDefault();
		
		$("#productPantsUpdate").submit();
	});
	
	//취소 버튼
	$("#PantsUpdateCancel").on("click",function(e){
	
		e.preventDefault();
		
		$("#actionForm").submit();
	});
	
	//삭제 버튼
	$("#PantsDeleteBtn").on("click",function(e){
	
		e.preventDefault();
		
		let actionForm =$("#actionForm") ;
		actionForm.find("input").remove();
		actionForm.append('<input type="hidden" name="pantsNumber" value="${productInfo.pantsNumber}">');
		actionForm.attr("action","/admin/productPantsDelete");
		actionForm.attr("method","post");
		actionForm.submit();
	});
</script>



















