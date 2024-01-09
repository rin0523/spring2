<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<h2>Board Modify Page</h2>
<hr>
<form action="/board/modify" method="post">
	<div class="container-md">
		<div class="mb-3">
			<label for="bno" class="form-label">No.</label> 
			<input type="text" name="bno" class="form-control" id="bno" readonly value="${bvo.bno }">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">제목</label> 
			<input type="text" name="title" class="form-control" id="title" value="${bvo.title }">
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label> 
			<input type="text" name="writer" class="form-control" id="writer" readonly value="${bvo.writer }">
		</div>
		<div class="mb-3">
			<label for="reg_date" class="form-label">작성일</label> 
			<span class="badge text-bg-primary">${bvo.readCount }</span> 
				<input type="text" name="reg_date" class="form-control" id="reg_date" readonly value="${bvo.regAt }">
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">내용</label> 
			<input type="text"	name="content" class="form-control" id="content" value="${bvo.content }">
		</div>
		
<%-- 		<!-- 파일 표시 라인 -->
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
						<button type="button" data-uuid="${fvo.uuid }" class="file-x btn btn-danger btn-sm">X</button>
					</li>
				</c:forEach>
			</ul>
		</div>
		<br>
		
		<!-- 수정 파일 등록 라인 -->
		<!-- file 입력 라인 추가 -->
		<div class="mb-3">
			<label for="file" class="form-label">fileUpload</label> 
			<input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display: none"><br>
			<button type="button" class="btn btn-primary" id="trigger">FileUpload</button>
		</div>
		<!-- 파일 목록 표시라인 -->
		<div class="mb-3" id="fileZone">
			 --%>
		<button type="submit"  class="btn btn-primary" id="regBtn">Modify</button>
		<a href="/board/list"><button type="button" class="btn btn-primary">List</button></a>
		</div>
	
</form> 

<!-- <script src="/resources/js/boardModify.js"></script>
<script src="/resources/js/boardRegister.js"></script> -->

</div>

</form>
<jsp:include page="../layout/footer.jsp"></jsp:include>