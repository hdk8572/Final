<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 모달 TODO-->
<div id="pjreadcalmodal" class="modal project right fade" aria-labelledby="myModalLabel">
	<div class="modal-dialog pcal">
	  <!-- Modal content -->
		<div class="modal-content pcal"> 
		  	<div class="modal-header-pcal"> <!-- 수정함 -->
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
							</div>
							
							<!-- 작성자 코드 수정하기-->
							<!-- <div id="userid"></div> -->
							
							
							
							<div class="card-body">
								<!-- 제목 -->
								<div class="form-control stitle" id="title"></div>
								
								<!-- 날짜 -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
									<div class="form-read date" id="start"></div>  <div class="form-read date" id="end"></div>
								</div>
								
								<!-- 참석자  -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
									<div class="form-read" id="attenduseridList"></div>
								</div>
								
								<!-- 지도 -->
								<div class="d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
									<div class= "form-control place" id="splace"></div>
								</div>
									<div class="map" id="map-pjreadcalmodal"></div>
								
								<!-- 내용 -->
								<div class="form-control smemo " id="smemo"></div>
									
								<!-- 댓글 -->
							<!-- 	<div class="d-flex align-items-center" >
									<div class="comment-box">
										<input type="text" class="form-control comment" placeholder="Input">
										<input type="submit" class="c-btn" value="등록">
									</div>
								</div> -->
							</div>
						</div>
					</form>
				</div>
		  </div>
	 </div>
</div> 

<!-- 밖에 캘린더, read에 띄울 projectcalendar 지도  -->
<!-- readmodal의 맵 id 는  map-readmodal 장소는 splace -->
<script>
	var mapContainer_pjreadcalmodal = document.getElementById('map-pjreadcalmodal'), // 지도를 표시할 div 
	mapOption_pjreadcalmodal  = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3, // 지도의 확대 레벨
		disableDoubleClickZoom: true
	};

	//showMap 함수 정의
	function pjreadcalshowMap() {
		
		var splaceTextpjcal = $('#pjreadcalmodal #splace').text().trim();
		if(!splaceTextpjcal){
			mapContainer_pjreadcalmodal.innerHTML ='';
			mapContainer_pjreadcalmodal.style.display ='none';
			return;
		}
		
		// 지도를 생성합니다    
		var map4 = new kakao.maps.Map(mapContainer_pjreadcalmodal, mapOption_pjreadcalmodal);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder4 = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		console.log(splaceTextpjcal); //서울 강남
		geocoder3.addressSearch(splaceTextpjcal , function(result, status) {
			
			var splaceTextpjcal = $('#pjreadcalmodal #splace').text(); //splaceText
			
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var pjcalcoords = new kakao.maps.LatLng(result[0].y, result[0].x); //readcoords
		
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker4 = new kakao.maps.Marker({
					map : map4,
					position : pjcalcoords  
				});
		
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
				});
				infowindow.open(map4, marker4);
		
			   
				// 이 코드 넣었더니 지도 뜸!!
			    setTimeout(function(){ map3.relayout(); }, 1000);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map3.setCenter(pjcalcoords );
			 
				// 지도를 표시
			    mapContainer_pjreadcalmodal.style.display = 'block';
			} // if
		});  // cb function
	}
</script> --%>s