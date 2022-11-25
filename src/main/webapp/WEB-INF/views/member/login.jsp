<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file = "../includes/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<style>
.login_warn{
	margin-top : 20px;
	margin-bottom : 20px;
	text-align : center;
	font-size: 14px;
	color : red;		
}
</style>

<body>
<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form id="login_form" action="" method="post">
					<h3 style="text-align:center;">로그인</h3>
					<div class="form-group">
						<input type="text" name="memberId" class="form-control" placeholder="아이디" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" name="memberPassword" class="form-control" placeholder="비밀번호" maxlength="20">
					</div>
					<c:if test="${result == 0}">
						<div class="login_warn">
							아이디 또는 비밀번호를 잘못 입력하셨습니다.
						</div>
					</c:if>
					<input type="submit" class="btn btn-dark form-control login_button" value="로그인" >
				</form>
			</div>
		</div>
	</div>
</body>

<script>

	//로그인 버튼 클릭 메서드
	$(".login_button").click(function(){
		
		//alert("로그인 버튼 작동");
		
		//로그인 메서드 서버에 요청
		$("#login_form").attr("action", "/member/login.do");
		$("#login_form").submit();
	});
</script>
</html>

<%@ include file = "../includes/footer.jsp" %>   



















 