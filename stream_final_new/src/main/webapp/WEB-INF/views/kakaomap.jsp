<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div class="d-flex align-items-center"  id="form-content">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
		<input type= "text" class= "form-control place" id="address" name="splace" placeholder= "장소를 입력하세요." onkeydown="searchOnEnter(event)">
	</div>
	<div id="map" class="map-hidden"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	
	
	
	// Input 요소에 Enter 키 이벤트 핸들러 등록
   	function searchOnEnter(event) {
   		var key = event.key;
		// Enter 키인 경우 지도를 표시
        if (key === 'Enter') { 
            event.preventDefault(); // 폼 제출을 막음
            showMap(); // 지도를 표시하는 함수 호출
        }
    };

	// showMap 함수 정의
	function showMap() {
	    var address = $('#address').val(); // 입력된 주소 가져오기
		
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
    var a1 =  $('#splace')[0].innerHTML;
	
	// 주소로 좌표를 검색합니다
	console.log($('#address').val());
	geocoder.addressSearch($('#address').val(), function(result, status) {
			var address = $('#splace').innerHTML
			if (address != null)
				console.log($('#splace'));
				console.log($('#splace').innerHTML);
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

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
				
				
			}
		});
	}

	</script>