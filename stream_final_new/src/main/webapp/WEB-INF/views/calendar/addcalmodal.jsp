<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달 -->
<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
<div id="addcalmodal" class="modal">
	<div class="modal-dialog pcal">
		<!-- Modal content -->
		<div class="modal-container pcal add ">
			<div class="modal-header-pcal add"></div>
			<div class="modal-body pcal">
				<div class="card pcal">
					<div class="card-body pcal">
					<div class="card-header pcalTitle">
						<h2 class="pcalTitle"><b>일정 작성</b></h2>
					</div>
						<form class="addcalmodal-frm" action="${pageContext.request.contextPath}/member/insertpcal" method="post">
							
							<!-- 일정번호 프로젝트번호  url 때문에 pno필요함 -->
							<input type="hidden" name="pno" value="${pno}">
							<!-- TODO 일정번호 -->
							<input type="hidden" name="sno" value="${sno}">
							
							<!-- 제목 -->
							<input type="text" class="form-control addtitle" name="title" id="title" placeholder="제목을 입력해주세요. -20글자 제한">
							
							<!-- 날짜 -->
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
							<input type="date" class="form-date-cal addStart" id="start" name="start" required="required"> ~ <input type="date" class="form-date-cal addEnd" id="end" name="end" required="required"> <!-- s -->
							
							<!-- 작성자&참석자 -->
							<div class="wrap-selected">
								<div class="selected-leftPart">
									<div class="d-flex align-items-center">
										<!-- 작성자 -->
										<input class="form-control userid" type="hidden" name="userid" value="${principal.username }" readonly>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle></svg>
										
										<!-- 참가자 -->
										<select class="form-select mb-3 calmemberlist" id="calmemberlist" >
											<option value="">참가자 추가</option>
										</select>
									</div>
									<!-- 장소 이름 -->
									<div class="d-flex align-items-center">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
										<input type= "text" class= "form-control addplace" id="splace" name="splace" value="장소 미지정"  placeholder= "장소를 입력하세요." onkeydown="searchOnEnter(event)">
									</div>
								</div>
								<!-- 참가자 반복 -->
								<div  id="attenduserid-wrap" class="selected-rightPart card addcalendar">
									<!-- 
										<div class="attenduserid-item">
											<input type="text" placeholder="참가자" readonly>
											<input type="hidden"  name="attenduseridArr">
										</div>
									 -->	
								</div>
							</div>
							<!-- 지도 -->
							<div class="map-hidden">
								<%@ include file="/WEB-INF/views/calendar/kakaomap.jsp"%>
							</div>
							
							<!-- 내용  -->
							<div id="form-content">
								<textarea class="smemo" id="summernote-addcalmodal" rows="5" name="smemo"></textarea>
						    </div>
						    
						    <!-- 등록 취소 버튼 -->
							<div align="center">
								<button type="submit" class="btn btn-primary" >등록</button>
								<button  type="reset"  class="btn btn-warning" onclick="resetcalmodal()">취소</button>
							</div>
						</form>
					</div>
				</div>  <!-- end of card -->
			</div>
		</div>
	</div>
</div>

<!-- 참가자들을 input에 추가한다. -->
<script>
	document.getElementById("calmemberlist").addEventListener("change", function() {
		if(this.selectedIndex == 0){
			return;
		}
	    var selectedText = this.options[this.selectedIndex].text;
	    var selectedValue = this.options[this.selectedIndex].value;
	    //document.getElementById("calmemberinput").value = selectedValue; // 하나가 아니기때문에 id = "calmemberinput" 안됨
		var checkSameUserId = false;
	    $("#addcalmodal .attenduserid-item").each(function(idx, thisItem){
	    	itemValue = $(thisItem).children("[name=attenduseridArr]").val();
	    	console.log(itemValue);
	    	if(selectedValue == itemValue){
	    		alert("이미 참석자에 등록된 사원입니다.");
	    		checkSameUserId = true;
	    		return false;
	    	}
	    });
	    
	    if(checkSameUserId == false){  //등록된 적 없는 사원일 경우 추가
		    var htmlVal='';
		    htmlVal+='<div class="attenduserid-item">';
		    htmlVal+='<input type="text" class="form-control-userid" placeholder="참가자" readonly value="'+selectedText+'">';
		    htmlVal+='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>';
		    htmlVal+='<input type="hidden" name="attenduseridArr" value="'+selectedValue+'" >';
		    htmlVal+='</div>';
		    
		    $("#attenduserid-wrap").append(htmlVal);
		    
		    //참가자 svg 누르면 삭제됨
		    $(".feather.feather-delete.align-middle.me-2").click(function() {
		 		console.log("add삭제");
		 		$(this).closest(".attenduserid-item").remove();
		 	});
	    }
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
		var listHtml = '<option value="">참가자 추가</option>';
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
		
		var listHtml = '<option value="">참가자 추가</option>';
		listHtml += `<option selected>해당하는 이름이 없습니다.</option>`;
		$("#calmemberlist").html(listHtml);
	}
</script>


<!-- 제목 유효성 검사  -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    var addTitle = document.querySelector(".form-control.addtitle"); 

    function validateTitle() {
        var titleValue = addTitle.value;

        if (!titleValue) {
            alert("제목을 입력해주세요.");
        } else if (titleValue.length > 20) {
            alert("제목은 20자 이내여야 합니다.");
        }
    }

    addTitle.addEventListener("input", validateTitle);

    document.getElementById("addcalmodal").addEventListener("submit", function(event) {
        validateTitle(); // 폼 제출 시 다시 한 번 검사
        if (addTitle.value === "") {
            event.preventDefault(); // 제목이 비어있을 때 폼 제출 방지
        }
    });
});
</script>

<!-- 내용 유효성검사  -->
<script>
	$('#summernote-addcalmodal').on('summernote.keyup', function() {
		
		var max = 200;
		
		var length = $(this).summernote('code').replace(/<(?:.|\n)*?>/gm, '').length;
		if(length > max) {
			alert('최대 글자수를 초과하였습니다.')
			
			$(this).summernote('editor.undo');
		}
	});
</script>




<!-- 날짜 시작일-종료일 유효성검사  -->
<script>
	//id='start','end'
	var calStartDateInput = document.querySelector(".form-date-cal.addStart");
	var calEndDateInput = document.querySelector(".form-date-cal.addEnd");
	
	calStartDateInput.addEventListener('change', function() {
		calCompareDates();
	});
	
	calEndDateInput.addEventListener('change', function() {
		calCompareDates();
	});
	
	function calCompareDates() {
		var calStartDate = new Date(calStartDateInput.value);
		var calEndDate = new Date(calEndDateInput.value);
		
		if(calEndDate < calStartDate) {
			alert("입력한 종료일이 시작일보다 이전입니다. 올바른 날짜를 선택해 주세요.");
			
			calEndDateInput.value = ''; //종료일 입력필드 초기화
		}
	}
</script>

<script>
    //addcalmodal 초기화!!!
	function resetcalmodal(){
		var kakaoaddmap = document.getElementById('map');
		$(".attenduserid-item").remove();
		kakaoaddmap.innerHTML =''; 
		$('.map-hidden').css("display", 'none'); 
		$('#addcalmodal #splace').val(''); 

		$('#addcalmodal .title').val('');
		$('#addcalmodal #start').val(''); 
		$('#addcalmodal #end').val(''); 
		$('#addcalmodal .attenduserid-item').each(function(){
			$(this).text('');
		});
		$('#addcalmodal #summernote-addcalmodal').summernote('code', '') 
	}
</script>
