<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<h2>Board Modify Page</h2>
<hr>
<form action="/board/modify" method="post" enctype="multipart/form-data">
	<div class="container-md">
		<c:set value="${bdto.bvo }" var="bvo" />
		<div class="mb-3">
			<label for="bno" class="form-label">No.</label> <input type="text"
				name="bno" class="form-control" id="bno" readonly
				value="${bvo.bno }">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">제목</label> <input type="text"
				name="title" class="form-control" id="title" value="${bvo.title }">
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
				name="content" class="form-control" id="content"
				value="${bvo.content }">
		</div>

		<!-- 파일 표시 라인 -->
		<c:set value="${bdto.flist }" var="flist"></c:set>
		<div class="col-12">
			<label for="f" class="form-label"></label>
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist }" var="fvo">
					<li class="list-group-item"><c:choose>
							<c:when test="${fvo.fileType==1 }">
								<div>
									<img alt=""
										src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- 일반 파일 표시할 아이콘  -->
									<svg xmlns="http://www.w3.org/2000/svg" width="75" height="75"
										fill="currentColor" class="bi bi-file-earmark-arrow-down-fill"
										viewBox="0 0 16 16">
  <path
											d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zm-1 4v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 11.293V7.5a.5.5 0 0 1 1 0z" />
</svg>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge rounded-pill text-bg-secondary">${fvo.fileSize }Byte</span>
							<button type="button" data-uuid="${fvo.uuid }"
								class="btn btn-danger file-x">X</button>
						</div></li>
				</c:forEach>
			</ul>
		</div>

		<!-- 파일 등록 라인  -->


		<!-- file 입력 라인 추가 -->
		<div class="mb-3">
			<label for="file" class="form-label">fileUpload</label> <input
				type="file" name="files" class="form-control" id="files"
				multiple="multiple" style="display: none"><br>
			<!-- 파일 버튼 트리거 사용하기 위해서 주는 버튼  -->
			<button type="button" class="btn btn-primary" id="trigger">fileUpload</button>
		</div>
		<!-- 첨부파일 목록 표시라인 -->
		<div class="mb-3" id="fileZone">
		
		</div>





		<button type="submit" class="btn btn-primary" id="regBtn">Modify</button>
	</div>
</form>

		<c:set value="${bdto.flist }" var="flist"></c:set>
		<a href="/board/list"><button type="button"	class="btn btn-primary">List</button></a>

<!-- <script src="/resources/js/boardModify.js"></script>
<script src="/resources/js/boardRegister.js"></script> -->


<script src="/resources/js/boardModify.js"></script>
<script src="/resources/js/boardRegister.js"></script>


<jsp:include page="../layout/footer.jsp"></jsp:include>