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
						<form action="${pageContext.request.contextPath}/member/insertPtask" id="addPtaskFrm" method="post" encType="multipart/form-data">					
						<input type="text" class="form-control title" name="ttitle" placeholder="업무명을 입력해주세요. - 20글자 제한" maxlength="20">
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
							<input type="hidden" name="tstatus">
							<select class= "form-select mb-3 selectCategory ml-2" name="selectedTstatus">
								<option class="status request" value="미진행" name="미진행">미진행</option>
								<option class="status progress" value="진행" name="진행">진행</option>
								<option class="status remain" value="보류" name="보류">보류</option>
							</select>					
						</div>
						<div class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
							  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
							</svg>
						<!--<input type="text" class= "form-control manager ml-2" name="tmember" placeholder= "담당자">-->
							<select class="form-select mb-3 selectCategory ml-2" name="tmember" id="taskmember">
								<!-- 프로젝트 리스트 0-->
								<option value="placeholder">담당자 선택</option>
							</select>
							<input type="file" class= "btn btn-primary fileUploadBtn" name="upload" >
						</div>
						<textarea class="form-control input" id="summernote" rows="10" name="tcontent" placeholder="내용을 입력해주세요"></textarea>
						<input type="hidden" name="tdate" value=sysdate>
						<input type="hidden" name="userid" value="${principal.username}">
						<input type="hidden" name="pno" value="${pno}">
						<div class="form-control">
							<input type="date" id="start" class="form-date" name="tstartdate" required="required">
							~
							<input type="date" id="end" class="form-date" name="tenddate" required="required">
						</div>
						<div align="center">
							<button class="btn btn-primary" id="addPtaskBtn" type="button">추가</button>
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

<script>

	$(".modal.ptask #addPtaskBtn").on("click", function() {
    	/* addPtaskModal 유효성 적용 */
		if($("#addPtaskFrm .form-control.title").val() == "")
		{alert("업무명을 입력해주세요!");	return}
		else if($("#addPtaskFrm select[id=taskmember]").val() == "placeholder")
		{alert("업무 담당자를 지정해주세요!");	return}
		else if($(".note-editable").text() == '')
		{alert("업무 내용을 입력해주세요!");	return}
		else if($("#addPtaskFrm #start").val() == "" || $("#addPtaskFrm #end").val() == "")
		{alert("시작날짜 또는 종료날자를 지정해주세요!");	return}
		
		$("#addPtaskFrm").submit();
	});

	function selectOptionPtask() { // 추가+ 버튼을 누르면 실행되는 메서드
		    
			$("input[name=tstatus]").val("미진행");	
	
			$("select[name=selectedTstatus]").change(function() {
				var selectedOption = $("select[name=selectedTstatus] option:selected").val();
				$("input[name=tstatus]").val(selectedOption);
			});
			console.log(useridJs);
		    $.ajax({
		    	url:"${pageContext.request.contextPath}/member/getCurrentMemberList",
		    	data: {pno: $("input[name=pno]").val()},
		    	type: "get",
		    	dataType: "json",
		    	success: function(data) {
		    		makeTaskMemberView(data);
		    		console.log("성공");
		    	},
		    	error: function() {	
				alert("selectOption에서 에러났습니다.");
			}
		    });
	}
		
	function makeTaskMemberView(data) { // 회사 소속인 참가자 리스트 조회
		
		var memberTaskListHtml = "";
			memberTaskListHtml += '<option value="placeholder" selected>담당자 선택</option>';
	    	for(var i=0;i<data.length;i++){
				var memberOne = data[i];
			memberTaskListHtml+=`
				<option value="\${memberOne.userid}">\${memberOne.mname}\${memberOne.mrank}님</option>
				`;
	    }
		/* memberListHtml += '</select>'; */
	    $("#taskmember").html(memberTaskListHtml);
	    /* $("#companyMember select[name=mname] option:eq(0)").prop("selected", true); */
	    // $(".form-select.mb-3.addProject.selectedMember").change(memberSelect);
	    
	    $('#summernote').on('summernote.keyup', function() {
		    var max = 200;
		    var length = $(this).summernote('code').replace(/<(?:.|\n)*?>/gm, '').length; // HTML 태그를 제외한 순수 텍스트의 글자수를 계산합니다.
		    if (length > max) {
		        alert('최대 글자수를 초과하였습니다.'); // 사용자에게 알림을 보냅니다.
		        $(this).summernote('editor.undo'); // 마지막으로 입력한 내용을 취소(제거)합니다.
		    }
		});	
	    
	}

	
	
</script>