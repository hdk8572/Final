<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Stream">

<title>Stream - 업무도 흐름이다!</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!-- Tab bar -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">

<!-- Modal CSS -->
<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/css/calreadmodal.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/calmodal.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath }/css/fullcalendar.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- SummerNote CDN -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">


<script>
let logined_userid="${principal.username}"; /* 로그인! */
</script>
<script>
let calendar_pno="${pno}"; /* 프로젝트 번호! */
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
			<div class="main">
				<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main>
				<main class="content" id="content-calendar">
					<div class="content-cal">
 						<h2>
							Calendar
						</h2>
						<div class="container-fluid p-0">
							<div class="card-header">
								<!-- 캘린더  -->
								<div id="croot">
									<div class="ccard-body px-4">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
						</div>
					<%@ include file="/WEB-INF/views/calendar/readcalmodal.jsp" %>
					 </div>
				</main>
				<%@ include file="/WEB-INF/views/footer.jsp"%>
			</main>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
<!-- 달력을 구성  -->
<%@ include file="/WEB-INF/views/calendar/calendarhandler.jsp" %>
<script>
document.addEventListener('DOMContentLoaded', loadCalendarHandler);
</script>

<!-- 밖에 캘린더, read에 띄울 projectcalendar 지도  -->
<!-- readmodal의 맵 id 는  map-readmodal 장소는 splace -->
<script>
	var mapContainer_readmodal = document.getElementById('map-readmodal'), // 지도를 표시할 div 
	mapOption_readmodal = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3, // 지도의 확대 레벨
		disableDoubleClickZoom: true
	};

	//showMap 함수 정의
	function updateshowMap() {
		
		var splaceText = $('#readcalmodal #splace').text().trim();
		if(!splaceText){
			mapContainer_readmodal.innerHTML ='';
			mapContainer_readmodal.style.display ='none';
			return;
		}
		
		// 지도를 생성합니다    
		var map4 = new kakao.maps.Map(mapContainer_readmodal, mapOption_readmodal);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder4 = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		console.log(splaceText); //서울 강남
		geocoder3.addressSearch(splaceText , function(result, status) {
			
			var splaceText = $('#readcalmodal #splace').text(); //splaceText
			
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var readcoords = new kakao.maps.LatLng(result[0].y, result[0].x); //readcoords
		
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker4 = new kakao.maps.Marker({
					map : map4,
					position : readcoords 
				});
		
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
				});
				infowindow.open(map4, marker4);
		
			   
				// 이 코드 넣었더니 지도 뜸!!
			    setTimeout(function(){ map3.relayout(); }, 1000);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map3.setCenter(readcoords);
			 
				// 지도를 표시
			    mapContainer_updatemodal.style.display = 'block';
			} // if
		});  // cb function
	}
</script>

</body>
</html>