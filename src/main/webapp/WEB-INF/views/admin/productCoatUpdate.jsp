<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 수정 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productCoatUpdate" name="productCoatUpdate" id="productCoatUpdate" method="post">
				
					<h3 style="text-align:center;">상의 수정</h3>
					
					<div class="form-group coatId">
						<label>Number</label>
						<input type="text" name="coatNumber" value='<c:out value="${productInfo.coatNumber}" />'  class=" id_input form-control" readonly="readonly" >
					</div>
					<div class="form-group coatKey">
						<label>상의 ID</label>
						<input type="text" name="coatKey" value='<c:out value="${productInfo.coatKey}" />'  class=" id_input form-control">
					</div>
					<div class="form-group coatName">
						<label>상의 이름</label>
						<input type="text" name="coatName" value='<c:out value="${productInfo.coatName}" />'  class=" id_input form-control">
					</div>
					<div class="form-group coatContents">
						<label>상의 내용</label>
						<input type="text" name="coatContents" value='<c:out value="${productInfo.coatContents}" />' class=" id_input form-control">
					</div>
					<div class="form-group coatPrice">
						<label>상의 가격</label>
						<input type="text" name="coatPrice" value='<c:out value="${productInfo.coatPrice}" />'  class=" id_input form-control">
					</div>
					<div class="form-group coatStock">
						<label>상의 재고</label>
						<input type="text" name="coatStock" value='<c:out value="${productInfo.coatStock}" />'  class=" id_input form-control">
					</div>
					<div class="form-group coatDiscount">
						<!-- 할인율 값 -->
						<label>상의 할인율</label>
						<input type="hidden" id="coatDiscount" name="coatDiscount" value='<c:out value="${productInfo.coatDiscount}" />'>
						<!-- 할인율 정수를 입력할 input -->
						<input id="coatDiscount_interface" class="id_input form-control">
						<span class="step_val">할인 가격:<span class="span_discount"></span></span>
					</div>
					<input type="hidden" name="coatNumber" value="${productInfo.coatNumber}">
				</form>
					<button class="btn btn-outline-dark CoatUpdate_btn" id="CoatUpdateBtn">수정</button>
					<button class="btn btn-outline-dark CoatDelete_btn" id="CoatDeleteBtn">삭제</button>
					<button class="btn btn-outline-dark CoatCancel_btn" id="CoatUpdateCancel">취소</button>
					
					
				<form id="actionForm" action="/admin/productCoatManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	
                    <input type="hidden" name="coatNumber" value="${productInfo.coatNumber}">  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>

<script>	
	// 할인율 인터페이스 출력 
	let coatPriceInput = $("input[name='coatPrice']");
	let coatDiscountInput = $("input[name='coatDiscount']");

	let coatPrice = coatPriceInput.val();
	let rawDiscountRate = coatDiscountInput.val();
	let discountRate = rawDiscountRate * 100;


	let discountPrice = coatPrice * (1-rawDiscountRate);
	
	
	$(".span_discount").html(discountPrice);
	$("#coatDiscount_interface").val(discountRate);	


	$("#coatDiscount_interface").on("propertychange change keyup paste input", function(){
	
		let userInput = $("#coatDiscount_interface");
		let coatDiscountInput = $("input[name='coatDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productCoatPrice = $("input[name='coatPrice']").val();// 원가
		let discountPrice = productCoatPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			coatDiscountInput.val(sendDiscountRate);				
		}

	
	});	

	$("input[name='coatPrice']").on("change", function(){
	
		let userInput = $("#coatDiscount_interface");
		let coatPriceInput = $("input[name='coatDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productCoatPrice = $("input[name='coatPrice']").val();	// 원가
		let discountPrice = productCoatPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			
			$(".span_discount").html(discountPrice);	
		}
	});	
	
	
	//수정 버튼
	$("#CoatUpdateBtn").on("click",function(e){
	
		e.preventDefault();
		
		$("#productCoatUpdate").submit();
	});
	
	//취소 버튼
	$("#CoatUpdateCancel").on("click",function(e){
	
		e.preventDefault();
		
		$("#actionForm").submit();
	});
	
	//삭제 버튼
	$("#CoatDeleteBtn").on("click",function(e){
	
		e.preventDefault();
		
		let actionForm =$("#actionForm") ;
		actionForm.find("input").remove();
		actionForm.append('<input type="hidden" name="coatNumber" value="${productInfo.coatNumber}">');
		actionForm.attr("action","/admin/productCoatDelete");
		actionForm.attr("method","post");
		actionForm.submit();
	});
</script>



















