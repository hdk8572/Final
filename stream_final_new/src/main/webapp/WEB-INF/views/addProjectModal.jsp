<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!-- 모달 -->
<!-- The Modal -->
<div id="addProjectModal" class="modal project right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog addProject">
		<!-- Modal content -->
		<div class="modal-content addProject">
			<div class="modal-header addProject"></div>
			<div class="modal-body addProject">
				<div class="wrap-card">
					<div class="card-body addProjectTitle">
					<div class="card-header addProjectTitle">
						<h2 class="addProjectTitle"><b>프로젝트 등록</b></h2>
					</div>
						<form id="addProject">					
						<input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요. - 20글자 제한" required="required" maxlength="20">
						<div class="wrap-selected">
							<div class="selected-leftPart">
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
									<input type="hidden" id="valuePstatus" name="pstatus"> <!-- js - selectOption() -->
									<select class= "form-select mb-3 addProject" name="addpstatus">
									<option class="status request" value="미진행">미진행</option>
									  <option class="status progress" value="진행">진행</option>
									  <option class="status remain" value="보류">보류</option>
									</select>					
								</div>
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
									  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
									</svg>
									<select class="form-select mb-3 addProject selectedMember" name="mname" id="companyMember">
										<!--
										<option>a
										<option>b
										<option>c
										<option>d
										-->
									</select>
								</div>
							</div>
							<div class="selected-rightPart card addproject">
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
						<textarea class="form-control input" id="summernote" rows="10" name="pcontent" placeholder="프로젝트에 관한 설명을 입력해주세요"></textarea>
						<input type="hidden" name="userid" value="${principal.username}">
						<input type="hidden" name="paccess" value="ACCESS"><!-- 세션에서 권한 선택 -->
						
						<div class="form-control">
							<input type="date" class="form-date" id="start" name="pstartdate" required="required">
							~
							<input type="date" class="form-date" id="end" name="penddate" required="required">
						</div>
						<div align="center">
							<button class="btn btn-primary" id="btn-submit" type="button">추가</button>
							<button class="btn btn-warning" type="reset">취소</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- <div class="modal-footer ptask"></div> -->
		</div>
	</div>
