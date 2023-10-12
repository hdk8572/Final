<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<div id="myModal" class="modal ptask " aria-labelledby="myModalLabel">
	<div class="modal-dialog ptask">
		<!-- Modal content -->
		<div class="modal-content ptask">
			<div class="modal-header ptask"></div>
			<div class="modal-body ptask">
				<div class="wrap-card">
					<div class="card-body ptask">
					<div class="card-header ptaskTitle">
						<h2 class="ptaskTitle"><b>업무 작성</b></h2>
					</div>
						<form action="${pageContext.request.contextPath}/insertPtask" method="post" encType="multipart/form-data">					
						<input type="text" class="form-control title" name="ttitle" placeholder="제목을 입력하세요.">
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
							<select class= "form-select mb-3 selectCategory ml-2 " name="tstatus">
							  <option class="status request" selected="selected">요청</option>
							  <option class="status progress">진행</option>
							  <option class="status feedback">피드백</option>
							  <option class="status complete">완료</option>
							  <option class="status remain">보류</option>
							</select>					
						</div>
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
							  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
							</svg>
							<input type="text" class= "form-control manager ml-2" name="tmember" placeholder= "담당자">
							<input type="file" class= "btn btn-primary fileUploadBtn" name="upload" >
						</div>
						<textarea class="form-control input" id="summernote" rows="10" name="tcontent" placeholder="내용을 입력해주세요"></textarea>
						<input type="hidden" name="tdate" value=sysdate>
						<input type="hidden" name="userid" value="${principal.username}">
						<input type="hidden" name="pno" value="${pno}">
						<div class="form-control">
							<input type="date" class="form-date" name="tstartdate" required="required">
							~
							<input type="date" class="form-date" name="tenddate" required="required">
						</div>
						<div align="center">
							<button class="btn btn-primary" type="submit">추가</button>
							<button class="btn btn-warning" type="reset">취소</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer ptask"></div>
		</div>
	</div>
</div>
<!-- 모달 -->
<script>
	const cloudinary = require('cloudinary').v2;
	
	//Configure your cloud name, API key and API secret:
	
	const myconfig = cloudinary.config({
	cloud_name: "dup9irkxd",
	api_key: "371128821948137",
	api_secret: "utt72ECxh7rpq4CPsbg01B5XyiM",
	secure: true
	});

</script>