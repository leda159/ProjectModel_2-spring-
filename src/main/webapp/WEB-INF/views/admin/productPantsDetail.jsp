<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 조회 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<h3 style="text-align:center;">하의 조회</h3>
					<div class="form-group pantsNumber">
						<label>하의 number</label>
						<input type="text" name="pantsNumber" value='<c:out value="${productInfo.pantsNumber}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsKey">
						<label>하의 코드</label>
						<input type="text" name="pantsKey" value='<c:out value="${productInfo.pantsKey}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsName">
						<label>하의 이름</label>
						<input type="text" name="pantsName" value='<c:out value="${productInfo.pantsName}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsContents">
						<label>하의 내용</label>
						<input type="text" name="pantsContents" value='<c:out value="${productInfo.pantsContents}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsPrice">
						<label>하의 가격</label>
						<input type="text" name="pantsPrice" value='<c:out value="${productInfo.pantsPrice}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsStock">
						<label>하의 재고</label>
						<input type="text" name="pantsStock" value='<c:out value="${productInfo.pantsStock}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group pantsDiscount">
						<label>하의 할인율</label>
						<input type="text" id="pants_Discount" name="pantsDiscount" class=" id_input form-control" readonly>
					</div>
					<div class="form-group">
						<label>하의 등록일</label> 
						<input type="text" name="regDate" class="form-control" value='<fmt:formatDate value="${productInfo.regDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					<div class="form-group">
						<label>하의 수정일</label>
						<input type="text" name="updateDate" class="form-control" value='<fmt:formatDate value="${productInfo.updateDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					 <button class="btn btn-outline-dark PantsUpdate_btn" id="PantsUpdateBtn">수정</button>
					 <button class="btn btn-outline-dark PantsList_btn" id="PantsListBtn">상의 목록</button>
					                
				<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
                <form id="actionForm" action="/admin/productPantsManage" method="get">
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
	let pantsDiscount = '<c:out value="${productInfo.pantsDiscount}"/>' * 100;
	$("#pants_Discount").attr("value", pantsDiscount + " %");
	
	
	//목록 이동 버튼
	$("#PantsListBtn").on("click", function(e){
		
		e.preventDefault();
		$("#actionForm").submit();
	});
	
	//수정 페이지 이동 버튼 
	$("#PantsUpdateBtn").on("click" ,function(e){
		
		e.preventDefault();
		
		let addInput = '<input type="hidden" name="pantsNumber" value="${productInfo.pantsNumber}">';
		$("#actionForm").append(addInput);
		$("#actionForm").attr("action" , "/admin/productPantsUpdate");
		$("#actionForm").submit();
	});	
});	
</script>






















