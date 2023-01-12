<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<style>
table{
	border-collapse : collapse;
	width : 100%;
}

.table_text_align_center{
	text-align : center;
}

caption{
	visibility : hidden;
	width : 0;
	height : 0;
	font-size : 0;
	line-height : 0;
	oberflow : hidden;
}

.content_subject{
	height : 110px;
	line-height : 110px;
	background-color : #5080bd;
	margin-bottom : 60px;
}

.content_subject span{
	padding-left : 30px;
	display : inline-block;
	color : white;
	font-size : 50px;
	font-weight : bolder;
}

.content_totalCount_section{
	margin-bottom : 12px;
}

.content_btn_section{
	margin-top : 20px;
	text-align : right; 
}

.content_btn_section a{
	 color: #fefeff;
	background-color: #365fdd;
	min-width : 125px;
	display : inline-block;
	height : 39px;
	font-size : 23px;
	font-weight : bold;
	text-align : center;
	margin-right : 14px;
	line-height : 39px;
}

.subject_table{
	font-size : 14px;
	line-height : 20px;
	width : 100%;
	text-align : center;
}	

th{
	text-align : center;
	color : #333;
	border-bottom : 1px solid #e7e7e7;
	border-top : 1px solid #3084d9;
	background : #f4f9fd;
	padding : 2px 0;
}

.td_width_1{
	width : 5%;
}

.td_width_2{
	width : 10%;
}

.td_width_3{
	width : 25%;
}

.td_width_4{
	width : 15%;
}

.cart_table{
	font-size : 14px;
	line-height : 20px;
}

.cart_table tr{
	height : 110px;
}

.price_td{
	padding-left : 5px;
}

.red_color{
	color : red;
}

.green_color{
	color : green;
}

.cart_table td{
	border-bottom : 1px solid #e7e7e7;
}

.quantity_div{
	position: relative;
	width: 42px;
	height: 25px;
	text-align: left;
	margin: 5px auto;		
}

.quantity_input{
	position: absolute;
	width: 27px;
	height: 25px;
	text-align: center;
	border: 1px solid #c6c6c6;
	border-right: 0px;
	line-height: 19px;
	font-size: 12px;
	color: #4c4848;	
	left: 0;
}

.quantity_btn{
	position: absolute;
	border: 1px solid #aaa;
	color: #3a60df;
	width: 14px;
	height: 13px;
	padding: 0px;
	background-color: #fff;
    font-weight: bold;
	font-size: 7px;
	line-height: 6px;
	vertical-align: middle;	
}

.plus_btn{
	top: 0;
	right: 0
}

.minus_btn{
	bottom: 0;
	right: 0
}	
	
.quantity_modify_btn{
	border: 1px solid #d0d0d0;
	height: 13px;
	line-height: 13px;
	background-color: #fff;
	text-align: center;
	width: 50px;
	display: inline-block;
	padding: 1px 3px 15px 1px;
	margin-top: 3px;		
}

.table_text_align_center{
	text-align: center;
}

.delete_btn{
	width: 40px;		
}
		
.content_total_section{
	background-color: rgb(227, 237, 247);
}	
	
.total_wrap{
	width: 80%;
	margin: auto;
	padding: 10px 0 10px 0;	
}

.total_wrap td{
	width : 50%;
}

.finalTotalPrice_span{
	color: #854A72;
	font-size: 17px;
	font-weight: bold;
}

.totalPoint_span{
	font-size: 17px;
	font-weight: bold;		
}

.boundary_div{
	font-size: 0;
	border: 1px dotted #d1c7c7;
	margin: 5px 0 5px 0;		
}
</style>
<%-- 	<p>상의시작${cartCoatInfo}
	<p>하의시작${cartPantsInfo}
	<p>신발시작${cartShoesInfo} --%>
	
<div class="content_subject"><span>장바구니</span></div>	

