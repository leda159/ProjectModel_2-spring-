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
						<label>상의 ID</label>
						<input type="text" name="coatId" value='<c:out value="${productInfo.coatId}" />'  class=" id_input form-control" >
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
					<input type="hidden" name="coatId" value="${productInfo.coatId}">
				</form>
					<button class="btn btn-outline-dark CoatUpdate_btn" id="CoatUpdateBtn">수정</button>
					<button class="btn btn-outline-dark CoatCancel_btn" id="CoatUpdateCancel">취소</button>
					
					
				<form id="actionForm" action="/admin/productCoatManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	
                    <input type="hidden" name="coatId" value="${productInfo.coatId}">  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>

