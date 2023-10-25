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
							<div class="detailPtaskTitle-title ">
								<b>프로젝트 상세 조회</b>
								<div>
									<button class="btn btn-primary updatePtask">수정</button>
								</div>
							</div>
							<div class="detailPtaskTitle-dropdown-group">
							<div class="dropdown">
							    <svg xmlns="http://www.w3.org/2000/svg" id="read-dropdown detailPtask" data-bs-toggle="dropdown" class="feather feather-more-vertical align-middle me-2 detailPtask" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item update" href="#">수정</a></li>
							    <li><a class="dropdown-item hide" href="#">삭제</a></li>
							  </ul>
							</div>
							<!--  
								<div class="btn-dropdown-toggle" id="read-dropdown" data-bs-toggle="dropdown">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical me-2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
								</div>
								<ul class="dropdown-menu detailPtask">
									<li><a class="dropdown-item">수정</a></li>
									<li><a class="dropdown-item">삭제</a></li>
								</ul>
							-->
					  		</div>
					  		
						</div>
						<div class="card-body detailPtaskTitle">
							<form class="Wrap-info">
								<div class="form-control ttitle"></div>
								<input type="hidden" name="tstatus">
								<div class="d-flex align-items-center first exist">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline>
									</svg>
									<div class= "form-control manager ml-2 tstatus"></div>					
								</div>
								<div class="d-flex align-items-center first new">	<!-- new -->
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy="12 " r="10 "></circle><polyline points="12 6 12 12 16 14 "></polyline></svg>
									<select class="form-select mb-3 selectCategory ml-2" id="updatePtaskTstatus" name="selectedTstatus">
										<option class="status request" value="미진행" name="미진행" >미진행</option>
										<option class="status progress" value="진행" name="진행">진행</option>
										<option class="status remain" value="보류" name="보류">보류</option>
									</select>					
								</div>
								<input type="hidden" name="tmember">
								<div class="d-flex align-items-center second exist">	 <!-- exist -->
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r= "4"/>
									</svg>
									<div class= "form-control manager ml-2 mname">
									</div>
									<div class=""></div>
								</div>
								<div class="d-flex align-items-center second new">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle>
									</svg>
									<select class="form-select mb-3 selectCategory ml-2" id="updateTaskMember">
									</select>
								</div>
								<div class="form-control detail-content input tcontent"></div>
								<div class="form-control">
									<input type="date" id="start" class="form-date" name="tstartdate" required="required" readonly>
									~
									<input type="date" id="end" class="form-date" name="tenddate" required="required" readonly>
								</div>
								<input type="hidden" name="pno">
								<input type="hidden" name="tno">
							</form>
							<div>
								<form class="wrap-reply" action="${pageContext.request.contextPath}/doUpload" method="post" enctype="multipart/form-data">
									<div class="reply-input">
										<input type="text" class="form-control replyInput" name="rcontent" placeholder="댓글을 입력해주세요 - Enter 클릭 시 입력됩니다.">
										<input type="hidden" name="tno">
										<input type="hidden" name="userid">
									</div>
									<div class="replyList">
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
	
	$(document).ready(function() {
	    // 모달 관련 코드

	    // 모달이 닫힐 때 입력한 값 초기화와 이벤트 초기화
	    $('#detailProjectModal').on('hidden.bs.modal', function (e) {
	        // Reset form values
	        $(this).find("form")[0].reset();

	        // Reset contenteditable fields
	        $(this).find("[contenteditable=true]").text("");
	        $(this).find("[contenteditable=true]").prop("contenteditable", false);

	        // Reset dropdowns to their first option
	        $(this).find("select").prop('selectedIndex',0);

	        // Hide the update button again
	        $(".btn.btn-primary.updatePtask").css("visibility", "hidden");

	        // Switch back to display mode for exist fields and hide new fields 
		    $(".d-flex.align-items-center.first.exist").css("display", "flex");
		    $(".d-flex.align-items-center.second.exist").css("display", "flex");
		    $(".d-flex.align-items-center.first.new").css("display", "none");
		    $(".d-flex.align-items-center.second.new").css("display", "none");

		    // Make date inputs readonly again
		    $(".Wrap-info input[name=tstartdate]").prop("readonly", true);
		    $(".Wrap-info input[name=tenddate]").prop("readonly", true);
	    });

	});
	
	
