<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	#formFile {
  		display: none;
	}	


</style>


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/admin/productPants" name="productPants" id="productPants" method="post">
				
					<h3 style="text-align:center;">하의 등록</h3>
					
					<div class="form-group pantsKey">
						<label class="mt-2">&nbsp;하의 ID</label>
						<input type="text" name="pantsKey" class=" id_input form-control" placeholder="하의 ID를 입력해 주세요.">
						<span class="ck_pants ck_pantsK">하의 ID를 입력해 주세요.</span>
					</div>
					<div class="form-group pantsName">
						<label class="mt-2">&nbsp;하의 이름</label>
						<input type="text" name="pantsName" class=" id_input form-control" placeholder="하의 이름을 입력해 주세요.">
						<span class="ck_pants ck_pantsN">하의 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsPrice">
						<label class="mt-2">&nbsp;하의 가격</label>
						<input type="text" name="pantsPrice" class=" id_input form-control" placeholder="하의 가격을 입력해 주세요.">
						<span class="ck_pants ck_pantsP">하의 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsStock">
						<label class="mt-2">&nbsp;하의 재고</label>
						<input type="text" name="pantsStock" class=" id_input form-control" placeholder="하의 재고를 입력해 주세요.">
						<span class="ck_pants ck_pantsS">하의 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group pantsContents">
						<label class="mt-2">&nbsp;하의 내용</label>
						<input type="text" name="pantsContents" class=" id_input form-control" placeholder="하의 내용을 입력해 주세요.">
						<span class="ck_pants ck_pantsC">하의 내용을 입력해 주세요.</span>
					</div>
					<div class="form-group pantsDiscount">
						<!-- 할인율 값 -->
						<label class="mt-2">&nbsp;하의 할인율</label>
						<input type="hidden" id="pantsDiscount" name="pantsDiscount" >
						<!-- 할인율 정수를 입력할 input -->
						<input id="pantsDiscount_interface" class="id_input form-control" maxlength="2" placeholder="할인율을 입력해 주세요."  >
						<span class="step_val text-secondary">&nbsp; 할인 가격 : <span class="span_discount"></span></span>
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
		
		
		//체크 변수
		
		let ck_pantsKey = false;
		let ck_pantsName = false;
		let ck_pantsPrice = false;
		let ck_pantsStock = false;
		let ck_pantsDiscount = false;
		let ck_pantsContents = false;
		
		//체크 대상 변수
		
		let pantsKey = $("input[name='pantsKey']").val();
		let pantsName = $("input[name='pantsName']").val();
		let pantsPrice = $("input[name='pantsPrice']").val();
		let pantsStock = $("input[name='pantsStock']").val();
		let pantsDiscount = $("input[name='pantsDiscount']").val();
		let pantsContents = $("input[name='pantsContents']").val();
		
		//빈칸 체크
		
		if(pantsKey){
			$(".ck_pantsK").css('display','none');
			ck_pantsKey = true;
		} else {
			$(".ck_pantsK").css('display','block');
			ck_pantsKey = false;
		}
		
		if(pantsName){
			$(".ck_pantsN").css('display','none');
			ck_pantsName = true;
		} else {
			$(".ck_pantsN").css('display','block');
			ck_pantsName = false;
		}
		
		if(pantsPrice){
			$(".ck_pantsP").css('display','none');
			ck_pantsPrice = true;
		} else {
			$(".ck_pantsP").css('display','block');
			ck_pantsPrice = false;
		}	
		
		if(pantsStock){
			$(".ck_pantsS").css('display','none');
			ck_pantsStock = true;
		} else {
			$(".ck_pantsS").css('display','block');
			ck_pantsStock = false;
		}
		
		if(pantsDiscount){
			$(".ck_pantsD").css('display','none');
			ck_pantsDiscount = true;
		} else {
			$(".ck_pantsD").css('display','block');
			ck_pantsDiscount = false;
		}	
		
		if(pantsContents){
			$(".ck_pantsC").css('display','none');
			ck_pantsContents = true;
		} else {
			$(".ck_pantsC").css('display','block');
			ck_pantsContents = false;
		}	
		
		
		if(ck_pantsKey && ck_pantsName && ck_pantsPrice && ck_pantsStock && 
		   ck_pantsDiscount && ck_pantsContents){
			
			//alert('통과');
			productPants.submit();  
			
		} else {
			return false;
		}		

	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productPantsManage"
	});
	
	//할인율 input 처리
	$("#pantsDiscount_interface").on("propertychange change keyup paste input",function(){
		
		let userInput = $("#pantsDiscount_interface");
		let discountInput = $("input[name='pantsDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productPantsPrice = $("input[name='pantsPrice']").val(); //원가
		let discountPantsPrice = productPantsPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountPantsPrice);
			discountInput.val(sendDiscountRate);
	
	});
	
	
	//상품가격 , 상품 할인율 순으로 입력을 했다가 다시 상품가격을 수정하는 경우 > 할인 가격을 바로 볼 수 있도록 처리
	$("#pantsPrice").on("change",function(){
		
		let userInput = $("#pantsDiscount_interface");
		let discountInput = $("input[name='pantsDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productPantsPrice = $("input[name='pantsPrice']").val(); //원가
		let discountPantsPrice = productPantsPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountPantsPrice);
		
	});
	
	//이미지 업로드
	$("input[type='file']").on("change",function(e){
		
		//이미지 존재시 삭제
		if($(".imgDeleteBtn").length > 0){
			
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
		str +="<input type='hidden' name='imageList[0].uuid' value='"+ obj.fileName +"'>";
		str +="<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.fileName +"'>";
		str += "</div>";		
		
		uploadResult.append(str);
			
	} 
 	
 	//이미지 삭제 버튼 동작
 	$("#uploadResult").on("click",".imgDeleteBtn", function(e){
 		
 		deleteFile();
 	});
 	
 	//파일 삭제 메서드
 	function deleteFile(){
 		
 		let targetFile = $(".imgDeleteBtn").data("file");
 		let targetDiv = $("#result_card");
 		
 		$.ajax({
 			url : '/admin/deleteFile',
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






















