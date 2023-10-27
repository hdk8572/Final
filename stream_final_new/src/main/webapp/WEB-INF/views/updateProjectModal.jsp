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
						<input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요. - 20글자 제한" maxlength="20">
						<div class="wrap-selected">
							<div class="selected-leftPart">
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy="12 " r="10 "></circle><polyline points="12 6 12 12 16 14 "></polyline></svg>
									<input type="hidden" id="valuePstatus" name="pstatus"> <!-- js - selectOption() -->
									<select class="form-select mb-3 addProject" id="updateStatus" name="addpstatus">
									  <option class="status request" value="미진행">미진행</option>
									  <option class="status progress" value="진행">진행</option>
									  <option class="status remain" value="보류">보류</option>
									  <option class="status Hide" value="숨김">숨김</option>
									</select>					
								</div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle>
									</svg>
									<select class="form-select mb-3 updateProject selectedMember" name="mname" id="updateCompanyMember">
									<!--
										<option value="" selected="">asd</option>
										<option value="kh0001@kh.com">김사람대리님</option>
										<option value="kh0002@kh.com">임인간부장님</option>
										<option value="sample@kh.co.kr">가두리과장님</option>
										<option value="sple@kh.co.kr">황광뫙사장님</option>
										<option value="spam@kh.co.kr">임지연대리님</option>
										<option value="mplsam@kh.co.kr">정사원과장님</option>
									-->
									</select>
								</div>
							</div>
							<div class="selected-rightPart card updateProject">
							<!--  
								<div class="comanyMember">1</div>
								<div class="comanyMember">2</div>
								<div class="comanyMember">3</div>
								<div class="comanyMember">4</div>
								<div class="comanyMember">5</div>
								<div class="comanyMember">6</div>
							-->
							</div>
						</div>
						<!--
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
							<input type= "text" class= "form-control manager ml-2" name="mname" value="${principal.username}" readonly="readonly">
						</div>
						-->
						<textarea class="form-control input" id="summernote-update" rows="10" name="pcontent" placeholder="내용을 입력해주세요"></textarea>
						<input type="hidden" name="tdate">
						<input type="hidden" name="userid">
						<input type="hidden" name="pno">
						<div class="form-control">
							<input type="date" id="startUpdateModal" class="form-date" name="pstartdate" required="required">
							~
							<input type="date" id="endUpdateModal" class="form-date" name="penddate" required="required">
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
/*  
	$("select[id=updateStatus]").change(updateOption);

 	function updateOption() {
 	    var updatedOption = $("select[id=updateStatus] option:selected").text();
 	    console.log(updatedOption);
 	    $("#updateStatus").val(updatedOption);
	} 
*/
</script>
<script>
	function updateMemberList() {
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/member/getCompanyMemberList",
	    	// data : principal -controller
	    	data: {userid: useridJs},
	    	type: "get",
	    	async : false,
	    	dataType: "json",
	    	success: function(data) {
	    		makeUpdateMemberView(data);
	    		makeCurrentMemberView(data);
	    	},
	    	error: function() {	
			alert("getCompanyMemberList에서 에러났습니다.");
		}
	    });	
  		
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/member/getCurrentMemberList",
	    	data: {pno: $("input[name=pno]").val()},
	    	type: "get",
	    	dataType: "json",
	    	success: function(data) {
	    		makeCurrentMemberView(data);
	    	},
	    	error: function() {	
			alert("updateModal - getCurrentMemberList에서 에러났습니다.");
		}
	    });
		    
	}
 	/*   	
		function updateOption() {
		    var updatedOption = $("select[name=updatepstatus] option:selected").text();
		    $("#valuePstatus").val(updatedOption);
		   	console.log($("#valuePstatus").val(updatedOption));
		}
	*/
	
	function makeUpdateMemberView(data) {										 // 회사 소속인 참가자 리스트 조회
		var memberListHtml = "";
		/* memberListHtml += '<select class="form-select mb-3 selectCategory ml-2" name="mname">'; */
		// memberListHtml += '<option value="" selected>참가자선택</option>';
	    for(var i=0;i<data.length;i++){
			var memberOne = data[i];
			memberListHtml+=`
				<option value="\${memberOne.userid}">\${memberOne.mname}님</option>
				`;
	    }
		/* memberListHtml += '</select>'; */
	    $("#updateCompanyMember").html(memberListHtml);
	    /* $("#companyMember select[name=mname] option:eq(0)").prop("selected", true); */
	    
	    $(".form-select.mb-3.updateProject.selectedMember").change(updateMemberSelect);
	}
	
	function makeCurrentMemberView(data) {										// 현재 참여중인 참가자 리스트 조회
		var currentListHtml = "";
		for(var i=0; i<data.length; i++) {
			var currentMember = data[i];
			currentListHtml+=`
				<div class='comanyMember'>
					<input type="hidden" name="memberProjectArr" value="\${currentMember.userid}"> 	
					<span data-addmemberuserid='\${currentMember.userid}'>\${currentMember.mname}님</span>
					<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-delete align-middle me-2'><path d='M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z'></path><line x1='18' y1='9' x2='12' y2='15'></line><line x1='12' y1='9' x2='18' y2='15'></line></svg>
				</div>
			`;
		}
		$(".selected-rightPart.card.updateProject").html(currentListHtml);
		
		$(".feather.feather-delete.align-middle.me-2").click(function() {		// 현재 참여중인 참가자 삭제
	 		$(this).closest(".comanyMember").remove();
	 	});
	}
	
 	function updateMemberSelect() { // 중복 조회 (유효성검사) 
 		console.log("====updateMemberSelect 실행====");
 		var checkSelectedVal = $(".form-select.mb-3.updateProject.selectedMember").val();
		console.log("선택한 checkSelectedVal :"+checkSelectedVal);
 		//$(".form-select.mb-3.addProject.selectedMember").val(selectedVal);
 		var checkAddedUserId = false;	
 		$(".comanyMember").each(function(idx, thisElement){
 			var addeduserid = $(thisElement).children("span").data("addmemberuserid"); // 수정 버튼 눌렀을 때, 현재 목록에 있는 애들의 data값을 인식, 하지만 다 지워버리면 ? 읽을게 없어서 유효성을 벗어난다.
 			console.log("addeduserid :"+addeduserid);
 			console.log("checkSelectedVal :"+checkSelectedVal);
 			if(addeduserid == checkSelectedVal){
 				checkAddedUserId = true;
 				console.log("중복이라 추가 안했습니다.");
 				return false;
 			}
 			var addeduserid = $(thisElement).children("span").data("addmemberuserid");
 			if(addeduserid == checkSelectedVal){
 				checkAddedUserId = true;
 				console.log("중복이라 추가 안했습니다.");
 				return false;
 			}
 		});
 		if(!checkAddedUserId){ // 
			updateMemberadded(checkSelectedVal);
			console.log("중복이 아니여서 추가했습니다.");
 		}
 		console.log("====updateMemberSelect 종료====");
 	}
 	
 	function updateMemberadded() { // 참가자 클릭시 참가자 등록
		var selectedVal = $(".form-select.mb-3.updateProject.selectedMember option:checked").val();
		var addedmember = $(".form-select.mb-3.updateProject.selectedMember option:checked").text();
		var memberaddedHtml = "";
			memberaddedHtml+=`
				<div class='comanyMember'>
					<input type="hidden" name="memberProjectArr" value="\${selectedVal}"> 
					<span data-currememberuserid='\${selectedVal}'>\${addedmember}</span>
					<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-delete align-middle me-2'><path d='M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z'></path><line x1='18' y1='9' x2='12' y2='15'></line><line x1='12' y1='9' x2='18' y2='15'></line></svg>
				</div>
				`;
	    $(".selected-rightPart.card.updateProject").append(memberaddedHtml);
		$(".feather.feather-delete.align-middle.me-2").click(function() {		// 등록된 참가자 삭제
	 		$(this).closest(".comanyMember").remove();
	 	});
 	}
	

	