function replyLoadList(targetTno) {
	console.log(targetTno);
	$.ajax({
		url: "${pageContext.request.contextPath}/member/replyList",
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
			url: "${pageContext.request.contextPath}/member/insertReply",
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
		
		
		<!--- 댓글 수정 기능 --->
		$(".form-control.updateInputReply").keydown(function(event) {
			
			var targetTno = $(".wrap-reply input[name=tno]").val();
			if(event.keyCode == 13) {
				/* event.preventDefault(); */
				var targetRcontentUpdate = $(this).closest(".d-flex.align-items-start").find("#updateReplyInput").val();
				var confirm_val = confirm("댓글을 수정하시겠습니까?");
				if(confirm_val == true){
				    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
				    $.ajax({
						url: "${pageContext.request.contextPath}/member/doUpdateReply",
						type: "post",
						dataType: "json",
						data: {rno: targetRno, rcontent: targetRcontentUpdate, tno:targetTno},
						success: function(result) {
							replyLoadList(targetTno);
						},
						error: function() {
							alert("doUpdateReply에서 에러 발생");
						}
					});
				}else if(confirm_val == false){
					alert("수정 작업을 취소했습니다.");
					replyLoadList(targetTno);
				}
			} else {
				null;
			}
		});
		
		var targetRno = $(this).closest(".d-flex.align-items-start").find("input[name=rno]").val();
		/* var targetRcontent = $(this).find("#updateReplyInput").val(); */
		var targetRcontent = $(this).closest(".d-flex.align-items-start").find("#updateReplyInput").val();

		
 		$.ajax({
			url: "${pageContext.request.contextPath}/member/goUpdateReply",
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
		
		var targetTno = $(".wrap-reply input[name=tno]").val();
		var targetRno = $(this).closest(".d-flex.align-items-start").find("input[name=rno]").val();
		var confirm_val = confirm("댓글을 삭제하시겠습니까?");
		if(confirm_val == true){
		    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
			$.ajax({
				url: "${pageContext.request.contextPath}/member/doDeleteReply",
				type: "post",
				dataType: "json",
				data: {rno: targetRno, tno:targetTno},
				success: function(result) {
					replyLoadList(targetTno);
				},
				error: function() {
					alert("doDeleteReply에서 에러났습니다.");
				}
			});
		}else if(confirm_val == false){
			replyLoadList(targetTno);
		}
	});
	
	$(document).on('click', '.dropdown-item.hide', function() {
		var targetTno = $(".wrap-reply input[name=tno]").val();
		console.log("삭제할 놈 : "+ targetTno);
		var confirm_val = confirm("삭제하시겠습니까?");
		if(confirm_val == true){
		    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
			$.ajax({
				url: "${pageContext.request.contextPath}/member/updateTstatusHide",
				type: "post",
				data: {tno: targetTno},
				dataType: "json",
				success: function() {
					loadPtaskList();
					$('#detailProjectModal').modal('hide');
				},
				error: function(error) {
					console.log("updateTstatusHide 실패");
				}
			});
		}else if(confirm_val == false){
		}
});
	
</script>
<script>
	
	$(".dropdown-item.update").on("click", updateFunction);
	$(".btn.btn-primary.updatePtask").on("click", applyEditFunction);
	
	
	
	
	// <수정> 눌렀을 때 수정창으로 변경
	function updateFunction() {
		var currentTstatus = $(".form-control.manager.ml-2.tstatus").text();
		var currentTmember = $(".form-control.manager.ml-2.mname").val();
		console.log("currentTstatus :"+currentTstatus);


		$(".btn.btn-primary.updatePtask").css("visibility", "visible");

		$(".d-flex.align-items-center.first.exist").css("display", "none");
		$(".d-flex.align-items-center.second.exist").css("display", "none");
		$(".form-control.ttitle").attr("contenteditable", "true");
		$(".form-control.detail-content.input.tcontent").attr("contenteditable", "true");
		$(".d-flex.align-items-center.first.new").css("display", "flex");
		$(".d-flex.align-items-center.second.new").css("display", "flex");
		$(".Wrap-info input[name=tstartdate]").prop("readonly", false);
		$(".Wrap-info input[name=tenddate]").prop("readonly", false);
	
		$("#updatePtaskTstatus").val(currentTstatus).prop("selected", true);		// 입력된 것을 읽기
		$("input[name=tstatus]").val(currentTstatus);
		
		$("#updateTaskMember").val(currentTmember).prop("selected", true);
		$("input[name=tmember]").val(currentTmember);
		

		$("select[id=updatePtaskTstatus]").change(function() {
			var changedTstatus =$("#updatePtaskTstatus option:selected").val();
			$("input[name=tstatus]").val(changedTstatus);
		});		
		
		$("select[id=updateTaskMember]").change(function() {
			var changedTaskMember = $("#updateTaskMember option:selected").val();
			$("input[name=tmember]").val(changedTaskMember);
		});
		
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/member/getCurrentMemberList",
	    	data: {pno: $("input[name=pno]").val()},
	    	type: "get",
	    	dataType: "json",
	    	success: function(data) {
	    		updateTaskMemberView(data);
	    		console.log("성공");
	    	},
	    	error: function() {	
			alert("selectOption에서 에러났습니다.");
		}
	    });
		
	}
	
	
	
	function updateTaskMemberView(data) { // 회사 소속인 참가자 리스트 조회
		
		var memberUpdateTaskListHtml = "";
	    	for(var i=0;i<data.length;i++){
				var memberOne = data[i];
				memberUpdateTaskListHtml+=`
				<option value="\${memberOne.userid}">\${memberOne.mname}\${memberOne.mrank}님</option>
				`;
	    }
	    $("#updateTaskMember").html(memberUpdateTaskListHtml);
		var currentTmember = $(".form-control.manager.ml-2.mname").val();
		console.log("currentTmember :"+currentTmember);
		
		$("#updateTaskMember").val(currentTmember).prop("selected", true);
		$("#updatePtaskTstatus option:selected").val(currentTmember);
	}
	
	function applyEditFunction() {
		var changedTstatus = $(".Wrap-info input[name=tstatus]").val();
	    console.log("changedTstatus :"+changedTstatus);
	    var changedTmember = $(".Wrap-info input[name=tmember]").val();
	    console.log("changedTmember :"+changedTmember);
	    
		$(".form-control.ttitle").attr("contenteditable", "false");
		$(".form-control.detail-content.input.tcontent").attr("contenteditable", "false");
		$(".d-flex.align-items-center.first.new").css("display", "none");
		$(".d-flex.align-items-center.second.new").css("display", "none");
		$(".d-flex.align-items-center.first.exist").css("display", "flex");
		$(".d-flex.align-items-center.second.exist").css("display", "flex");
		$(".Wrap-info input[name=tstartdate]").attr("readonly", true);
		$(".Wrap-info input[name=tenddate]").attr("readonly", false);
		
		
		var confirm_val = confirm("수정 하시겠습니까?");
		if(confirm_val == true){
		    <!--- 확인 or yes 버튼을 눌렀을 때 실행 될 함수 구현 --->
		    
			$(".d-flex.align-items-center.first.exist").val(changedTstatus);
			$(".d-flex.align-items-center.second.exist").val(changedTmember);
			
			$(".btn.btn-primary.updatePtask").css("visibility", "hidden");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/member/updateDetailProject",
				data: "get",
				dataType: "json",
				data: {
					pno: $(".Wrap-info [name=pno]").val(),
					tno: $(".Wrap-info [name=tno]").val(),
					tmember: $("input[name=tmember]").val(),
					ttitle: $(".form-control.ttitle").text(),
					tcontent: $(".form-control.detail-content.input.tcontent").text(),
					tstatus: $("input[name=tstatus]").val(),
					tstartdate: $(".Wrap-info input[name=tstartdate]").val(),
					tenddate: $(".Wrap-info input[name=tenddate]").val()
				},
				success: function() {
					$("#detailProjectModal").modal("hide");
					loadPtaskList();		    		
		    	},
		    	error: function() {	
				alert("updateDetailProject에서 에러났습니다.");
			}
			});
			
		}else if(confirm_val == false){
		}

	}
	


</script>

