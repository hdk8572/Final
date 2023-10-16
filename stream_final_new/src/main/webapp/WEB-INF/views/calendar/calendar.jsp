<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
let logined_userid="${principal.username}"; /* 로그인! */
</script>
<script>
let calendar_pno="${pno}"; /* 프로젝트 번호! */
</script>

		<div class="card-header">
			<!-- 캘린더  -->
			<div id="croot">
				<div class="ccard-body px-4">
					<div id="calendar"></div>
				</div>
			</div>
		</div>
		
<%@ include file="/WEB-INF/views/calendar/addcalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/readcalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/updatecalmodal.jsp" %>
<!-- 달력을 구성  -->
<%@ include file="/WEB-INF/views/calendar/calendarhandler.jsp" %>

<!-- 참가자들을 input에 추가한다. -->
<script>
	document.getElementById("calmemberlist").addEventListener("change", function() {
	    var selectedValue = this.options[this.selectedIndex].text;
	    document.getElementById("calmemberinput").value = selectedValue;
	});
</script>

<!-- 참가자 list select option  -->
<script>
	function getMemberProjectListHandler(thisElement){
		console.log("calendar_pno: "+calendar_pno);
		console.log("logined_userid: "+logined_userid);
		$.ajax({
			url:'${pageContext.request.contextPath}/member/memberProjectList',
			type:"get",
			data : {
				pno : calendar_pno,
				userid : logined_userid
			},
			dataType: "json",
			success: memberView,
			error:memberError
		});
	}
	function memberView(data){
		console.log(data)
		console.log("성공하였습니다.")
		var listHtml = "";
		for (var i=0; i<data.length; i++){
			var mname = data[i];
			listHtml += `<option value="\${mname.userid}">\${mname.mname}</option>`; //data를 뿌리고 그걸 option에다가 넣어줌 //value=userid
		}
		$("#calmemberlist").html(listHtml);
	}
	function memberError(request, status, error){
		console.log("오류발생!!!!!!!!!!!");
		console.log(request);
		console.log(status);
		console.log(error);
		
		var listHtml = "";
		listHtml += `<option selected>해당하는 이름이 없습니다.</option>`;
		$("#calmemberlist").html(listHtml);
	}
</script>

<!-- 날짜 시작일-종료일  -->
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
	
<!-- 위즈윅 - summerNote	 -->
<script>
	$(document).ready(function (){
		$("#summernote-addcalmodal").summernote({					
		     placeholder: '내용을 작성해주세요.',
		     tabsize: 2,
		     height: 120,
		     toolbar: [
		       ['style', ['style']],
		       ['font', ['bold', 'underline', 'clear']],
		       ['color', ['color']],
		       ['para', ['ul', 'ol', 'paragraph']],
		       ['table', ['table']],
		       ['insert' /* ['link', 'picture', 'video'] */],
		       ['view', ['fullscreen', 'codeview', 'help']]
		     ]
		});
		/* $("#summernote-updatecalmodal").summernote({					
		   placeholder: '내용을 작성해주세요.', 
		     tabsize: 2,
		     height: 120,
		     toolbar: [
		       ['style', ['style']],
		       ['font', ['bold', 'underline', 'clear']],
		       ['color', ['color']],
		       ['para', ['ul', 'ol', 'paragraph']],
		       ['table', ['table']],
		       ['insert'  ['link', 'picture', 'video'] ],
		       ['view', ['fullscreen', 'codeview', 'help']]
		     ]
		}); */
	});
</script>