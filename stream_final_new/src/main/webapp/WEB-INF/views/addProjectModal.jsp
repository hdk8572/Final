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
						<input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요." required="required">
						<div class="wrap-selected">
							<div class="selected-leftPart">
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
									<input type="hidden" id="valuePstatus" name="pstatus"> <!-- js - selectOption() -->
									<select class= "form-select mb-3 addProject" name="addpstatus">
									  <option class="status request" value="요청" selected="selected">미진행</option>
									  <option class="status progress" value="진행">진행</option>
									  <!-- <option class="status complete" value="완료">숨김</option> -->
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
							<div class="selected-rightPart card">
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
							<input type="date" class="form-date" name="pstartdate" required="required">
							~
							<input type="date" class="form-date" name="penddate" required="required">
						</div>
						<div align="center">
							<button class="btn btn-primary" id="btn-submit" type="submit">추가</button>
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
    //$("select[name=updatepstatus]").change(updateOption);
    
	function addList () {
//		var data = myEditor.getData();
//		$("[name=pcontent]").val(data);
		console.log($("[name=mname]").val())
		console.log($("#addProject").serialize());  // "n1=v1&n2=v2"&pcontent=rkqdfjklfjlddfld   // memberProjectArr=a&memberProjectArr=b
		$.ajax ({
			url: "${pageContext.request.contextPath}/member/projectInsert",
			type: "post",
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
	}
	
 	function selectOption() {
 	    var selectedOption = $("select[name=addpstatus] option:selected").text();
 	    $("#valuePstatus").val(selectedOption);
 	    $.ajax({
 	    	url:"${pageContext.request.contextPath}/member/getCompanyMemberList",
 	    	// data : principal -controller
 	    	data: {userid: useridJs},
 	    	type: "get",
 	    	dataType: "json",
 	    	success: makeMemberView,
 	    	error: function() {	
				alert("selectOption에서 에러났습니다.");
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
	function makeMemberView(data) {
		var memberListHtml = "";
		/* memberListHtml += '<select class="form-select mb-3 selectCategory ml-2" name="mname">'; */
		memberListHtml += '<option value="" selected>참가자선택</option>';
	    for(var i=0;i<data.length;i++){
			var memberOne = data[i];
			memberListHtml+=`
				<option value="\${memberOne.userid}">\${memberOne.mname}\${memberOne.mrank}님</option>
				`;
	    }
		/* memberListHtml += '</select>'; */
	    $("#companyMember").html(memberListHtml);
	    /* $("#companyMember select[name=mname] option:eq(0)").prop("selected", true); */
	    
	    $(".form-select.mb-3.addProject.selectedMember").change(memberSelect);
	}
	
	
	
 	function memberSelect() {
 		var selectedVal = $(".form-select.mb-3.addProject.selectedMember").val();
 		console.log("선택한 selectedVal :"+selectedVal);
 		//$(".form-select.mb-3.addProject.selectedMember").val(selectedVal);
 		var checkAddedUserId = false;
 		$(".comanyMember").each(function(idx, thisElement){
 			var addeduserid = $(thisElement).children("span").data("addmemberuserid");
 			console.log(addeduserid);
 			if(addeduserid == selectedVal){
 				checkAddedUserId = true;
		 		return;
 			}
 		});
 		if(!checkAddedUserId){ // 
			memberadded(selectedVal);
 		}
 		/*
 		$.ajax({
 			url:"${pageContext.request.contextPath}/member/addCompanyMemberList",
 			type: "post",	
 			data: {userid: selectedVal},
 			dataType: "json",
 			success: function() {
 				console.log("성공");
 			},
 	    	error: function() {	
				alert("addCompanyMemberList에서 에러났습니다.");
			}
 		});
 		  */
 		  /*
 		$.ajax({
 			url:"${pageContext.request.contextPath}/member/selectOneMember",
 			type: "get",
 			data: {userid: selectedVal},
 			dataType: "json",
 			success: function(data) {
 				console.log("선택된 data.userid :"+data.userid);
 				memberadded(data);
 			},
 	    	error: function() {	
				alert("selectOneMember에서 에러났습니다.");
			}
 		});
 		 */
 	}
 	
 	function memberadded() {
		var selectedVal = $(".form-select.mb-3.addProject.selectedMember option:checked").val();
		var addedmember = $(".form-select.mb-3.addProject.selectedMember option:checked").text();
		var memberaddedHtml = "";
			memberaddedHtml+=`
				<div class='comanyMember'>
					<input type="hidden" name="memberProjectArr" value="\${selectedVal}"> 
					<span data-addmemberuserid='\${selectedVal}'>\${addedmember}</span>
					<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-delete align-middle me-2'><path d='M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z'></path><line x1='18' y1='9' x2='12' y2='15'></line><line x1='12' y1='9' x2='8' y2='15'></line></svg>
				</div>
				`;
		/* memberListHtml += '</select>'; */
	    $(".selected-rightPart.card").append(memberaddedHtml);
 	}
 	
 	
</script>


<!-- 모달 -->