</script>
<script>

	$("#updateProjectModal").on("show.bs.modal", function() {
		//id='start','end'
		var startDateInput = document.getElementById('startUpdateModal');
		var endDateInput = document.getElementById('endUpdateModal');
		
		startDateInput.addEventListener('change', function() {
			compareDates();
		});
		
		endDateInput.addEventListener('change', function() {
			compareDates();
		});
		
		function compareDates() {
			var startDate = new Date(startDateInput.value);
			console.log(startDate);
			var endDate = new Date(endDateInput.value);
			console.log(endDate);
			if(endDate < startDate) {
				alert("입력한 종료일이 시작일보다 이전입니다. 올바른 날짜를 선택해 주세요.");
				
				endDateInput.value = ''; //종료일 입력필드 초기화
			}
		}
	});
	
	$('#summernote-update').on('summernote.keyup', function() {
	    var max = 200;
	    var length = $(this).summernote('code').replace(/<(?:.|\n)*?>/gm, '').length; // HTML 태그를 제외한 순수 텍스트의 글자수를 계산합니다.
	    if (length > max) {
	        alert('최대 글자수를 초과하였습니다.'); // 사용자에게 알림을 보냅니다.
	        $(this).summernote('editor.undo'); // 마지막으로 입력한 내용을 취소(제거)합니다.
	    }
	});


</script>