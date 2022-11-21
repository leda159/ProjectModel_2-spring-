<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>	
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<style>
	.bi-cart {
		font-size: 30px;
	}

	.bi-suit-heart-fill {
		font-size: 30px;
	}

	.bi-truck {
		font-size: 30px;
	}

	.carousel-inner {
		width: 80%;
		height: 200px;
		/* 이미지 높이 변경 */
	}

	.carousel-item {
		width: 100%;
		height: 100%;
	}

	.d-block {
		width: 100px;
		height: 100%;
	}

	.card-img-top {
		height: 10rem;
	}

	.card {
		height: 100%;
	}
	
	.carousel-inner > .carousel-item > img,
    .carousel-inner > .carousel-item > a > img {
     	width: 70%;
      	margin-left: 250px;  
    }  
    
  	.carousel-inner > .item > img,
  	.carousel-inner > .item > a > img {
      width: 60%;
      margin: auto;
  }

</style>

<body>
	<!--  헤더시작 -->
<div class="container-fluid bg-white sticky-top">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<p class="text-center mt-2 h1 text-capitalize"><a class="text-secondary text-decoration-none" href="/">쇼핑몰</a></p>
		</div>
		<div class="col-sm-4"></div>
	</div>

	<nav class="navbar navbar-expand-md navbar-light">
		<div class="navbar-brand"></div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenuList"
			aria-controls="navbarMenuList" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarMenuList">
			<ul class="navbar-nav mr-5">
				<li class="nav-item dropdown ">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-expanded="false">
						상품 목록
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">상의</a>
						<a class="dropdown-item" href="#">하의</a>
						<a class="dropdown-item" href="#">신발</a>
					</div>
				</li>
				<li class="nav-item dropdown ">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-expanded="false">
						이벤트
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">신상품</a>
						<a class="dropdown-item" href="#">베스트 상품</a>
						<a class="dropdown-item" href="#">세일 상품</a>
					</div>
				</li>
				<li class="nav-item dropdown ">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-expanded="false">
						게시판
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Q&A</a>
						<a class="dropdown-item" href="#">공지사항</a>
					</div>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li>
					<a class="" href="#"><i class="bi bi-suit-heart-fill mr-4 text-danger"></i></a>
					<a class="" href="#"><i class="bi bi-cart mr-4 text-dark"></i></a>
					<a class="" href="#"><i class="bi bi-truck text-dark"></i></a>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-collapse justify-content-end" id="navbarMenuList">
			<ul class="navbar-nav order-md-last ">
				<li class="nav-item mr-3 ">
					<form class="form-inline my-2">
						<input class="form-control mr-sm-2" type="search" placeholder="찾아보세요!" aria-label="Search">
						<button class="btn btn-outline-dark mr-5" type="submit">검색</button>
					</form>
				</li>
			</ul>
			<!-- 로그인 하지 않은 상태 -->
			<c:if test="${session == null}">
			<ul class="navbar-nav order-md-last mb-3">
				<li class="nav-item mr-4">
					<a class="nav-link" class="dropdown-item" href="#">마이페이지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" class="dropdown-item" href="/member/login">로그인</a>
				</li>
				<li class="nav-item mr-1">
					<a class="nav-link" class="dropdown-item" href="/member/join">회원가입</a>
				</li>
			</ul>
			</c:if>
			
			<!-- 로그인한 상태 -->
			<c:if test="${session != null }">
			<ul class="navbar-nav order-md-last mb-3">
				<li class="nav-item mr-4">
					<span class="nav-link" class="dropdown-item">회원 : ${member.memberName}</span>
				</li>
				<li class="nav-item">
					<span class="nav-link" class="dropdown-item">충전금액 :<fmt:formatNumber value="${member.money}" pattern="\#,###.##" /></span>
				</li>
				<li class="nav-item mr-1">
					<span class="nav-link" class="dropdown-item">포인트 :<fmt:formatNumber value="${member.point}" pattern="#,###" /></span>
				</li>
			</ul>
			</c:if>
		</div>
	</nav>
</div>	
	<hr>
	<!-- 헤더 끝 -->