</div>
<script>
	$("#btn-submit").click(addList);
	$("#myBtn").click(selectOption);
    $("select[name=addpstatus]").change(selectOption);
    /* $("select[name=updatepstatus]").change(updateOption); */
    
	function addList () {
    	/* addProjectModal 유효성 적용 */
		if($(".form-control.title").val() == "")
		{alert("프로젝트명을 입력해주세요!");	return}
		else if($(".comanyMember").length == 0)
		{alert("프로젝트 참가자를 지정해주세요!");	return}
		else if($("#start").val() == "" || $("#end").val() == "")
		{alert("시작날짜 또는 종료날자를 지정해주세요!");	return}
		
		$.ajax ({
			url: "${pageContext.request.contextPath}/member/projectInsert",
			type: "post",
			//async:false,
			data : $("#addProject").serialize(),
			dateType: "json",
			success: function(result){
				console.log("addlist :"+result);
				makeView(result);
				$(".modal").modal("hide");
			},
			error: function() {	
				alert("addList에서 에러났습니다.");
			}
		});	
		$(".comanyMember").remove();
	}
	
 	function selectOption() { // 추가+ 버튼을 누르면 실행되는 메서드
 	    
 		var selectedOption = $("select[name=addpstatus] option:selected").val();
 		console.log("selectedOption :"+selectedOption);
		$("#valuePstatus").val(selectedOption);
 	    $.ajax({
 	    	url:"${pageContext.request.contextPath}/member/getCompanyMemberList",
 	    	data: {userid: useridJs},
 	    	type: "get",
 	    	dataType: "json",
 	    	success: function(data) {
 	    		makeMemberView(data);
 	    	},
 	    	error: function() {	
				alert("selectOption에서 에러났습니다.");
			}
 	    });
	}
 	
	function makeMemberView(data) { // 회사 소속인 참가자 리스트 조회
		var memberListHtml = "";
		/* memberListHtml += '<select class="form-select mb-3 selectCategory ml-2" name="mname">'; */
		memberListHtml += '<option value="" selected>참가자선택</option>';
	    for(var i=0;i<data.length;i++){
			var memberOne = data[i];
			memberListHtml+=`
				<option value="\${memberOne.userid}">\${memberOne.mname}님</option>
				`;
	    }
		/* memberListHtml += '</select>'; */
	    $("#companyMember").html(memberListHtml);
	    /* $("#companyMember select[name=mname] option:eq(0)").prop("selected", true); */
	    $(".form-select.mb-3.addProject.selectedMember").change(memberSelect);
	    
	}
	
	
	
 	function memberSelect() { // 중복 조회 (유효성검사) 
 		var selectedVal = $(".form-select.mb-3.addProject.selectedMember").val();
 		// console.log("선택한 selectedVal :"+selectedVal); 삭제하자
 		$(".form-select.mb-3.addProject.selectedMember").val(selectedVal);
 		var checkAddedUserId = false;													
 		$(".comanyMember").each(function(idx, thisElement){
 			// var addeduserid = $(thisElement).children("span").data("addmemberuserid");
 			var addeduserid = $(thisElement).find("input[name='memberProjectArr']").val();
 			// console.log(addeduserid);  삭제하자 
 			if(addeduserid == selectedVal){
 				checkAddedUserId = true;
 				console.log("중복이라 추가 안했습니다.");
 				event.preventDefault();
 				return false;
 			}
 		});
 		//if(!checkAddedUserId){ //
		if(!checkAddedUserId && selectedVal !== ""){ // 
 			memberAdded(selectedVal);
			console.log("중복이 아니여서 추가했습니다.");
 		}
 	}
 	
 	function memberAdded() { // 참가자 클릭시 참가자 등록
		var selectedVal = $(".form-select.mb-3.addProject.selectedMember option:checked").val();
		var addedmember = $(".form-select.mb-3.addProject.selectedMember option:checked").text();
		console.log("selectedVal :"+selectedVal);
		console.log("addedmember :"+addedmember);
		var memberaddedHtml = "";
			memberaddedHtml+=`
				<div class='comanyMember'>
					<input type="hidden" name="memberProjectArr" value="\${selectedVal}"> 
					<span data-addmemberuserid='\${selectedVal}'>\${addedmember}</span>
					<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-delete align-middle me-2'><path d='M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z'></path><line x1='18' y1='9' x2='12' y2='15'></line><line x1='12' y1='9' x2='18' y2='15'></line></svg>
				</div>
				`;
	    $(".selected-rightPart.card.addproject").append(memberaddedHtml);
	    
		$(".feather.feather-delete.align-middle.me-2").click(function() {
	 		console.log("삭제");
	 		$(this).closest(".comanyMember").remove();
	 	});
 	}
 	
</script>
<script>
//id='start','end'
		var startDateInput = document.getElementById('start');
		var endDateInput = document.getElementById('end');
		
		startDateInput.addEventListener('change', function() {
			compareDates();
		});
		
		endDateInput.addEventListener('change', function() {
			compareDates();
		});
		
		function compareDates() {
			var startDate = new Date(startDateInput.value);
			var endDate = new Date(endDateInput.value);
			
			if(endDate < startDate) {
				alert("입력한 종료일이 시작일보다 이전입니다. 올바른 날짜를 선택해 주세요.");
				
				endDateInput.value = ''; //종료일 입력필드 초기화
			}
		}
</script>
<script>
	$('#summernote').on('summernote.keyup', function() {
	    var max = 200;
	    var length = $(this).summernote('code').replace(/<(?:.|\n)*?>/gm, '').length; // HTML 태그를 제외한 순수 텍스트의 글자수를 계산합니다.
	    if (length > max) {
	        alert('최대 글자수를 초과하였습니다.'); // 사용자에게 알림을 보냅니다.
	        $(this).summernote('editor.undo'); // 마지막으로 입력한 내용을 취소(제거)합니다.
	    }
	});
</script>
<script>
$("#addProjectModal").on('hidden.bs.modal', function() {
    // 모달이 닫히면 실행될 코드를 여기에 작성합니다.
    
    // 예를 들어, 폼 내용을 초기화하려면 아래와 같이 작성할 수 있습니다.
    $('#addProject')[0].reset();

    // 참가자 목록을 초기화하려면 아래와 같이 작성할 수 있습니다.
    $(".comanyMember").remove();

    // summernote 내용을 초기화하려면 아래와 같이 작성할 수 있습니다.
    $('#summernote').summernote('reset');

    // 이 외에도 필요한 초기화 작업을 추가로 작성할 수 있습니다.
});
</script>

<!-- 모달 -->
