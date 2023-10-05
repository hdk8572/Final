<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달 -->
<!-- The Modal -->
<div id="detailProjectModal" class="modal project right fade"	aria-labelledby="myModalLabel">
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
						<div class="card-body detailPtaskTitle">
							<form>
								<div class="form-control ttitle"></div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline>
									</svg>
									<div class= "form-control manager ml-2 tstatus"></div>					
								</div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r= "4"/>
									</svg>
									<div class= "form-control manager ml-2 userid"></div>
								</div>
								<div class="form-control detail-content input tcontent"></div>
								<input type="hidden" name="pno">
								<input type="hidden" name="tno">
							</form>
							<div>
								<div class="wrap-reply">
									<div class="replyList">
<!--  -->
									</div>
									<div class="reply-input">
										<input type="text" class="form-control input" name="rcontent" placeholder="Input">
										<input type="hidden" name="tno">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

function replyLoadList() {
	console.log("replyLoadList 호출");
	console.log(targetTno);
	$.ajax({
		url: "${pageContext.request.contextPath}/replylista",
		type: "get",
		data: {tno:targetTno},
		async : false,
		dataType: "json",
		success: makeReplyList,
		error: function() {
			alert("replyLoadList에서 에러났습니다.");
		}
	});
	console.log("replyLoadList 실행");
}

function makeReplyList(data) {
	var replyHtml = "";
	for(var i=0; i<data.length; i++) {
		var rl = data[i];
		replyHtml+=`
		<div class="d-flex align-items-start">
			<img src="img/avatars/avatar-5.jpg" width="36" height="36" class="rounded-circle me-2" alt="Vanessa Tucker">
			<div class="flex-grow-1">
				<small class="float-end text-navy">5m ago</small>
				<strong>\${rl.userid}</strong><br>
				<p>\${rl.rcontent}</p>
				<small class="text-muted">Today 7:51 pm</small><br>
			</div>
		</div>
		`;
	}
	$(".replyList").html(replyHtml);
}

/* function makeReplyList(data) {
	var replyHtml = "";
	for(var i=0; i<data.length; i++) {
		var rl = data[i];
		replyHtml+=`
		<li>
			<div>
				<p>\${rl.userid}</p>
				<p>\${rl.rcontent}</p>
			</div>
		</li>
		`;
	}
	$(".replyList").html(replyHtml);
} */


</script>
<script>
	
	$(".form-control.input").keydown(function(event) {
		if(event.keyCode == 13) {
			event.preventDefault();
			console.log("Enter 입력됨");
			insertReply();			
		} else {
			null;
		}
	});
	
	function insertReply() {
		console.log("댓글 추가");
		console.log(targetTno);
		$.ajax ({
			url: "${pageContext.request.contextPath}/insertReply",
			type: "post",
			data: {tno:targetTno},
			dataType: "json",
			success: makeReply,
			error: function() {
				alert("insertReply에서 에러났습니다.");
			}
		});
	}
	
	function makeReply(data) {
		console.log(data);	
	}

</script>

<!-- 모달 -->
