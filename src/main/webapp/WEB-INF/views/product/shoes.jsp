<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@ include file="../includes/header.jsp" %>
<!-- 바디 시작 -->
<style>
 /* 상품 표 */
.list_search_result{
	width: 90%;
	margin: auto;	
}

.type_list{
	width: 100%;
	border-bottom: 1px solid #e7e7e7;
	border-collapse: collapse;	
}

.type_list tr{
	height:200px;
	border-bottom: 1px solid #e7e7e7;
}

.detail div{
	margin-bottom: 50px;
	margin-left: 20px;
}

.contents{
	font-size: 17px;
    font-weight: 600;
}

.title{
	font-size: 24px;
	color: #3a60df;
	font-weight: 700;
}

.info{
	text-align: center;
}

.price{
	text-align: center;
}

.org_price del{
	font-size: 13px;
}

.sell_price strong{
	color: #da6262;
    font-size: 18px;
}
	
.active{
	border : 2px solid black;
	font-weight:400;

}

/* 상품 이미지 관련 */
.image_wrap {
	width: 100%;
	height: 100%;
}	

.image_wrap img {
	max-width: 95%;
	height: auto;
 	display: block;
}
	
</style>



<c:if test="${shoesListCheck != 'empty'}">
	<div class="list_search_result">
		<table class="type_list">
			<colgroup>
				<col width="170">
				<col width="*" >
				<col width="220">
				<col width="220">
				
			</colgroup>
			<tbody id="searchList>">
				<c:forEach items="${shoesList}" var="shoesList">
					<tr>
						<td class="image">
							<div class="image_wrap" data-shoesNumber ="${shoesList.imageList[0].shoesNumber}" data-path="${shoesList.imageList[0].uploadPath}" data-uuid="${shoesList.imageList[0].uuid}" data-filename="${shoesList.imageList[0].fileName}">
								<img>
							</div>						
						</td>
						<td class="detail">
							<div class="title">
								<a href="/product/shoesDetail/${shoesList.shoesNumber}" style=" text-decoration-line: none; color:black" >
									${shoesList.shoesName}
								</a>	
							</div>						
							<div class="contents" style="margin-top: 20px;">
								${shoesList.shoesContents}
							</div>
						</td>
						<td class="info">
							<div class="rating">
								평점(추후 추가)
							</div>
						</td>
						<td class="price">
							<div class="org_price">
								<del>
									<fmt:formatNumber value="${shoesList.shoesPrice}" pattern="#,### 원" />
								</del>
							</div>
							<div class="sell_price">
								<strong>
									<fmt:formatNumber value="${shoesList.shoesPrice * (1-shoesList.shoesDiscount)}" pattern="#,### 원" />
								</strong>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
    <div class="pull-right pageMaker_wrap">
    	<ul class="pageMaker">
        <c:if test="${pageMaker.prev}">
       		<li class="pageMaker_button prev">
            	<a class="btn btn-outline-dark" href="${pageMaker.startPage - 1}"><</a>
             </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        	<li class="pageMaker_button ${pageMaker.cri.pageNum == num ? 'active':''}">
            	<a href="${num}">${num}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
             <li class="pageMaker_button next">
                <a class="btn btn-outline-dark"  href="${pageMaker.endPage + 1}">></a>
             </li>
        </c:if>
	</ul>
</div>
	<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
<form id="actionForm" action="/product/shoes" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">	  
</form>			
</c:if>

<!-- 상품이 없는 경우 -->
<c:if test="${shoesListCheck == 'empty'}">
	<div class="table_empty"> 상품이 없습니다</div>
</c:if>	



		
<!-- 바디 끝 -->

<script type="text/javascript">

$(document).ready(function(){

	//이미지 정보 호출
	$(".image_wrap").each(function(i, obj){
		
		 const sobj = $(obj);
		
	 if(sobj.data("uuid")){
		 const uploadPath = sobj.data("path");
		 const uuid = sobj.data("uuid");
		 const fileName = sobj.data("filename");
		
		 const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
	 }else{
		$(this).find("img").attr('src', '/resources/images/No_Image.png');
	 }
	 
	});
});	//$(document).ready




let actionForm = $('#actionForm');

//페이지 이동 버튼
$(".pageMaker_button a").on("click",function(e){
	e.preventDefault();
		
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
	actionForm.submit();	
});	

//조회 페이지 이동
$(".move").on("click",function(e){
	
	e.preventDefault();
	
	actionForm.append("<input type='hidden' name='shoesNumber' value='"+$(this).attr("href")+"'>");
	actionForm.attr("action","/product/shoesDetail");
	actionForm.submit();
	
});

</script>

<%@ include file="../includes/footer.jsp" %>