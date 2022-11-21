<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="includes/header.jsp" %>
	<!-- 바디 시작 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div id="carouselExampleControls" class="carousel slide w-100 h-100 " data-ride="carousel">
					<div class="carousel-inner mb-4">
						<div class="carousel-item active" data-bs-interval="1000">
							<img src="resources/images/a_1.jpg"
								class="d-block" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="1000">
							<img src="resources/images/b_3.jpg"
								class="d-block " alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="1000">
							<img src="resources/images/c_3.jpg" 
								class="d-block "alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-target="#carouselExampleControls"
						data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-target="#carouselExampleControls"
						data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>	
	<div class="container">
		<div class="row ml-4">
			<div class="col mb-3">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/a_3.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">상의</h5>
						<p class="card-text">설명....</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>
			<div class="col mb-3">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/b_1.jpg" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">하의</h5>
						<p class="card-text">설명....</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>
			<div class="col mb-3">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/c_1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">신발</h5>
						<p class="card-text">설명</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/a_4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">상의</h5>
						<p class="card-text">설명</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/b_4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">하의</h5>
						<p class="card-text">설명</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<img src="resources/images/c_5.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">신발</h5>
						<p class="card-text">설명</p>
						<a href="#" class="btn btn-outline-dark">구입</a>
					</div>
				</div>
			</div>			
		</div>
	</div>
	<!-- 바디 끝 -->
<%@ include file="includes/footer.jsp" %>