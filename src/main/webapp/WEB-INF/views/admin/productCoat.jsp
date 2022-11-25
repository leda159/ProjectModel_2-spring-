<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productCoat" name="productCoat" id="productCoat" method="post">
				
					<h3 style="text-align:center;">상의 등록</h3>
					
					<div class="form-group id_wrap">
						<input type="text" name="coatId" class=" id_input form-control" placeholder="상의 ID" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="coatName" class=" id_input form-control" placeholder="상의 이름" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="coatPrice" class=" id_input form-control" placeholder="상의 가격" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="coatStock" class=" id_input form-control" placeholder="상의 재고" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="coatDiscount" class=" id_input form-control" placeholder="상의 할인율"  maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="coatContents" class=" id_input form-control" placeholder="상의 내용"  maxlength="20">
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
		
		productCoat.submit();  
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productCoatManage"
	});
	
	
</script>






















