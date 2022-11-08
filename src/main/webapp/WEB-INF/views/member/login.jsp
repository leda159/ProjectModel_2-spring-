<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="container">
		<div class="col-lg-4" style="float: none; margin:100 auto;">
			<div style="padding-top:20px;">
				<form action="" method="post">
					<h3 style="text-align:center;">로그인</h3>
					<div class="form-group">
						<input type="text" name="userID" class="form-control" placeholder="아이디" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" name="userPassword" class="form-control" placeholder="비밀번호" maxlength="20">
					</div>
					<input type="submit" class="btn btn-dark form-control" value="로그인" >
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<%@ include file = "../includes/footer.jsp" %>    