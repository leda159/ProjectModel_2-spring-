<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp" %>    


<style type="text/css">
	/*중복 아이디 존재하지 않는 경우  */
	.id_input_re_1{
		color : green;
		display : none;
	}
	
	/*중복 아이디 존재하는 경우  */
	.id_input_re_2{
		color : red;
		display : none;
	}
</style>

<body>
<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="/member/join" method="post">
				
					<h3 style="text-align:center;">회원가입</h3>
					
					<div class="form-group id_wrap">
						<input type="text" name="memberId" class=" id_input form-control" placeholder="아이디" maxlength="20">
						<span class="id_input_re_1">사용 가능한 아이디 입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					</div>
					<div class="form-group">
						<input type="password" name="memberPassword" class="form-control" placeholder="비밀번호" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" name="memberName" class="form-control" placeholder="이름" maxlength="20">
					</div>
				    <div class="form-group">
						<input type="text" name="memberEmail" class="form-control" placeholder="이메일" maxlength="20">
					</div>
					<div class="form-group form-row">
						<div class="col">
							<input type="text" id="sample4_postcode" class="form-control" name="memberAddr" value="" placeholder="우편번호">
						</div>	
						<div class="col">
							<input type="button" class="btn btn-secondary form-control" onclick="sample4_execDaumPostcode()" value=우편번호찾기>
						</div>	
					</div>
					<div class="form-group">
						<input type="text" id="sample4_roadAddress" name="memberAddr1" class="form-control" value="" placeholder="도로명주소">
					</div>
					<div class="form-group">
						<input type="text" id="sample4_jibunAddress" name="memberAddr2" class="form-control" value="" placeholder="지번주소">
					</div>
					<div class="form-group">
						<input type="text" id="sample4_detailAddress" name="memberAddr3" class="form-control" value="" placeholder="상세주소">
					</div>
						<input type="submit" class="btn btn-dark form-control" value="가입하기" >
				</form>
			</div>
		</div>
	</div>

			

</body>
<!-- 다음 API 시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 다음 API 끝 -->

<script>
	$(document).ready(function(){

		//아이디 중복검사
		$('.id_input').on("propertychange change keyup paste input", function(){
			 //console.log("keyup 테스트");	 
		var memberId = $('.id_input').val();// .id_input에 입력되는 값
		var data = {memberId : memberId}	// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				//console.log("성공 여부" + result);
					if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");				
					} else {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");				
					}
				}// success 종료
			}); // ajax 종료	 
		});	// function 종료
	});
</script>

<%@ include file = "../includes/footer.jsp" %>


















