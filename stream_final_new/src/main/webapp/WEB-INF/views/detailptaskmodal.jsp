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
									<div class=""></div>
								</div>
								<div class="form-control detail-content input tcontent"></div>
								<input type="hidden" name="pno">
								<input type="hidden" name="tno">
							</form>
							<div>
								<form class="wrap-reply">
									<div class="reply-input">
										<input type="text" class="form-control replyInput" name="rcontent" placeholder="댓글 입력창 - Enter 클릭 시 입력됩니다.">
										<input type="hidden" name="tno">
										<input type="hidden" name="userid" value="${principal.username}">
									</div>
									<div class="replyList">
<!--  -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$(document).on("mouseover", ".d-flex.align-items-start", function() {
	    $(this).find(".reply-btn").css("visibility", "visible");
	});

	$(document).on("mouseout", ".d-flex.align-items-start", function() {
	    $(this).find(".reply-btn").css("visibility", "hidden");
	});
	
function replyLoadList() {
	console.log(targetTno);
	$.ajax({
		url: "${pageContext.request.contextPath}/replyList",
		type: "get",
		data: {tno:targetTno},
		async : false,
		dataType: "json",
		success:function(result) {
			makeReplyList(result);
		},
			
			/* makeReplyList, */
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
				<small class="float-end text-navy">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle me-2 reply-btn replyEditBtn"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>			
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2 reply-btn replyDeleteBtn"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>
				</small>
				<strong>\${rl.userid}</strong><br>
				<p id="updateReply" value="\${rl.rcontent}" >\${rl.rcontent}</p>
				<input type="hidden" name="rno" value="\${rl.rno}">
				<small class="text-muted">\${rl.rdate}</small><br>
			</div>
		</div>
		<hr>
		`;
	}
	$(".replyList").html(replyHtml);
}

</script>
<script>
	
	$(".form-control.replyInput").keydown(function(event) {
		if(event.keyCode == 13) {
			event.preventDefault();
			insertReply();			
			$(".form-control.replyInput").val("");
		} else {
			null;
		}
	});
	
	function insertReply() {
		$.ajax ({
			url: "${pageContext.request.contextPath}/insertReply",
			type: "post",
			data: $(".wrap-reply").serialize(),
			dataType: "json",
			success: makeReplyList,
			error: function() {
				alert("insertReply에서 에러났습니다.");
			}
		});
	}
	
	$(document).on("click", ".replyEditBtn", function() {
		/* $(this).closest("p").html("<input type='text' class='form-control input' name='rcontent' placeholder='Enter 클릭 시 입력됩니다.'>"); */
		
		$(this).closest(".d-flex.align-items-start").find("P").html("<input type='text' class='form-control updateInputReply' id='updateReplyInput' name='rcontent' placeholder='수정할 내용 입력해주세요.'>");
		/* 수정 버튼 누르면 input창 생성 */
		

		<!--- 댓글 수정 기능 --->
		$(".form-control.updateInputReply").keydown(function(event) {

			if(event.keyCode == 13) {
				/* event.preventDefault(); */
				var targetRcontentUpdate = $(this).closest(".d-flex.align-items-start").find("#updateReplyInput").val();
				var confirm_val = confirm("댓글을 수정하시겠습니까?");
				if(confirm_val == true){
				    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
				    $.ajax({
						url: "${pageContext.request.contextPath}/doUpdateReply",
						type: "post",
						dataType: "json",
						data: {rno: targetRno, rcontent: targetRcontentUpdate},
						success: function(result) {
							alert("수정했습니다.");
							replyLoadList();
						},
						error: function() {
							alert("실패했습니다.");
						}
					});
				}else if(confirm_val == false){
					alert("수정 작업을 취소했습니다.");
					replyLoadList();
				}
			} else {
				null;
			}
		});
		
		var targetRno = $(this).closest(".d-flex.align-items-start").find("input[name=rno]").val();
		/* var targetRcontent = $(this).find("#updateReplyInput").val(); */
		var targetRcontent = $(this).closest(".d-flex.align-items-start").find("#updateReplyInput").val();

		console.log(targetRcontent);
		
 		$.ajax({
			url: "${pageContext.request.contextPath}/goUpdateReply",
			type: "post",
			dataType: "json",
			data: {rno: targetRno, rcontent: targetRcontent},
			success: function(result) {
				$("#updateReplyInput").val(result.rcontent);
			},
			error: function() {
				alert("ReplyUpdate에서 에러났습니다.");
			}
		});
 		
	});
	
	<!--- 댓글 삭제 기능 --->
	$(document).on("click", ".replyDeleteBtn", function() {
		var targetRno = $(this).closest(".d-flex.align-items-start").find("input[name=rno]").val();
		console.log(targetRno);

		var confirm_val = confirm("댓글을 삭제하시겠습니까?");
		if(confirm_val == true){
		    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
			$.ajax({
				url: "${pageContext.request.contextPath}/doDeleteReply",
				type: "post",
				dataType: "json",
				data: {rno: targetRno},
				success: function(result) {
					replyLoadList();
				},
				error: function() {
					alert("doDeleteReply에서 에러났습니다.");
				}
			});
		}else if(confirm_val == false){
			replyLoadList();
		}

	});
	
</script>

<!-- 모달 -->
