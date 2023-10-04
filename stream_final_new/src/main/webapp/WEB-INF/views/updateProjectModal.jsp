<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
<!-- The Modal -->
<div class="modal" id="updateProjectModal">
  	<div class="modal-dialog updateProject">
		<!-- Modal content -->
		<div class="modal-content updateProject">
			<div class="modal-header updateProject"></div>
			<div class="modal-body updateProject">
				<div class="wrap-card">
					<div class="card-body updateProjectTitle">
					<div class="card-header updateProjectTitle">
						<h2 class="updateProjectTitle"><b>프로젝트 수정</b></h2>
					</div>
						<form id="infoProject">					
						<input type="text" class="form-control title" name="pname" placeholder="제목을 입력하세요.">
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
							<input type="hidden" id="updateStatus" name="pstatus">
							<select class= "form-select mb-3 selectCategory ml-2 " id="updateStatus">
							  <option class="status request" selected="selected">미진행</option>
							  <option class="status progress">진행</option>
							  <option class="status remain">보류</option>
							  <option class="status hide">숨김</option>
							</select>					
						</div>
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
							  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
							</svg>
							<input type= "text" class= "form-control manager ml-2" name="mname">
						</div>
						<textarea class="form-control input" id="summernote-update" rows="10" name="pcontent" placeholder="내용을 입력해주세요"></textarea>
						<input type="hidden" name="tdate">
						<input type="hidden" name="userid">
						<input type="hidden" name="pno">
						<div class="form-control">
							<input type="date" id="updateDate" class="form-date" name="pstartdate" required="required">
							~
							<input type="date" id="updateDate" class="form-date" name="penddate" required="required">
						</div>
						<div align="center">
							<button class="btn btn-primary" id="updateBtn" type="button">수정</button>
							<button class="btn btn-warning" type="reset">취소</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("select[id=updateStatus]").change(updateOption);

	function updateOption() {
 	    var updatedOption = $("select[id=updateStatus] option:selected").text();
 	    console.log(updatedOption);
 	    $("#updateStatus").val(updatedOption);
	}
</script>