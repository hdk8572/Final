<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달 -->
<div id="updatecalmodal" class="modal">
	<div class="modal-dialog pcal">
		<!-- Modal content -->
		<div class="modal-content updatecal">
		<span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
			<div class="modal-header pcal"></div>
				
			<div class="modal-body updatecal">
				<div class="card pcal">
					<div class="card-body pcal">
					<div class="card-header pcalTitle">
						<h2 class="pcalTitle"><b>일정 수정</b></h2>
					</div>
						<form action="${pageContext.request.contextPath}/updatepcal" method="post">
							<!-- 일정번호 프로젝트번호 -->
							<!-- url 때문에 pno필요함 -->
							<input type="hidden" name="pno" value="${pno}">
							<!-- TODO 일정번호 -->
							<input type="hidden" name="sno" value="${sno}">
							<input type="text" class="form-control title" name="title" id="form-content" placeholder="제목을 입력하세요.">
							
							<!-- 날짜 -->
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
								<input type="date" class="form-date" id="start" name="start" required="required"> ~ <input type="date" class="form-date" id="end" name="end" required="required"> <!-- s -->
							 <!-- 작성자&참석자 -->
							 <div class="d-flex align-items-center" id="form-content">
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle></svg>
								</div>
								<!-- 작성자 -->
									<input class="form-control userid" type="text" name="userid" value="${principal.username }" readonly>
								<div class="form-userid" id="form-content" >
									<!-- 참가자 임시로 넣음 -->
									<input type="text" name="attenduseridArr" value="mplsam@kh.co.kr">
									<input type="text" name="attenduseridArr" value="kh0001@kh.com">
									<input type="text" name="attenduseridArr" value="kh0002@kh.com"> 
									<!-- 참가자 반복 -->
									<input type="text" id="calmemberinput" placeholder="참가자" list="calmemberlist">
									<select id="calmemberlist"> <!-- 일단 한 명만 추가해서 insert까지 하기  --> 
									</select>
								</div>
							</div>
							
							<!-- 지도 -->
							<div>
								<div id="splace"></div>
								<!-- <div id="map-readmodal"></div> -->
							</div>
							
							<!-- 내용  -->
							<div id="form-content">
								<textarea class="form-control detail-content" id="csummernote" rows="5" name="smemo" placeholder="프로젝트에 관한 설명을 입력해주세요"></textarea>
						    </div>
							
							<!-- 등록 취소 버튼 -->
							<div align="center">
								<button type="submit" class="btn btn-primary" >등록</button>
								<button  type="reset" class="btn btn-warning">취소</button>
							</div>
						</form>
					</div>
				</div>  <!-- end of card -->
			</div>
		</div>
	</div>
</div>
<!-- 참가자들을 input에 추가한다. 참가자 수정 가능 -->
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
			url:'${pageContext.request.contextPath}/memberProjectList',
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
		console.log(data);
		console.log("성공하였습니다.");
		var listHtml = "";
		for (var i=0; i<data.length; i++){
			var mname = data[i];
			listHtml += `<option value="\${mname.userid}">\${mname.mname}</option>`; //data를 뿌리고 그걸 option에다가 넣어줌 //value=userid
		}
		$("#calmemberlist").html(listHtml);
	}
	function memberError(request,status,error){
		console.log("ajax 오류");
		console.log(request);
		console.log(status);
		console.log(error);
		
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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

<!-- 지도 api -->
<script>

var mapContainer_readmodal = document.getElementById('map-readmodal'), // 지도를 표시할 div 
mapOption_readmodal = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 3
	
// 지도의 확대 레벨
};

//showMap 함수 정의
function readshowMap() {
	var splaceText = $('#readcalmodal #splace').text().trim();
	if(!splaceText){
		return;  // 장소값 없으면 지도 display 안함.
	}
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer_readmodal, mapOption_readmodal);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	console.log(splaceText);
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(splaceText , function(result, status) {
		var address = splaceText;
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});
	
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
			});
			infowindow.open(map, marker);
	
		   
			// 이 코드 넣었더니 지도 뜸!!
		    setTimeout(function(){ map.relayout(); }, 1000);
			
		 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		 
			// 지도를 표시
		    mapContainer_readmodal.style.display = 'block';
		  
		    
			/* function relayout() {    
			    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
			    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			    map-readmodal.relayout();
			} */
			
			/* 	// 마우스 드래그로 지도 이동 막기
			map.setDraggable(false);
			// 마우스 휠로 지도 확대,축소 막기
			map.setZoomable(false);
			 */
			
			
		} // if
	});  // cb function
}
</script>
<!-- 위즈윅 - summerNote	 -->
