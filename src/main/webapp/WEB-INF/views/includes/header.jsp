<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
  
  
/* 페이지 버튼 인터페이스 */ 
.pageMaker_wrap{
	text-align: center;
    margin-top: 30px;
    margin-bottom: 40px;
}
.pageMaker{
    list-style: none;
    display: inline-block;
}	
.pageMaker_button {
    float: left;
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 10px;
}


.pageMaker_button a:link {color: black;}
.pageMaker_button a:visited {color: black;}
.pageMaker_button a:active {color: black;}
.pageMaker_button a:hover {color: black;}
	{
    color: #ccc;
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
	<c:if test="${sessionScope.member  != null }">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<p class="text-right h5 text-secondary mr-4">${member.memberName} 회원님</p>		
			</div>
		</div>
	</c:if>
	<nav class="navbar navbar-expand-md navbar-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenuList"
			aria-controls="navbarMenuList" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarMenuList">
			<ul class="navbar-nav mr-5">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-expanded="false">
						상품 목록
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/product/coat">상의</a>
						<a class="dropdown-item" href="/product/pants">하의</a>
						<a class="dropdown-item" href="/product/shoes">신발</a>
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
					<form class="form-inline my-2" id="searchForm"  method="get" onsubmit="search()">
						<select class="form-control mr-1" name="searchSelect" id="searchSelect">
     						<option value="C">상의</option><!-- action="/product/coat"  -->
      						<option value="P">하의</option><!-- action="/product/pants"  -->
      						<option value="S">신발</option><!-- action="/product/shoes"  -->
    					</select>
						<input class="form-control mr-sm-2" type="search" name="keyword" placeholder="찾아보세요!" aria-label="Search">
						<button class="btn btn-outline-dark mr-5" type="submit">검색</button>
					</form>
				</li>
			</ul>
		</div>
		
		<div class="collapse navbar-collapse justify-content-end" id="navbarMenuList">	
			<!-- 로그인 하지 않은 상태 --> 
			<c:if test="${sessionScope.member == null}">
			<ul class="navbar-nav order-md-last">
				<li class="nav-item">
					<a class="nav-link" class="dropdown-item" href="/member/login">로그인</a>
				</li>
				<li class="nav-item mr-1">
					<a class="nav-link" class="dropdown-item" href="/member/join">회원가입</a>
				</li>
			</ul>
 			</c:if>	
			<!-- 로그인한 상태 -->
			<c:if test="${sessionScope.member  != null }">
			<div>
			<ul class="navbar-nav order-md-last row align-items-start">
				<li class="nav-item">
					<span class="nav-link" class="dropdown-item">잔여금액 : <fmt:formatNumber value="${member.money}" pattern="#,###.##" /></span>
				</li>
				<li class="nav-item mr-3">
					<span class="nav-link" class="dropdown-item">포인트 : <fmt:formatNumber value="${member.point}" pattern="#,###" /></span>
				</li>
			</ul>
			<ul class="navbar-nav order-md-last row align-items-end ">
			<!-- 관리자 접속 -->
				<c:if test="${member.adminCk == 1}">
				<li class="nav-item">
					<a class="nav-link" class="dropdown-item" href="/admin/adminMain">관리자 페이지</a>
				</li>
				</c:if>
				<li class="nav-item">
					<a class="nav-link" class="dropdown-item" href="#">마이페이지</a>
				</li>
				<li class="navitem">
					<a class="nav-link" class="dropdown-item" id="gnb_logout" href="/member/logout.do">로그아웃</a>
				</li>
			</ul>
			</div>			
			</c:if>
		</div>
	</nav>
</div>	
	<hr>
	<!-- 헤더 끝 -->
	
	
<script>
	//비동기 로그아웃 버튼 작동 (화면이동 없이 로그아웃 기능)
	$("#gnb_logout").click(function(){
		//alert("버튼 작동");
		$.ajax({
			type:"POST",
			url:"/member/logout.do",
			success:function(data){
				//alert("로그아웃 성공");
				document.location.reload();//새로고침
			}
		});//ajax
	});//로그아웃 버튼 작동 끝
	
	

	function search(e){
		
		var target = document.getElementById("searchSelect");
		
		if(target.options[target.selectedIndex].value == 'C'){
			
			$("form").attr("action","/product/coat")
			
		}else if(target.options[target.selectedIndex].value == 'P'){
			
			$("form").attr("action","/product/pants")
			
		}else if(target.options[target.selectedIndex].value == 'S'){
	
			$("form").attr("action","/product/shoes")
		}
	}
	

	
</script>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	