<!-- 장바구니 리스트 -->
<div class="content_middle_section"></div>
<!-- 장바구니 가격 합계 -->
<!-- cartinfo -->
<div class="content_totalCount_section">
	<table class="subject_table">
		<tbody>
			<tr>
				<th class="td_width_1"></th>
				<th class="td_width_2"></th>
				<th class="td_width_3">상품명</th>
				<th class="td_width_4">가격</th>
				<th class="td_width_4">수량</th>
				<th class="td_width_4">합계</th>
				<th class="td_width_4">삭제</th>
			</tr>
		</tbody>
	</table>
	<table class="cart_table">
		<caption>표 내용 부분</caption>
		<!-- 상의 리스트 -->
		<tbody>
			<c:forEach items="${cartCoatInfo}" var="cc">
				<c:if test="${cc.coatName != null}">
				<tr>
					<td class="td_width_1"></td>
					<td class="td_width_2"></td>
					<td class="td_width_3">${cc.coatName}</td>
					<td class="td_width_4">
						<del>정가 : <fmt:formatNumber value="${cc.coatPrice}" pattern="#,### 원" /></del><br>
							판매가 : <span class="red_color"><fmt:formatNumber value="${cc.coatSalePrice}" pattern="#,### 원" /></span><br>
							마일리지 : <span class="green_color"><fmt:formatNumber value="${cc.coatPoint}" pattern="#,### 원" /></span>		
					</td>
					<td class="td_width_4 table_text_align_center">
						<div class="table_text_align_center quantity_div">
							<input type="text" value="${cc.coatCount}" class="quantity_input">
							<button class="quantity_btn plus_btn">+</button>
							<button class="quantity_btn minus_btn">-</button>
						</div>
						<a class="quantity_modify_btn">변경</a>
					</td>
					<td class="td_width_4 table_text_align_center">
						<fmt:formatNumber value="${cc.coatSalePrice * cc.coatCount }" pattern="#,### 원" />
					</td>
					<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
				</tr>
				</c:if>	
			</c:forEach>
		</tbody>
		<!-- 하의 리스트  -->
		<tbody>
			<c:forEach items="${cartPantsInfo}" var="cp">
				<c:if test="${cp.pantsName != null}">
				<tr>
					<td class="td_width_1"></td>
					<td class="td_width_2"></td>
					<td class="td_width_3">${cp.pantsName }</td>
					<td class="td_width_4">
						<del>정가 : <fmt:formatNumber value="${cp.pantsPrice}" pattern="#,### 원" /></del><br>
							판매가 : <span class="red_color"><fmt:formatNumber value="${cp.pantsSalePrice}" pattern="#,### 원" /></span><br>
							마일리지 : <span class="green_color"><fmt:formatNumber value="${cp.pantsPoint}" pattern="#,### 원" /></span>		
					</td>
					<td class="td_width_4 table_text_align_center">
						<div class="table_text_align_center quantity_div">
							<input type="text" value="${cp.pantsCount}" class="quantity_input">
							<button class="quantity_btn plus_btn">+</button>
							<button class="quantity_btn minus_btn">-</button>
						</div>
						<a class="quantity_modify_btn">변경</a>
					</td>
					<td class="td_width_4 table_text_align_center">
						<fmt:formatNumber value="${cp.pantsSalePrice * cp.pantsCount }" pattern="#,### 원" />
					</td>
					<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
		<!-- 신발 리스트  -->
		<tbody>
			<c:forEach items="${cartShoesInfo}" var="cs">
				<c:if test="${cs.shoesName != null}">
				<tr>
					<td class="td_width_1"></td>
					<td class="td_width_2"></td>
					<td class="td_width_3">${cs.shoesName }</td>
					<td class="td_width_4">
						<del>정가 : <fmt:formatNumber value="${cs.shoesPrice}" pattern="#,### 원" /></del><br>
							판매가 : <span class="red_color"><fmt:formatNumber value="${cs.shoesSalePrice}" pattern="#,### 원" /></span><br>
							마일리지 : <span class="green_color"><fmt:formatNumber value="${cs.shoesPoint}" pattern="#,### 원" /></span>		
					</td>
					<td class="td_width_4 table_text_align_center">
						<div class="table_text_align_center quantity_div">
							<input type="text" value="${cs.shoesCount}" class="quantity_input">
							<button class="quantity_btn plus_btn">+</button>
							<button class="quantity_btn minus_btn">-</button>
						</div>
						<a class="quantity_modify_btn">변경</a>
					</td>
					<td class="td_width_4 table_text_align_center">
						<fmt:formatNumber value="${cs.shoesSalePrice * cs.shoesCount }" pattern="#,### 원" />
					</td>
					<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<table class="list_table">
	
	</table>
</div>
<!-- 가격 총합 -->
<div class="content_total_section">
	<div class="total_wrap">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>총 상품 가격</td>
							<td>
								<span class="totalPrice_span">70000</span>원
							</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>
								<span class="delivert_price">3000</span>원							
							</td>
						<tr>
							<td>총 주문 상품수</td>
							<td>
								<span class="totalKind_span"></span>총<span class="totalCount_span"></span>권							
							</td>							
						</tr>						
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="boundary_div">구분선</div>
		<table>
			<tr>
				<td>
					<table>
						<tbody>
							<tr>
								<td>
									<strong>총 결제 예상 금액</strong>
								</td>
								<td>
									<span class="finalTotalPrice_span">7000</span>원
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td>
					<table>
						<tbody>
							<tr>
								<td>
									<strong>총 적립 예상 마일리지</strong>
								</td>
								<td>
									<span class="totalPoint_span">70000</span>원
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
<!--구매 버튼 영역  -->
<div class="content_btn_section">
	<a class="">주문하기</a>
</div>















<%@ include file="includes/footer.jsp" %>