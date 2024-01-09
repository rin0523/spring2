<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container-md">
<h2>Board Register Page</h2>
<br>
<form action="/board/register" method="post">
<div class="mb-3">
  <label for="title" class="form-label">Title</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title...">
</div>
<div class="mb-3">
  <label for="writer" class="form-label">Writer</label>
  <input type="text" name="writer" class="form-control" id="writer" >
</div>
<div class="mb-3">
  <label for="content" class="form-label">Content</label>
  <textarea class="form-control" name="content" id="content" rows="3"></textarea>
</div>


<!-- file 입력 라인 추가 -->
<!-- <div class="mb-3">
  <label for="file" class="form-label">fileUpload</label>
  <input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display:none"><br>
  <button type="button" class="btn btn-primary" id="trigger">fileUpload</button>
</div>
파일 목록 표시라인
<div class="mb-3" id="fileZone">

</div> -->

<button type="submit" class="btn btn-primary" id="regBtn">Register</button>
</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>