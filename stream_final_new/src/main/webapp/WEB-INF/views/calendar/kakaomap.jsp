<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="map" id="map"></div>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 id
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};
	
	// Input 요소에 Enter 키 이벤트 핸들러 등록 
   	function searchOnEnter(event) {
   		var key = event.key;
		// Enter 키인 경우 지도를 표시
        if (key === 'Enter') { 
            event.preventDefault(); // 폼 제출을 막음
            
            $('.map-hidden').css("display", 'block');
            showMap(); // 지도를 표시하는 함수 호출
        }
    };
    
    //지도 초기화
    function cancelAddEvent(){
    	var kakaoaddmap = document.getElementById('map');
    	kakaoaddmap.innerHTML =''; //지도를 비운다.
    	
    	$('.map-hidden').css("display", 'none');

    } 

	// showMap 함수 정의
	function showMap() {
	    var address = $('#splace').val(); // 입력된 주소 가져오기
	   
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	console.log(address); //ex)서울 강남
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
		
			var address = $('#splace').text();

			if (address != null) 
				console.log($('#splace'));
				console.log($('#splace').text());
			
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
				
				// 지도를 표시
			    mapContainer.style.display = 'block';
				
			}//if
		});// 좌표 function
	}
</script>

