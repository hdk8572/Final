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
								<b>asd프로젝트 등록1</b>
							</h2>
						</div>
						<div>
						<form class="detail-ptask">
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
							<div class="form-control detail-content tcontent" rows="10">aaa</div>
							<input type="date" class="form-date" name="pstartdate" required="required"> ~ <input type="date" class="form-date" name="penddate" required="required"> <br>
							<div align="center">
								<button class="btn btn-primary" id="btn-submit" type="submit">추가</button>
								<button class="btn btn-warning" type="reset">취소</button>
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
<!-- <script>
	$("#btn-submit").click(addList);
	$("#myBtn").click(selectOption);
    $("select[name=addpstatus]").change(selectOption);
    $("select[name=updatepstatus]").change(updateOption);
    
	function addList () {
//		var data = myEditor.getData();
//		$("[name=pcontent]").val(data);
		
		console.log($("#addProject").serialize());  // "n1=v1&n2=v2"&pcontent=rkqdfjklfjlddfld
		$.ajax ({
			url: "${pageContext.request.contextPath}/projectInsert",
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
	}
 	
 	function updateOption() {
 	    var updatedOption = $("select[name=updatepstatus] option:selected").text();
 	    $("#valuePstatus").val(updatedOption);
 	   	console.log($("#valuePstatus").val(updatedOption));
	}
	

 	
 	
</script> -->


<!-- 모달 -->