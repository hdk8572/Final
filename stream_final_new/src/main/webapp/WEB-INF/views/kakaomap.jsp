<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<div id="map"></div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	
	// Input 요소에 Enter 키 이벤트 핸들러 등록 //hasdjflkasdjflaksdf*
   	function searchOnEnter(event) {
   		var key = event.key;
		// Enter 키인 경우 지도를 표시
        if (key === 'Enter') { 
            event.preventDefault(); // 폼 제출을 막음
            
            $('.map-hidden').css("display", 'block');
            
            showMap(); // 지도를 표시하는 함수 호출
        }
    };
    
    function cancelAddEvent(){
    	//지도 초기화
    	var kakaoaddmap = document.getElementById('map');
    	kakaoaddmap.innerHTML =''; //지도를 비운다.
    	
    	$('.map-hidden').css("display", 'none');
    	
    }

	// showMap 함수 정의
	function showMap() {
	    var address = $('#address').val(); // 입력된 주소 가져오기
		
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	
	// 주소로 좌표를 검색합니다
	console.log(address); //서울 강남
	geocoder.addressSearch(address, function(result, status) {
		
			var address = $('#splace').text();

			if (address != null) {
				console.log($('#splace'));
				console.log($('#splace').text());
			}
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
				
			}
		});
	}

	</script>