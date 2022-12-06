<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 수정 페이지 -->
<style>
	.btn-upload {
  		width: 150px;
  		height: 30px;
 		background: #fff;
  		border: 1px solid rgb(77,77,77);
  		border-radius: 10px;
  		font-weight: 500;
  		cursor: pointer;
  		display: flex;
  		align-items: center;
 		justify-content: center;
	}
	
	/* 상의 이미지 */
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 5%;
	    right: 5%;
	    
	    background-color: black;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	#formFile {
  		display: none;
	}		
</style>

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
						<label>상의 코드</label>
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
					<div class="form-group">
						<label for="formFile" style="margin-top: 20px;">
							<div class="btn-upload">이미지 등록</div>
						</label>
						<input type="file" id="formFile" name="uploadFile">
						<div id="uploadResult"></div>	
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
$(document).ready(function(){
	
	// 할인율 인터페이스 출력 
	let coatPriceInput = $("input[name='coatPrice']");
	let coatDiscountInput = $("input[name='coatDiscount']");

	let coatPrice = coatPriceInput.val();
	let rawDiscountRate = coatDiscountInput.val();
	let discountRate = rawDiscountRate * 100;


	let discountPrice = coatPrice * (1-rawDiscountRate);
	
	
	$(".span_discount").html(discountPrice);
	$("#coatDiscount_interface").val(discountRate);	

	
	//이미지 정보 호출
	let coatNumber = '<c:out value="${productInfo.coatNumber}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/getAttachCoatList", {coatNumber : coatNumber}, function(arr){
		
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
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";			
		str += "</div>";		
		
		uploadResult.html(str);
		
	});	//getJSON
	
	//이미지 업로드
	$("input[type='file']").on("change",function(e){
		
		//이미지 존재시 삭제
		if($(".result_card").length > 0){
			
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		//input태그에 multiple 있는 경우
		
		//for(let i=0; i<fileList.length; i++){
		//	formData.append("uploadFile", fileList[i])
		//}
		
		$.ajax({
			url:'/admin/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				console.log(result);
			showUploadImage(result);
			},
			error : function(result){
				alert("이미지 파일이 아닙니다.");
			}
		});
	}); 
	
	//파일 업로드 유효성 검사
	let regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
	let maxSize = 1048576; //1MB
	
	function fileCheck(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
 	//이미지 출력
	function showUploadImage(uploadResultArr){
		
		//전달받은 데이터 검증
		if(!uploadResultArr || uploadResultArr.length == 0){
			return
		}
		
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName="+ fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='"+ fileCallPath +"'>x</div>";
		str +="<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str +="<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str +="<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";		
		
		uploadResult.append(str);
			
	} 	
	
	
});//$(document).ready


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
	
 	//이미지 삭제 버튼 동작
 	$("#uploadResult").on("click",".imgDeleteBtn", function(e){
 		
 		deleteFile();
 	});
 	
 	//파일 삭제 메서드
 	function deleteFile(){
 		
 		$("#result_card").remove();
 		
 	}	
</script>



















