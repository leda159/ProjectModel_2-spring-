<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@ include file="../includes/header.jsp" %>
<!-- 바디 시작 -->


<div class="container coatManage">
	<div class="col coatManage_subject">
			<h3 style="text-align:center;">상의 상품</h3>
	</div>
</div>

<c:if test="${coatListCheck != 'empty'}">
	<c:forEach var="coatList" items="${coatList}">
	<div class="container">
		<div class="row ml-4">
			<div class="col mb-3">
				<div class="card" style="width: 18rem;">
					<img src="../resources/images/a_3.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><c:out value="${coatList.coatName}"/></h5>
						<p class="card-text"><c:out value="${coatList.coatContents}"/>....</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>		
		</div>
	</div>	
	</c:forEach>
</c:if>

<!-- 상품이 없는 경우 -->
<c:if test="${coatListCheck == 'empty'}">
	<div class="table_empty"> 상품이 없습니다</div>
</c:if>	



		
<!-- 바디 끝 -->
<%@ include file="../includes/footer.jsp" %>