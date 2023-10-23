<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

   	<!-- 지도 담을 영역 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services"></script>
    <!-- 지도 그릴 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21"></script>
    <!-- 지도 그리는 코드 -->
    <script>
        var container = $(".admin-map")[0]; //지도를 담을 영역의 DOM 레퍼런스
        console.log(container);
        var options = { //지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	    level: 3 //지도의 레벨(확대, 축소 정도)
        };
        // 지도 생성
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        var searchPlace ='서울특별시 강남구 테헤란로 10길 9 그랑프리빌딩'
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(searchPlace,geoseach );
        function geoseach(result, status){
            if(status === kakao.maps.services.Status.OK){
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position:coords
                });
                map.setCenter(coords);
            }
        }
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services,clusterer,drawing"></script>