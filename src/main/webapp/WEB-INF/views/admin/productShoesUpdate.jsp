<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 신발 수정 페이지 -->
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
				<form action="/admin/productShoesUpdate" name="productShoesUpdate" id="productShoesUpdate" method="post">
				
					<h3 style="text-align:center;">신발 수정</h3>
					
					<div class="form-group shoesId">
						<label>Number</label>
						<input type="text" name="shoesNumber " value='<c:out value="${productInfo.shoesNumber}" />'  class=" id_input form-control" readonly="readonly" >
					</div>
					<div class="form-group shoesKey">
						<label>신발 코드</label>
						<input type="text" name="shoesKey" value='<c:out value="${productInfo.shoesKey}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesName">
						<label>신발 이름</label>
						<input type="text" name="shoesName" value='<c:out value="${productInfo.shoesName}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesContents">
						<label>신발 내용</label>
						<input type="text" name="shoesContents" value='<c:out value="${productInfo.shoesContents}" />' class=" id_input form-control">
					</div>
					<div class="form-group shoesPrice">
						<label>신발 가격</label>
						<input type="text" name="shoesPrice" value='<c:out value="${productInfo.shoesPrice}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesStock">
						<label>신발 재고</label>
						<input type="text" name="shoesStock" value='<c:out value="${productInfo.shoesStock}" />'  class=" id_input form-control">
					</div>
					<div class="form-group shoesDiscount">
						<!-- 할인율 값 -->
						<label>신발 할인율</label>
						<input type="hidden" id="shoesDiscount" name="shoesDiscount" value='<c:out value="${productInfo.shoesDiscount}" />'>
						<!-- 할인율 정수를 입력할 input -->
						<input id="shoesDiscount_interface" class="id_input form-control">
						<span class="step_val">할인 가격:<span class="span_discount"></span></span>
					</div>
					<div class="form-group">
						<label for="formFile" style="margin-top: 20px;">
							<div class="btn-upload">이미지 등록</div>
						</label>
						<input type="file" id="formFile" name="uploadFile">
						<div id="uploadResult"></div>	
					</div>							
					<input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">
				</form>
					<button class="btn btn-outline-dark ShoesUpdate_btn" id="ShoesUpdateBtn">수정</button>
					<button class="btn btn-outline-dark ShoesDelete_btn" id="ShoesDeleteBtn">삭제</button>
					<button class="btn btn-outline-dark ShoesCancel_btn" id="ShoesUpdateCancel">취소</button>
					
					
				<form id="actionForm" action="/admin/productShoesManage" method="get">
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="keyword" value="${cri.keyword}">	
                    <input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">  
                </form>  
			</div>
		</div>
	</div>
<%@ include file="../adminIncludes/footer.jsp" %>

<script>	
$(document).ready(function(){
	
	// 할인율 인터페이스 출력 
	let shoesPriceInput = $("input[name='shoesPrice']");
	let shoesDiscountInput = $("input[name='shoesDiscount']");

	let shoesPrice = shoesPriceInput.val();
	let rawDiscountRate = shoesDiscountInput.val();
	let discountRate = rawDiscountRate * 100;


	let discountPrice = shoesPrice * (1-rawDiscountRate);
	
	
	$(".span_discount").html(discountPrice);
	$("#shoesDiscount_interface").val(discountRate);	

	//이미지 정보 호출
	let shoesNumber = '<c:out value="${productInfo.shoesNumber}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/getAttachShoesList", {shoesNumber : shoesNumber}, function(arr){
		
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
		if($("#result_card").length > 0){
			
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
	
	
});
	
	
	
	$("#shoesDiscount_interface").on("propertychange change keyup paste input", function(){
	
		let userInput = $("#shoesDiscount_interface");
		let shoesDiscountInput = $("input[name='shoesDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productShoesPrice = $("input[name='shoesPrice']").val();// 원가
		let discountPrice = productShoesPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			shoesDiscountInput.val(sendDiscountRate);				
		}

	
	});	

	$("input[name='shoesPrice']").on("change", function(){
	
		let userInput = $("#shoesDiscount_interface");
		let shoesPriceInput = $("input[name='shoesDiscount']");
	
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let productShoesPrice = $("input[name='shoesPrice']").val();	// 원가
		let discountPrice = productShoesPrice * (1 - sendDiscountRate);// 할인가격
	
		if(!isNaN(discountRate)){
			
			$(".span_discount").html(discountPrice);	
		}
	});	
	
	
	//수정 버튼
	$("#ShoesUpdateBtn").on("click",function(e){
	
		e.preventDefault();
		
		$("#productShoesUpdate").submit();
	});
	
	//취소 버튼
	$("#ShoesUpdateCancel").on("click",function(e){
	
		e.preventDefault();
		
		$("#actionForm").submit();
	});
	
	//삭제 버튼
	$("#ShoesDeleteBtn").on("click",function(e){
	
		e.preventDefault();
		
		let actionForm =$("#actionForm") ;
		actionForm.find("input").remove();
		actionForm.append('<input type="hidden" name="shoesNumber" value="${productInfo.shoesNumber}">');
		actionForm.attr("action","/admin/productShoesDelete");
		actionForm.attr("method","post");
		actionForm.submit();
	});

 	//이미지 삭제 버튼 동작
 	$("#uploadResult").on("click",".imgDeleteBtn", function(e){
 		
 		deleteFile();
 	});
 	
 	//파일 삭제 메서드
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}	
</script>



















