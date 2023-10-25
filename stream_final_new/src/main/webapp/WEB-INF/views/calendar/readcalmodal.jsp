<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 모달 -->
<div id="readcalmodal" class="modal project right fade" aria-labelledby="myModalLabel">
	<div class="modal-dialog pcal">
	  <!-- Modal content -->
		<div class="modal-content pcal"> 
		  	<div class="modal-header-pcal"> 
		  		<span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
		  	</div>
			 	<div class="modal-body-pcal">
			 		<form id="readcalmodal">
				    	<div class="card">
				    		<!-- TODO 일정번호 -->
				    		<input type="hidden" id="sno" name="sno">
				    		
				    		<!-- 일정 제목 -->
							<div class="readcalmodal-header">
								<h2 class="pcalTitle"><b>일정 상세</b></h2>
								
							<!-- 수정&삭제 버튼 -->
							<div class="read-dropdown-grop">
								<div class="btn-dropdown-toggle" id="read-dropdown" data-bs-toggle="dropdown">
									<svg  xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical me-2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
								</div>
								<ul class="dropdown-menu" id="read-dropdown-menu">
									<li><a class="dropdown-item" id="update-calButton" data-bs-toggle="modal" data-bs-target="#updatecalmodal" onclick="updateMemberProjectListHandler(this)">수정</a></li>
									<li><a class="dropdown-item" id="delete-calButton"> 삭제</a></li>
								</ul>
					  		</div>
							</div>
							
							<!-- 작성자 코드 수정하기-->
							<!-- <div id="userid"></div> -->
							
							<div class="card-body">
								<!-- 제목 -->
								<div class="form-control stitle" id="title"></div>
								
								<!-- 날짜 -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
									<div class="form-date calendar-read" id="start"></div><div class="form-date calendar-read-end" id="end"></div>
								</div>
								
								<!-- 참석자  -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
									<div class="form-readcal" id="attenduseridList"></div>
								</div>
								
								<!-- 지도 -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
									<div class="form-control place" id="splace"></div>
								</div>
									<div class="map" id="map-readmodal"></div>
									
								<!-- 내용 -->
								<div class="form-control smemo " id="smemo"></div>
									
							</div>
						</div>
					</form>
				</div>
		  </div>
	 </div>
</div>
 
<!-- 참석자 svg 안 사라짐 TODO   -->
<!-- <script>
	document.addEventListener("DOMContentLoaded", function(){
		var attenduseridList = document.querySelector(".form-read");
		var attendSvg = document.querySelector(".feather.feather-user.align-middle.me-2");
		
		if (!attenduseridList || attenduseridList.innerHTML.trim() === "" ) {
			/* var userIdSvg = document.querySelector(".feather.feather-user.align-middle.me-2"); */
			if (attendSvg) {
				attendSvg.style.display = "none";
			}
		}
	});
</script>
 -->
 
<!-- 작성자만 수정,삭제 가능하도록  -->
<!-- <script>
	document.addEventListener("DOMContentLoaded", function() {
		var writerUserid ='${mname.userid}';
	
		document.addEventListener("click", function(event) {
			if(event.target.classList.contains("update-calButton")) {
				if('${principal.username}' !== writerUserid) {
					alert("작성자만 수정할 수 있습니다.");
					event.preventDefault();
				}
			}
			if(event.target.classList.contains("delete-calButton")) {
				if('${principal.username}' !== writerUserid) {
					alert("작성자만 삭제할 수 있습니다.");
					event.preventDefault();
				}
			}
		});
	});
</script> -->


<!-- read 일정 수정 삭제 코드 -->
<script>
	$('#delete-calButton').on("click", function(){
		
		if(confirm('글을 삭제하시겠습니까?')) {
			var sno =$('#sno').val();
			
			//ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/member/deletepcal",
				type: 'POST',
				data:{sno:sno},
				success: function(response){
					if(response === 1) {
						alert('일정이 삭제되었습니다.')
						$('#readcalmodal').modal('hide');// 모달창 닫기
					}else{
						alert('일정 삭제에 실패했습니다.');
					}
					if(eventClick_defId != 0){  // eventClick시 클릭된 event를 찾아서 삭제
						calendar.getEvents().forEach(function(evt) {
				            if (evt._def.defId == eventClick_defId) evt.remove();
				      });
					}
				},
				error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
			});
		}
	});
</script>


<!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services"></script>
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
			mapContainer_readmodal.innerHTML ='';
			mapContainer_readmodal.style.display ='none';
			return;
		}
		
		// 지도를 생성합니다    
		var map2 = new kakao.maps.Map(mapContainer_readmodal, mapOption_readmodal);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder2 = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		console.log(splaceText);
		geocoder2.addressSearch(splaceText, function(result, status) {
			
			var splaceText = $('#readcalmodal #splace').text();
			
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var readcoords = new kakao.maps.LatLng(result[0].y, result[0].x); //지도의 좌표를 설정, setCenter를 사용하여 지도 중심을 해당 좌표로 설정함
		
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker2 = new kakao.maps.Marker({
					map : map2,
					position : readcoords
				});
		
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
				});
				infowindow.open(map2, marker2);
		
			   
				// 지도가 안 보일 때 넣은 코드(relayout->readcoords 순서로 적어줘야 한다.)
			    setTimeout(function(){ map2.relayout(); }, 1000); //map2
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map2.setCenter(readcoords);
			 
				// 지도를 표시
				 mapContainer_readmodal.style.display = 'block';
				
			} // if
		});  // cb function
	}
</script>