<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 신발 조회 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<h3 style="text-align:center;">신발 조회</h3>
					<div class="form-group shoesNumber">
						<label>신발 number</label>
						<input type="text" name="shoesNumber" value='<c:out value="${productInfo.shoesNumber}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesKey">
						<label>신발 코드</label>
						<input type="text" name="shoesKey" value='<c:out value="${productInfo.shoesKey}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesName">
						<label>신발 이름</label>
						<input type="text" name="shoesName" value='<c:out value="${productInfo.shoesName}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesContents">
						<label>신발 내용</label>
						<input type="text" name="shoesContents" value='<c:out value="${productInfo.shoesContents}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesPrice">
						<label>신발 가격</label>
						<input type="text" name="shoesPrice" value='<c:out value="${productInfo.shoesPrice}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesStock">
						<label>신발 재고</label>
						<input type="text" name="shoesStock" value='<c:out value="${productInfo.shoesStock}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group shoesDiscount">
						<label>신발 할인율</label>
						<input type="text" id="shoes_Discount" name="shoesDiscount" class=" id_input form-control" readonly>
					</div>
					<div class="form-group">
						<label>신발 등록일</label> 
						<input type="text" name="regDate" class="form-control" value='<fmt:formatDate value="${productInfo.regDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					<div class="form-group">
						<label>신발 수정일</label>
						<input type="text" name="updateDate" class="form-control" value='<fmt:formatDate value="${productInfo.updateDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					 <button class="btn btn-outline-dark ShoesUpdate_btn" id="ShoesUpdateBtn">수정</button>
					 <button class="btn btn-outline-dark ShoesList_btn" id="ShoesListBtn">신발 목록</button>
					                
				<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
                <form id="actionForm" action="/admin/productShoesManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>


<script>
$(document).ready(function(){
		
	//할인율 값 삽입
	let shoesDiscount = '<c:out value="${productInfo.shoesDiscount}"/>' * 100;
	$("#shoes_Discount").attr("value", shoesDiscount + " %");
	
	
	//목록 이동 버튼
	$("#ShoesListBtn").on("click", function(e){
		
		e.preventDefault();
		$("#actionForm").submit();
	});
	
	//수정 페이지 이동 버튼 
	$("#ShoesUpdateBtn").on("click" ,function(e){
		
		e.preventDefault();
		
		let addInput = '<input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">';
		$("#actionForm").append(addInput);
		$("#actionForm").attr("action" , "/admin/productShoesUpdate");
		$("#actionForm").submit();
	});	
});	
</script>






















