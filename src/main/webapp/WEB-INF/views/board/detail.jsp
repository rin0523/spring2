<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../layout/header.jsp"></jsp:include>
<h2>Board Detail Page</h2>
<br>

<div class="container-md">
	<div class="mb-3">
		<label for="bno" class="form-label">No.</label> <input type="text"
			name="bno" class="form-control" id="bno" readonly value="${bvo.bno }">
	</div>
	<div class="mb-3">
		<label for="title" class="form-label">제목</label> <input type="text"
			name="title" class="form-control" id="title" readonly
			value="${bvo.title }">
	</div>
	<div class="mb-3">
		<label for="writer" class="form-label">작성자</label> <input type="text"
			name="writer" class="form-control" id="writer" readonly
			value="${bvo.writer }">
	</div>
	<div class="mb-3">
		<label for="reg_date" class="form-label">작성일</label> <span
			class="badge text-bg-primary">${bvo.readCount }</span> <input
			type="text" name="reg_date" class="form-control" id="reg_date"
			readonly value="${bvo.regAt }">
	</div>
	<div class="mb-3">
		<label for="content" class="form-label">내용</label> <input type="text"
			name="content" class="form-control" id="content" readonly
			value="${bvo.content }">
	</div>

	<%-- 	<!-- 파일 표시 라인 -->
	<c:set value="${boardDTO.flist }" var="flist" />
	<div>
		<ul class="list-group list-group-horizontal">
			<!-- 파일 개수만큼 li를 추가하여 파일을 표시, 타입이 1인 경우만 표시 -->
			<!-- 
				li -> div => img 그림표시
					  div = 파일이름, 작성일, span size
			 -->
			 <!-- 파일 리스트 중 하나만 가져와서 fvo로 저장 -->
			 <c:forEach items="${flist }" var="fvo">
				<li class="list-group-item">
					<c:choose>
						<c:when test="${fvo.file_type > 0 }">
							<div class="text-center">
							<!-- /upload/save_dir/uuid_file_name -->
								<img alt="" src="/upload/${fn:replace(fvo.save_dir, '\\', '/')}/${fvo.uuid}_th_${fvo.file_name }">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!-- 아이콘 같은 모양 하나 가져와서 넣기 -->
								<i class="bi bi-paperclip"></i>
							</div>
						</c:otherwise>
					</c:choose>
					<div>
						<!-- div = 파일이름, 작성일, span size  -->
						<div class="text-center">${fvo.file_name }</div>
						${fvo.reg_date }
					</div>
					<span class="badge text-bg-secondary">${fvo.file_size } Byte</span>
				</li>
			</c:forEach>
		</ul>
	</div>
	<br>
	 --%>
	<a href="/board/modify?bno=${bvo.bno }"><button type="submit"
			class="btn btn-success">Modify</button></a> <a
		href="/board/remove?bno=${bvo.bno }"><button type="button"
			class="btn btn-danger">delete</button></a> <a href="/board/list"><button
			type="submit" class="btn btn-primary">List</button></a><br>
	<hr>
	<br>

	<!-- 댓글 등록 라인 -->
	<div class="input-group mb-3">
		<span id="cmtWriter" class="input-group-text">${bvo.writer }</span> 
		<input
			type="text" id="cmtText" class="form-control"
			placeholder="Add Comment..." aria-label="Recipient's username"
			aria-describedby="button-addon2">
		<button class="btn btn-outline-secondary" id="cmtPostBtn"
			type="button">Post</button>
	</div>
	<br>
	<hr>
	<br>

	<!-- 댓글 표시 라인 -->
	<ul class="list-group list-group-flush" id="cmtListArea">
		<li class="list-group-item">
			<div class="mb-3">
				<div class="fw-bold">Writer</div>
				content
			</div> <span class="badge rounded-pill text-bg-warning">modAt</span>
		</li>
	</ul>


	<!-- 댓글 더보기 버튼  -->
	<div>
		<button type="button" id="moreBtn" data-page="1"
			class="btn btn-outline-dark" style="visibility: hidden">More+</button>
	</div>

	<!-- 모달창 라인 -->
	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Writer</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
					<input type="text" class="form-control" id="cmtTextMod">
					<button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<br>


	<script type="text/javascript">
		let bnoVal = `<c:out value="${bvo.bno}"/>`;
		console.log(bnoVal);
	</script>
	<script src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
		spreadCommentList(bnoVal);
	</script>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>