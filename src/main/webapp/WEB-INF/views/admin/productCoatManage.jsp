<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 관리 페이지 -->


<div class="container coatManage">
	<div class="col coatManage_subject">
			<h3 style="text-align:center;">상품 관리</h3>
	</div>
</div>
<%@ include file="../adminIncludes/footer.jsp" %>

<script>
	$(document).ready(function(){
		
		let pcResult ='<c:out value="${productCoatPOST_result}"/>';
		
		checkResult(pcResult);
		
		function checkResult(result){
			
			if(result == ''){
				return;
			}
			alert("상품'" + pcResult +"'을 등록했습니다.");
		}
	});
</script>












