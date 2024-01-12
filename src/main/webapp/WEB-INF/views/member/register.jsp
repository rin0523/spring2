<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- email, pwd,nick_name -->
<div class="container-md">
<h4 class="mb-3">Input your information</h4>
<form action="/member/register" method="post" >
<div class="mb-3">
  <label for="e" class="form-label">email</label>
  <input type="email" name="email" class="form-control" id="e" placeholder="example@ooo.com">
</div>
<div class="mb-3">
  <label for="p" class="form-label">password</label>
  <input type="password" name="pwd" class="form-control" id="p" placeholder="password">
</div>
<div class="mb-3">
  <label for="n" class="form-label">nick_name</label>
  <input type="text" name="nickName" class="form-control" id="n" placeholder="nickName">
</div>

</form>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>