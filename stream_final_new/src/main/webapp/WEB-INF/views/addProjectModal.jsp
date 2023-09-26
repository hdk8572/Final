<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<!-- The Modal -->
<div id="addProjectModal" class="modal project right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog addProject">
		<!-- Modal content -->
		<div class="modal-content addProject">
			<div class="modal-header addProject"></div>
			<div class="modal-body addProject">
				<div class="card">
					<div class="card-body addProjectTitle">
					<div class="card-header addProjectTitle">
						<h2 class="addProjectTitle"><b>프로젝트 등록</b></h2>
					</div>
						<form id="addProject">					
						<input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요." required="required">
						<br>
						<span class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock align-middle me-2"><circle cx="12" cy= "12 " r= "10 "></circle><polyline points= "12 6 12 12 16 14 "></polyline></svg>
							<input type="hidden" id="valuePstatus" name="pstatus"> <!-- js - selectOption() -->
							<select class= "form-select mb-3 selectCategory ml-2 " name="addpstatus">
							  <option class="status request" value="요청" selected="selected">미진행</option>
							  <option class="status progress" value="진행">진행</option>
							  <!-- <option class="status complete" value="완료">숨김</option> -->
							  <option class="status remain" value="보류">보류</option>
							</select>					
						</span>
						<span class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
							  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
							</svg>
							<input type= "text" class= "form-control manager ml-2" value="${ul.mname}" placeholder= "담당자" readonly>
						</span>
						<br>
						<textarea class="form-control content" rows="10" name="pcontent" placeholder="프로젝트에 관한 설명을 입력해주세요"></textarea>
<!-- 							<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script> 위즈윅
							<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
							<script>
							let editor;
							
							ClassicEditor.create(document.querySelector(".form-control.content"), {	
								language: "ko",
								toolbar: [
									'heading', 'bold', 'italic'
								]
							})
								.then( editor => {
						            myEditor = editor;
						        } )
						        .catch( err => {
						            console.error( err.stack );
					        });
							</script> -->
						<br>
						<input type="hidden" name="userid" value="kh0001@kh.com"> <!-- 로그인 세션 받아서 등록 -->
						<input type="hidden" name="paccess" value="ACCESS"><!-- 세션에서 권한 선택 -->
						
					
						<input type="date" class="form-date" name="pstartdate" required="required">
						~
						<input type="date" class="form-date" name="penddate" required="required">
						<br>
						<br>
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
    $("select[name=updatepstatus]").change(updateOption);
    
	function addList () {
		var data = myEditor.getData();
		$("[name=pcontent]").val(data);
		
		console.log($("#addProject").serialize());  // "n1=v1&n2=v2"&pcontent=rkqdfjklfjlddfld
		$.ajax ({
			url: "${pageContext.request.contextPath}/projectInsert",
			type: "post",
			//data: $("#addProject").serialize(),
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
	}
 	
 	function updateOption() {
 	    var updatedOption = $("select[name=updatepstatus] option:selected").text();
 	    $("#valuePstatus").val(updatedOption);
 	   	console.log($("#valuePstatus").val(updatedOption));
	}
	

</script>

<!-- 모달 -->