<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.List"%>
	<%@page import="kh.groupware.stream.calendar.model.vo.CalendarVo"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="adminKit/img/icons/icon-48x48.png" />

<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>calendar</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/app.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/calendar.css"
	rel="stylesheet">
	
<link href="${pageContext.request.contextPath }/css/calmodal.css"
	rel="stylesheet">

<!-- fullcalendar  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- //fullcalendar 언어 설정관련 script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/calendar/calendar-side.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headerNavbar.jsp"%>


			<main>
				<div class="w3-bar tabBar">
					<button class="w3-bar-item w3" onclick="openTab('Tab1')">피드</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab2')">업무</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab3')">캘린더</button>
				</div>
				<div class="search">
					<input class="serinput" type="text" placeholder="검색어 입력"> <img
						class="serimg"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>

				<main class="content">
 							<h2>
								Calendar
								<button class="btn btn-primary addTaskTab" data-bs-toggle="modal" data-bs-target="#myModal">+일정추가</button>
							</h2>
							<%@ include file="/WEB-INF/views/calendar/calmodal.jsp" %>
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
				</main>
				<%@ include file="/WEB-INF/views/footer.jsp"%>
			</main>
		</div>
	</div>
	<!-- 달력을 구성  -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '900px', // 캘린더 칸 높이 설정(이거 안하고 more 코드 작성하면 칸 크기 달라짐)
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
				//	locale: 'ko', // 한국어 설정 
				events : 
			});
			calendar.render();
		});
	</script>
	
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<!-- 일정 모달 창 그림자 효과? -->
	<script>
	$(document).ready(function() {
		$(".card-body").mouseover(function() {
			$(this).css({
				"box-shadow":"rgba(100, 100, 111, 0.2) 0px 7px 29px 0px"
			});
		});
		$(".card-body").mouseout(function() {
			$(this).css({
				"box-shadow":""
			});
		});
	});
	</script>
	<script>
	/* 상단 탭바 */
	function openTab(tabName) {
	  var i;
	  var x = document.getElementsByClassName("tab");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  document.getElementById(tabName).style.display = "block";  
	}
	</script>
</body>
</html>