<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달 -->
<!-- The Modal -->
<div id="detailProjectModal" class="modal project right fade"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog addProject">
		<!-- Modal content -->
		<div class="modal-content detailPtask">
			<div class="modal-header detailPtask"></div>
			<div class="modal-body detailPtask">
				<div class="wrap-card">
					<div class="card-body detailPtaskTitle">
						<div class="card-header detailPtaskTitle">
							<h2 class="detailPtaskTitle">
								<b>프로젝트 상세 조회</b>
							</h2>
						</div>
						<div>
							<form>
								<div class="form-control ttitle"></div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
									<div class= "form-control manager ml-2 tstatus"></div>					
								</div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
									</svg>
									<div class= "form-control manager ml-2 userid"></div>
								</div>
								<div class="form-control detail-content input tcontent" rows="10"></div>
								<div class="form-control">
									<input type="date" class="form-date tstartdate" name="tstartdate" readonly="readonly">
									~
									<input type="date" class="form-date tenddate" name="tenddate" readonly="readonly">
								</div>
								<div align="center">
									<button class="btn btn-primary detailptask" id="update-ptask" type="button">수정</button>
									<button class="btn btn-warning">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="modal-footer ptask"></div> -->
		</div>
	</div>
</div>
<script>

	$("#update-ptask").click(function() {
		$("#update-ptask").text("등록");
		$(".form-control.manager.ml-2.tstatus").html("<select class= 'form-select mb-3 selectCategory ml-2' name='tstatus'>");
	});

</script>

<!-- 모달 -->