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

<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<title>Stream - Final Project</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!-- Tab bar -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">

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
		<%@include file="/WEB-INF/views/calendar/calendar-side.jsp"%>
			<div class="main">
				<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main>
				<div class="w3-bar tabBar">
					<button class="w3-bar-item w3" onclick="openTab('Tab1')">피드</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab2')">업무</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab3')">캘린더</button>
				</div>
<%-- 				<div class="search">
						<form action="${pageContext.request.contextPath}/pcalselectone" method="get"> <!-- ?? -->
							<input class="serinput" type="text" placeholder="검색어 입력"> 
							<img class="serimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</form>
					</div> --%>

				<main class="content" id="content-calendar">
					<div class="content-cal">
 						<h2>
							Calendar
							<button class="btn btn-primary addcal" data-bs-toggle="modal" data-bs-target="#myModal" onclick="getMemberProjectListHandler(this)">+일정추가</button>
						</h2>
							<%@ include file="/WEB-INF/views/calendar/addcalmodal.jsp" %>
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
	<script>

		document.addEventListener('DOMContentLoaded', function() {

			const calendarEl = document.getElementById('calendar'); //calender라는 id를 가진 요소를 찾아 calendarEl 변수에 할당한다. 이건 fullcalendar를 표시할 컨테이너이다.
			
			//<달력에 표시될 일정을 가져옴>
			// calendar date get from db 
			//jquery의 ajax 메소드를 사용해 서버에서 데이터를  비동기적으로 가져오는 요청을 보낸다.
			$.ajax({
				url: '${pageContext.request.contextPath}/pcalselectlist/'+calendar_pno,	
				data: { date : '2023-09-12'},  
				dataType : "json",
				success: function(result){	//요청이 성공적으로 완료될 때 실행할 콜백 함수를 정의
					console.log(result);  // result == event Data Arr //서버에서 반환된 데이터를 담고 있는 매개변수이다.
					makeFullCalendar(result);	//받은 데이터를 이용하여 makeFullCalendar 함수를 호출한다.
				}
			});
			
			function makeFullCalendar ( eventsDataArr ){	//makeFullCalendar 이 함수는 ajax 요청에서 받은 이벤트 데이터 배열 eventDataArr을 인자로 받는다.
				var calendar = new FullCalendar.Calendar(calendarEl, {
					height: '900px',  // 캘린더 칸 높이 설정(이거 안하고 more 코드 작성하면 칸 크기가 중구난방임)
			        expandRows: true, // 화면에 맞게 높이 재설정
					headerToolbar : { // 헤더에 표시할 툴 바
						start : 'prev next today',
						center : 'title',
						end : 'dayGridMonth,dayGridWeek,dayGridDay'
					},
					titleFormat : function(date) {
						return date.date.year + '년 '
								+ (parseInt(date.date.month) + 1) + '월';
					},
					//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
					selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,
					editable : true,
					nowIndicator : true, // 현재 시간 마크
					dayMaxEvents : true, // 일정 more 
					//locale: 'ko', // 한국어 설정 
					
					events : eventsDataArr
				 	,
				 	/* 일정 상세정보를 띄우겠다.*/
					eventClick: function(info) {
						console.log(info.event.title);
						var event = info.event;
						//작성자!!!!임 (다른사람도 적은 일정들)
						console.log(info.event.extendedProps.sno);
						
						// 지연 TODO 
						var htmlval = '';
						for(var i=0; i<info.event.extendedProps.attenduseridList.length; i++){
							htmlval += '<div>'+info.event.extendedProps.attenduseridList[i]+'</div>';
						}
						$("#readScheduleModal.modal  #attenduseridList").html(htmlval);
						
						
						$("#readScheduleModal.modal  #title").html(info.event.title); //띄우려는 모달이랑 이름 맞춰야한다.
						$("#readScheduleModal.modal  #userid").html(info.event.extendedProps.userid); //extendedProps -> api에서 가져옴, 값을 띄우는 걸 도와줌
						$("#readScheduleModal.modal  #smemo").html(info.event.extendedProps.smemo);
						/* $("#readScheduleModal.modal  #start").html(info.event.extendedProps.start);//TODO
						$("#readScheduleModal.modal  #end").html(info.event.extendedProps.end);//TODO */
						$("#readScheduleModal").modal("toggle");
					} 
				});
				calendar.render();
			}
		});
	</script>
	


</body>
</html>