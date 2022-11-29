<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 관리 페이지 -->
<div class="container coatManage">
	<div class="col coatManage_subject">
			<h3 style="text-align:center;">상의 상품관리</h3>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<c:if test="${coatListCheck != 'empty'}">
			<table width="100%" class="table table-striped table-bordered table-hover" id="dataList">
				<thead>
				<tr>
                	<th class="text-center">상의 ID</th>
                    <th class="text-center">상의 이름</th>
                    <th class="text-center">상의 설명</th>
                    <th class="text-center">가격</th>
                    <th class="text-center">재고</th>
                    <th class="text-center">할인율</th>
                    <th class="text-center">등록 날짜</th>
                </tr>
               	</thead>  
			   	<c:forEach var="coatList" items="${coatList}">
				<tr>
                  	<td class="text-center"><c:out value="${coatList.coatId}"/></td>
                    <td class="text-center"><a class="move" href='<c:out value="${coatList.coatId}"/>'><c:out value="${coatList.coatName}"/></a></td>
                    <td class="text-center"><c:out value="${coatList.coatContents}"/></td>
                    <td class="text-center"><c:out value="${coatList.coatPrice}"/></td>
                    <td class="text-center"><c:out value="${coatList.coatStock}"/></td>
                    <td class="text-center"><c:out value="${coatList.coatDiscount}"/></td>
                	<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${coatList.regDate}"/></td>
            	</tr>	                 		               
            	</c:forEach>
            </table>
            </c:if>
            <!-- 상품이 없는 경우 -->
            <c:if test="${coatListCheck == 'empty'}">
            	<div class="table_empty"> 상품이 없습니다</div>
            </c:if>
 			<!-- 검색처리 시작 -->
            <div class="search_wrap">
                <form class="form-inline my-2" id="searchForm" action="/admin/productCoatManage" method="get">
                    <input class="form-control mr-sm-2 ml-2" type="text" name="keyword" placeholder="상의 이름으로 검색!" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                	<button class="btn btn-outline-dark search_btn">검색</button>
             	</form>
             </div>
            <!-- 검색처리 끝 -->
            <!-- 페이징 처리 시작 -->
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
                <!-- 페이징 처리 끝 -->
				<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
            <form id="actionForm" action="/admin/productCoatManage" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">	  
        	</form>  
        </div>
     </div>
</div>

<%@ include file="../adminIncludes/footer.jsp" %>

<script>

	$(document).ready(function(){
		
		//등록 성공 알림창
		let pcResult ='<c:out value="${productCoatPOST_result}"/>';
		
		checkResult(pcResult);
		
		function checkResult(result){
			
			if(result == ''){
				return;
			}
			alert("상의'" + pcResult +"'을 등록했습니다.");
		}
		
		//수정 성공 알림창
		let update_result = '${update_result}';
		
		if(update_result == 1){
			alert("수정 완료");
		}
		
		//삭제 성공 알림창
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("삭제 완료");
		}
	});

	let searchForm = $('#searchForm');
	let actionForm = $('#actionForm');
	
	//검색 버튼
	$('#searchForm button').on("click",function(e){
		e.preventDefault();
		
		//검색 키워드 유효검사
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
		
	});

	//페이지 이동 버튼
	$(".pageMaker_button a").on("click",function(e){
		e.preventDefault();
			
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
		actionForm.submit();	
	});	
	
	//조회 페이지 이동
	$(".move").on("click",function(e){
		
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='coatId' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/admin/productCoatDetail");
		actionForm.submit();
		
	});
</script>












