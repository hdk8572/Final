<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 모달 -->
<!-- The Modal -->
<div id="readScheduleModal" class="modal right fade">
<div class="modal-dialog pcal">
  <!-- Modal content -->
  <div class="modal-content pcal">
  	<div class="modal-header pcal">
  		<span class="close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body project">
 		<form id="addProject">
	    	<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">프로젝트명 및 설명을 입력해주세요.</h5>
				</div>
				<div class="card-body addProject">
					<input type="hidden" name="userid" value="mplsam@kh.co.kr"> <!-- 로그인 세션 받아서 등록 -->
					<input type="hidden" name="paccess" value="ACCESS"><!-- 세션에서 권한 선택 -->
					<!-- <input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요." required="required"> -->
					<br> 
					<div>
					<input type="date" class="form-date" name="pstartdate" required="required">
					~
					<input type="date" class="form-date" name="penddate" required="required">
					</div>
					<br>
					<textarea class="form-control content" rows="5" name="ttitle"></textarea> <!-- title로 바꿔 -->
						
						<!-- 시큐에디터 --><!-- 여기 2개 넣고 add 밑에 1개 넣어야지 add에 뜸 왜 그럴까  -->
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
				</div>
					
				
				<div class="card-header">
				</div>
				<div class="card-body">

				</div>
			</div>
			<div class="card">

			</div>
			<div align="center">
				<button class="btn btn-primary" id="btn-submit" type="button">추가</button>
				<button class="btn btn-warning" type="reset">취소</button>
			</div>
			<div>
			
			</div>
		</form>
	</div>
  </div>
    <div class="modal-footer project">
  	</div>
  </div>
</div>
<!-- <script>
	$("#btn-submit").click(addList);
	
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
				console.log(result);
			},
			error: function() {	
				alert("에러났습니다.");
			}
		});	
	}
</script> -->

<!-- 모달 -->