<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productPants" name="productPants" id="productPants" method="post">
				
					<h3 style="text-align:center;">하의 등록</h3>
					
					<div class="form-group id_wrap">
						<input type="text" name="pantsId" class=" id_input form-control" placeholder="하의 ID" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="pantsName" class=" id_input form-control" placeholder="하의 이름" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="pantsPrice" class=" id_input form-control" placeholder="하의 가격" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="pantsStock" class=" id_input form-control" placeholder="하의 재고" maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="pantsDiscount" class=" id_input form-control" placeholder="하의 할인율"  maxlength="20">
					</div>
					<div class="form-group id_wrap">
						<input type="text" name="pantsContents" class=" id_input form-control" placeholder="하의 내용"  maxlength="20">
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
		
		productPants.submit();  
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productPantsManage"
	});
	
	
</script>






















