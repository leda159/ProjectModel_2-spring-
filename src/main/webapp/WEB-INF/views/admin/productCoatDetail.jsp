<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../adminIncludes/header.jsp" %>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
<!-- 상의 조회 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<h3 style="text-align:center;">상의 조회</h3>
					<div class="form-group coatNumber">
						<label>상의 number</label>
						<input type="text" name="coatNumber" value='<c:out value="${productInfo.coatNumber}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatKey">
						<label>상의 코드</label>
						<input type="text" name="coatKey" value='<c:out value="${productInfo.coatKey}" />' class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatName">
						<label>상의 이름</label>
						<input type="text" name="coatName" value='<c:out value="${productInfo.coatName}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatContents">
						<label>상의 내용</label>
						<input type="text" name="coatContents" value='<c:out value="${productInfo.coatContents}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatPrice">
						<label>상의 가격</label>
						<input type="text" name="coatPrice" value='<c:out value="${productInfo.coatPrice}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatStock">
						<label>상의 재고</label>
						<input type="text" name="coatStock" value='<c:out value="${productInfo.coatStock}" />'  class=" id_input form-control" readonly>
					</div>
					<div class="form-group coatDiscount">
						<label>상의 할인율</label>
						<input type="text" id="coat_Discount" name="coatDiscount" class=" id_input form-control" readonly>
					</div>
					<div class="form-group">
						<label>상의 등록일</label> 
						<input type="text" name="regDate" class="form-control" value='<fmt:formatDate value="${productInfo.regDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					<div class="form-group">
						<label>상의 수정일</label>
						<input type="text" name="updateDate" class="form-control" value='<fmt:formatDate value="${productInfo.updateDate}" pattern="yyyy-MM-dd" />' readonly>
					</div>
					<div class="form-group">
						<label>상의 이미지</label>
						<div class="form_section_content">
							<div id="uploadResult"></div>
						</div>
					</div>
					 <button class="btn btn-outline-dark CoatUpdate_btn" id="CoatUpdateBtn">수정</button>
					 <button class="btn btn-outline-dark CoatList_btn" id="CoatListBtn">상의 목록</button>
					                
				<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
                <form id="actionForm" action="/admin/productCoatManage" method="get">
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
	let coatDiscount = '<c:out value="${productInfo.coatDiscount}"/>' * 100;
	$("#coat_Discount").attr("value", coatDiscount + " %");
	
	//이미지 정보 호출
	let coatNumber = '<c:out value="${productInfo.coatNumber}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/getAttachList", {coatNumber : coatNumber}, function(arr){
		
		//이미지가 없는 경우
		if(arr.length === 0){
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/images/No_Image.png'>";
			str += "</div>";
			
			uploadResult.html(str);				
			
			return;
		}
		
		let str = "";
		let obj = arr[0];
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "</div>";		
		
		uploadResult.html(str);
	});
});	//$(document).ready


//목록 이동 버튼
$("#CoatListBtn").on("click", function(e){
	
	e.preventDefault();
	$("#actionForm").submit();
});

//수정 페이지 이동 버튼 
$("#CoatUpdateBtn").on("click" ,function(e){
	
	e.preventDefault();
	
	let addInput = '<input type="hidden" name="coatNumber" value="${productInfo.coatNumber}">';
	$("#actionForm").append(addInput);
	$("#actionForm").attr("action" , "/admin/productCoatUpdate");
	$("#actionForm").submit();
});	
</script>






















