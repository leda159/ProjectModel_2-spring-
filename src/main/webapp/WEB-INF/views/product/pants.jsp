<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>
	<!-- 바디 시작 -->
	<h1>검색결과</h1>
	
	<div>
		${list}
	</div>
	
	<div>
		${pageMaker}
	</div>
	
	<!-- 바디 끝 -->
<%@ include file="../includes/footer.jsp" %>