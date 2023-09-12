<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>fullcalendar</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/app.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/calendar.css"
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
								<button class="btn btn-primary addTaskTab" id="btn-modal">+일정추가</button>
							</h2>
					<div class="container-fluid p-0">
<!--					    <div class="row">
							<div class="card"> -->
								<div class="card-header">
<!-- 									<div class="card-body"></div> -->
									<!-- 캘린더  -->
									<div id="croot">
										<div class="ccard-body px-4">
											<div id="calendar"></div>
										</div>
									</div>
									<!-- 모달창 열기(+일정추가 클릭) -->
									<div id="cal-modal" class="modal-overlay" aria-hidden="true">
										<div class="modal-window">
											<div class="create-header">
												<div class="temp-wrap">
													<h4 class="create-post-title">일정 작성</h4>
												</div>
												<span class="close-area" data-bs-dismiss="modal"
													aria-label="Close">&times;</span>
											</div>
											<div class="create-title-input">
												<input id="postTitle" type="text" class="title-input"
													data-empty-msg="제목을 입력하세요" placeholder="제목을 입력하세요">
											</div>
											<div class="create-content"></div>
										</div>
									</div>
								</div>
							</div>
					<!-- 	</div>
					</div> -->
				</main>
				<%@ include file="/WEB-INF/views/footer.jsp"%>
			</main>
		</div>
	</div>

	<!-- 모달창 열기 -->
	<script>
        const modal = document.getElementById("cal-modal")
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
            modal.style.display = "flex"
            document.body.style.overflow = "hidden"; // 모달이 열릴 때 스크롤 비활성화
        })
    </script>
	<!-- 모달창 x누르면 닫힘 -->
	<script>
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
            document.body.style.overflow ="";	// 모달이 닫히면 스크롤 활성화
        })
    </script>
	<!-- 모달 바깥 영역 클릭하면 모달창 닫힘  -->
	<script>
    	modal.addEventListener("click", e => {
    		const evTarget = e.target
    	    if(evTarget.classList.contains("modal-overlay")) {
    	    	modal.style.display ="none"
    	    	document.body.style.overflow ="";	// 모달이 닫히면 스크롤 활성화
    	    }
    	})
    </script>

	<!-- 달력을 구성  -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '1200px', // 캘린더 칸 높이 설정(이거 안하고 more 코드 작성하면 칸 크기 달라짐)
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
				events : [
						{
							title : '풀캘린더완성도',
							start : '2023-09-12',
							end : '2023-09-20',
							color : '#'
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
						},
						{
							title : '풀캘린더완성도',
							start : '2023-09-12',
							end : '2023-09-20',
							color : '#'
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
						},
						{
							title : '풀캘린더완성도',
							start : '2023-09-12',
							end : '2023-09-20',
							color : '#'
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
						},
						{
							title : '풀캘린더완성도',
							start : '2023-09-12',
							end : '2023-09-20',
							color : '#'
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
						},
						{
							title : '풀캘린더완성도',
							start : '2023-09-12',
							end : '2023-09-20',
							color : '#'
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
						},

				]
			});
			calendar.render();
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

	<script src="js/app.js"></script>
</body>
</html>