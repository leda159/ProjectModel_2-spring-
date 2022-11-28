<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<%@ include file="../adminIncludes/header.jsp" %>

<!-- 상의 관리 페이지 -->
<div class="row">
	<div class="col-lg-12">
    	<h1 class="page-header">상의 상품 리스트</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">상의 목록
				<button id="regBtn" type="button" class="btn btn-success btn-xs pull-right">상의 등록</button>
			</div>
		<div class="panel-body">
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
			   		<c:forEach var="board" items="${coat}">
					<tr>
                    	<td class="text-center"><c:out value="${coat.coatId}"/></td>
                        <td class="text-center"><a class="move" href='<c:out value="${coat.coatId}"/>'><c:out value="${coat.coatName}"/>&nbsp;&nbsp;<b>[<c:out value=""/>]</b></a></td>
                        <td class="text-center"><c:out value="${coat.coatContents}"/></td>
                        <td class="text-center"><c:out value="${coat.coatPrice}"/></td>
                        <td class="text-center"><c:out value="${coat.coatStock}"/></td>
                        <td class="text-center"><c:out value="${coat.coatDiscount}"/></td>
                        <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${coat.regDate}"/></td>

                     </tr>	                 		               
                     </c:forEach>
              </table>
 				<!-- 검색처리 시작 -->
            	<div class="row">
                	<div class="col-lg-12">
                    	<form id="searchForm" action="/board/list" method="get">
                        	<select name="type">
                            	<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected': ''}"/>>--</option>
                            	<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected': ''}"/>>제목
                            	<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected': ''}"/>>내용</option>
                            	<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected': ''}"/>>작성자</option>
                            	<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected': ''}"/>>제목 or 내용</option>
                            	<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected': ''}"/>>제목 or 작성자</option>
                            	<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected': ''}"/>>제목 or 내용 or 작성자</option>
                            </select>
                            	<input type="text" name="keyword" value='${pageMaker.cri.keyword}'/>
                            	<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
                            	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                            	<button class="btn btn-primary">조회</button>
                        </form>
                     </div>
                </div>
                <!-- 검색처리 끝 -->
                <!-- 페이징 처리 시작 -->
                <div class="pull-right">
                	<ul class="pagination">
                    	<c:if test="${pageMaker.prev}">
                        	<li class="paginate_button previous">
                        		<a href="${pageMaker.startPage - 1}">이전</a>
                        	</li>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        	<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}">
                        		<a href="${num}">${num}</a>
                        	</li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                        	<li class="paginate_button next">
                        		<a href="${pageMaker.endPage + 1}">다음</a>
                        	</li>
                        </c:if>
                   	</ul>
               	</div>
                <!-- 페이징 처리 끝 -->
				<!-- 현재페이지번호와 보여지는 행수를 hidden 처리 -->
                <form id="actionForm" action="/board/list" method="get">
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <!-- 페이지번호 클릭시 검색조건,문자열 전달 -->
                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">	  
                </form>  
        	</div>
     	</div>
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
			alert("상의'" + pcResult +"'을 등록했습니다.");
		}
	});
</script>












