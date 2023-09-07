<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<!-- The Modal -->
<div id="myModal" class="modal right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog">
  <!-- Modal content -->
  <div class="modal-content">
  	<div class="modal-header">
  		<span class="close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body">
 		<form action="${pageContext.request.contextPath}/projectInsert" method="post">
	    	<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">프로젝트명 및 설명을 입력해주세요.</h5>
				</div>
				<div class="card-body">
					<input type="hidden" name="pno" value="9">
					<input type="hidden" name="userId" value="kh0001@kh.com">
					<input type="hidden" name="paccess" value="ddd">
					<!-- <input type="hidden" name="pdate" value=systimestamp> -->
					<input type="text" class="form-control" name="pname" placeholder="프로젝트명을 입력해주세요.">
					<br>
					<textarea class="form-control" rows="2" name="pcoment" placeholder="프로젝트에 관한 설명을 입력해주세요.(옵션)"></textarea>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">프로젝트 진행시기</h5>
				</div>
				<div class="card-body">
					<input type="date" class="form-date" name="pstartDate"> ~ <input type="date" class="form-date" name="pendDate">
				</div>
			</div>
			<div align="center">
				<button class="btn btn-primary" type="submit">추가</button>
				<button class="btn btn-warning" type="reset">취소</button>
			</div>
		</form>
	</div>
  </div>
    <div class="modal-footer">
  	</div>
  </div>
</div>
</div>
<!-- 모달 -->