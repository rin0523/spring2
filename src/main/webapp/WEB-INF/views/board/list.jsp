<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
	<h1>즐거운 이야기 게시판</h1>
	<br>

	<!-- 검색라인 -->

	<div class="container-sm">

		<form action="/board/list" method="get">
			<div class="input-group mb-3">
			<c:set value=" ${ph.pgvo.type}" var="typed"></c:set>
				<select name="type">
					<option ${type== null ? 'selected' :''}>Choose...</option>
					<option value="t" ${type== 't' ? 'selected' :''}>Title</option>
					<option value="w" ${type== 'w' ? 'selected' :''}>Writer</option>
					<option value="c" ${type== 'c' ? 'selected' :''}>Content</option>
					<option value="tc" ${type== 'tc' ? 'selected' :''}>Title&Content</option>
					<option value="tw" ${type== 'tw' ? 'selected' :''}>Title&Writer</option>
					<option value="wc" ${type== 'wc' ? 'selected' :''}>Writer&Content</option>
					<option value="twc" ${type== 'twc' ? 'selected' :''}>All</option>
				</select> 
				
				
				<input type="search" class="form-control me-2" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search..."> 
				<input type="hidden" name="pageNo" value="1"> 
				<input type="hidden" name="qty" value="${ph.pgvo.qty}">
				<button type="submit" class="btn btn-primary position-relative">Search 
				<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${ph.totalCount}
						<span class="visually-hidden">unread messages</span>
					</span>
				</button>

			</div>
		</form>
	</div> 

	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">title</th>
				<th scope="col">writer</th>
				<th scope="col">reg_date</th>
				<th scope="col">read_count</th>
				<th scope="col">comment_qty</th>
				<th scope="col">file_qty</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<th scope="row">${bvo.bno }</th>
					<td><a href="/board/detail?bno=${bvo.bno}">${bvo.title }</a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.regAt }</td>
					<td>${bvo.readCount }</td>
					<td>${bvo.cmtQty }</td>
					<td>${bvo.hasFile }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 

	 <!-- 페이지 네이션 라인  -->

	<nav aria-label="Page navigation example">
		<ul class="pagination">



			<!--  이전 -->
			<c:if test="${ph.prev }">
				<li class="page-item">
				<a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}">
						<span aria-hidden="true"> ◁ </span>
				</a></li>
			</c:if>

			<!-- 페이지 번호 -->

			<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
				<li class="page-item">
				<a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}">
						${i} </a></li>
			</c:forEach>


			<!-- 다음 -->
			<c:if test="${ph.next }">
				<li class="page-item">
				<a class="page-link"href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}">
						<span aria-hidden="true"> ▷ </span>
				</a></li>
			</c:if>
				<li class="page-item"><a class="page-link" href="/board/list"> 전체보기 </a></li>

		</ul>
	</nav>



</div> 


<!-- <script>
	const isDel = `<c:out value="${isDel}"/>`;

	if (isDel == 1) {
		
		alert("게시글이 삭제되었습니다");
	}
</script> --%>
 -->




<jsp:include page="../layout/footer.jsp"></jsp:include>