<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달 -->
<div id="myModal" class="modal">
	<div class="modal-dialog pcal">
		<!-- Modal content -->
		<div class="modal-content pcal">
			<div class="modal-header pcal"></div>
			<div class="modal-body pcal">
				<div class="card">
					<div class="card-body">
					<div class="card-header pcalTitle">
						<h2 class="pcalTitle"><b>일정 작성</b></h2>
					</div>
						<form action="${pageContext.request.contextPath}/insertpcal" method="post">
							<input type="text" class="form-control title" name="title" placeholder="제목을 입력하세요.">
								<br>
							<input type="date" class="form-date" name="start" required="required"> ~ <input type="date" class="form-date" name="end" required="required"> <!-- s -->
								<br>
								<br>
						<!-- 작성자&참석자 -->
						 <div class="d-flex align-items-center" >
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle></svg>
							</span>
								<!-- //참가자
									<input type="text" class="form-control member" placeholder="참가자" list="cmemberlist" id="clist">
								    	<datalist  class="cmember" id="cmemberlist">
								    		<option selected>참가자를 선택해라</option>
								        </datalist>
							    --> <!-- memberProjectList  mplsam@kh.co.kr-->
							        
								<!-- 작성자 -->
							<input type="text" name="userid" value="${principal.username }" readonly>
							<div class="form-userid" >
								<!-- 참가자 반복 -->
								<input type="text" class="calmember" placeholder="참가자" list="calmemberlist">
							<%-- 	<c:forEach items="${calendar }" var="userid">
									<div id="calmemberlist">${caluser.userid }</div>
								</c:forEach> --%>
								<div>
									<c:forEach items="${calendar }" var="userid">
										<div class="callist">
											<h4>${calendar.userid }</h4>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<br>
						<span class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
							<input type= "text" class= "form-control place" name="tmember" placeholder= "장소를 입력하세요.">
						</span>
						<br>
					<div>
					<textarea class="form-control content" name="smemo" placeholder="내용을 입력해주세요."></textarea>
						<!-- 시큐에디터  위즈윅 -->
						<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
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
						</script>
					    <!-- ?? -->
				<!-- 	        <script>
						        document.addEventListener('DOMContentLoaded', e => {
						            $('#clist').autocomplete()
						        }, false);
						   </script> -->
				   </div>
						<br>
						<div align="center">
							<button class="btn btn-primary" type="submit">추가</button>
							<button class="btn btn-warning" type="reset">취소</button>
						</div>
						</form>
					</div>
				</div>  <!-- end of card -->
			</div>
			<div class="modal-footer ptask"></div>
		</div>
	</div>
</div>
<!-- 참가자list -->
<script>
	$(".calmember").click(getMemberProjectListHandler);
	function getMemberProjectListHandler(thisElement){
		console.log($("[name=pno]").val());
		// TODO: 
		const pno = calendar_pno;
		const userid = logined_userid;
		$.ajax({
			url:'${pageContext.request.contextPath}/memberProjectList',
			type:"get",
			data : {
				/* pno : $("[name=pno]").val() */
				pno : pno,
				userid : userid
			},
			dataType: "json",
			success: memberView,
			error:memberError
		});
		
	 $(".calmember-list li").click(function() {
	      var selectedValue = $(this).text();
	      $(".calmember").val(selectedValue);
	      $(".calmember-list").hide();
	   });
	}
	function memberView(data){
		console.log(data)
		console.log("성공하였습니다.")
		var listHtml = "";
		for (var i=0; i<data.length; i++){
			var mname = data[i];
			listHtml += `<option value="\${mname.userid}">\${mname.mname}</option>`;
		}
		$("#calmemberlist").html(listHtml);
	}
	function memberError(){
		var listHtml = "";
		listHtml += `<option selected>해당하는 이름이 없습니다.</option>`;
		$("#calmemberlist").html(listHtml);
	}
</script>
