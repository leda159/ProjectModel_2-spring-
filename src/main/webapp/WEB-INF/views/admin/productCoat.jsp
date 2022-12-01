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
<!-- 상의 등록 페이지 -->


<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:10px;">
				<form action="/admin/productCoat" name="productCoat" id="productCoat" method="post">
				
					<h3 style="text-align:center;">상의 등록</h3>
					
					<div class="form-group mt-2 coatId">
						<label class="">&nbsp;상의 ID</label>
						<input type="text" name="coatId" class=" id_input form-control" placeholder="상의 ID를 입력해 주세요.">
						<span class="ck_coat ck_coatI">상의 ID를 입력해 주세요.</span>
					</div>
					<div class="form-group coatName">
						<label class="mt-2">&nbsp;상의 이름</label>
						<input type="text" name="coatName" class=" id_input form-control" placeholder="상의 이름을 입력해 주세요.">
						<span class="ck_coat ck_coatN">상의 이름을 입력해 주세요.</span>
					</div>
					<div class="form-group coatContents">
						<label class="mt-2">&nbsp;상의 내용</label>
						<input type="text" name="coatContents" class=" id_input form-control" placeholder="상의 내용을 입력해 주세요.">
						<span class="ck_coat ck_coatC">상의 내용을 입력해 주세요.</span>
					</div>
					<div class="form-group coatPrice">
						<label class="mt-2">&nbsp;상의 가격</label>
						<input type="text" name="coatPrice" class=" id_input form-control" placeholder="상의 가격을 입력해 주세요.">
						<span class="ck_coat ck_coatP">상의 가격을 입력해 주세요.</span>
					</div>
					<div class="form-group coatStock">
						<label class="mt-2">&nbsp;상의 재고</label>
						<input type="text" name="coatStock" class=" id_input form-control" placeholder="상의 재고를 입력해 주세요.">
						<span class="ck_coat ck_coatS">상의 재고를 입력해 주세요.</span>
					</div>
					<div class="form-group coatDiscount">
						<!-- 할인율 값 -->
						<label class="mt-2">&nbsp;상의 할인율</label>
						<input type="hidden" id="coatDiscount" name="coatDiscount" >
						<!-- 할인율 정수를 입력할 input -->
						<input id="coatDiscount_interface" class="id_input form-control" maxlength="2" placeholder="할인율을 입력해 주세요."  >
						<span class="step_val text-secondary">&nbsp; 할인 가격 : <span class="span_discount"></span></span>
					</div>
					
						<label for="formFile" style="margin-top: 20px;">
							<div class="btn-upload">이미지 등록</div>
						</label>
						<input type="file" id="formFile" name="uploadFile">
						
					<div class="filebox" id="uploadResult">
				  <!-- <div id="result_card">
							<div class="imgDeleteBtn">x</div>
							<img src="/display?fileName=test.jpg">
						</div> -->
					</div> 
					
					
					<input type="button" id="register_button" class="btn btn-dark mt-3" value="등록" >
					<input type="button" id="cancel_button" class="btn btn-dark mt-3 ml-2" value="취소" >
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
		 
		//체크 변수
		
		let ck_coatId = false;
		let ck_coatName = false;
		let ck_coatPrice = false;
		let ck_coatStock = false;
		let ck_coatDiscount = false;
		let ck_coatContents = false;
		
		//체크 대상 변수
		
		let coatId = $("input[name='coatId']").val();
		let coatName = $("input[name='coatName']").val();
		let coatPrice = $("input[name='coatPrice']").val();
		let coatStock = $("input[name='coatStock']").val();
		let coatDiscount = $("coatDiscount_interface").val();
		let coatContents = $("input[name='coatContents']").val();
		
		//빈칸 체크
		
		if(coatId){
			$(".ck_coatI").css('display','none');
			ck_coatId = true;
		} else {
			$(".ck_coatI").css('display','block');
			ck_coatId = false;
		}
		
		if(coatName){
			$(".ck_coatN").css('display','none');
			ck_coatName = true;
		} else {
			$(".ck_coatN").css('display','block');
			ck_coatName = false;
		}
		
		if(coatPrice){
			$(".ck_coatP").css('display','none');
			ck_coatPrice = true;
		} else {
			$(".ck_coatP").css('display','block');
			ck_coatPrice = false;
		}	
		
		if(coatStock){
			$(".ck_coatS").css('display','none');
			ck_coatStock = true;
		} else {
			$(".ck_coatS").css('display','block');
			ck_coatStock = false;
		}
		
		
		if(coatContents){
			$(".ck_coatC").css('display','none');
			ck_coatContents = true;
		} else {
			$(".ck_coatC").css('display','block');
			ck_coatContents = false;
		}	
		
		
		if(ck_coatId && ck_coatName && ck_coatPrice && ck_coatStock && ck_coatContents){
			
			//alert('통과');
			productCoat.submit(); 
			
		} else {
			return false;
		}
		
	});

	
	//취소 버튼
	$("#cancel_button").click(function(){
		
		location.href="/admin/productCoatManage"
	});
	
	
	//할인율 input 처리
	$("#coatDiscount_interface").on("propertychange change keyup paste input",function(){
		
		let userInput = $("#coatDiscount_interface");
		let discountInput = $("input[name='coatDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productCoatPrice = $("input[name='coatPrice']").val(); //원가
		let discountCoatPrice = productCoatPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountCoatPrice);
			discountInput.val(sendDiscountRate);
	
	});
	
	
	//상품가격 , 상품 할인율 순으로 입력을 했다가 다시 상품가격을 수정하는 경우 > 할인 가격을 바로 볼 수 있도록 처리
	$("#coatPrice").on("change",function(){
		
		let userInput = $("#coatDiscount_interface");
		let discountInput = $("input[name='coatDiscount']");
		
		let discountRate = userInput.val();     //사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;// 서버에 전송할 할인값
		
		let productCoatPrice = $("input[name='coatPrice']").val(); //원가
		let discountCoatPrice = productCoatPrice * (1 - sendDiscountRate); //할인가격
		
		
			$(".span_discount").html(discountCoatPrice);
		
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





















