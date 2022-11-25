<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productShoes" name="productShoes" id="productShoes" method="post">
				
					<h3 style="text-align:center;">신발 등록</h3>
					
					<div class="form-group id_wrap">
						<input type="text" name="shoesId" class=" id_input form-control" placeholder="신발 ID" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="shoesName" class=" id_input form-control" placeholder="신발 이름" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="shoesPrice" class=" id_input form-control" placeholder="신발 가격" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="shoesStock" class=" id_input form-control" placeholder="신발 재고" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="shoesDiscount" class=" id_input form-control" placeholder="신발 할인율"  maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="shoesContents" class=" id_input form-control" placeholder="신발 내용"  maxlength="20">
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
		
		productShoes.submit();  
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productShoesManage"
	});
	
	
</script>






















