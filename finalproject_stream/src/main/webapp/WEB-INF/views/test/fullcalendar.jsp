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

<title>fullcalendar 테스트</title>

<link href="${pageContext.request.contextPath }/css/app.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<!-- //fullcalendar css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- //fullcalendar script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- //fullcalendar 언어 설정관련 script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- modal jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>

/*more버튼*/
.fc-daygrid-more-link.fc-more-link {
	color: #000;
}

/* 일정추가 css */
#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>

</head>

<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/adminKit/sidebar.jsp"%>
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> <span
										class="indicator">4</span>
								</div>
						</a></li>

						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="img/avatars/avatar.jpg"
								class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span
								class="text-dark">Charles Hall</span>
						</a>
					</ul>
				</div>
			</nav>

			<%@include file="/WEB-INF/views/adminKit/footer.jsp"%>

			<main class="content">
				<div class="container">

					<h1 class="h3 mb-3">
						<strong>Calendar</strong>
					</h1>

					<script>
			      document.addEventListener('DOMContentLoaded', function() {
			        var calendarEl = document.getElementById('calendar');
			        var calendar = new FullCalendar.Calendar(calendarEl, {
			          initialView: 'dayGridMonth',
			        	  headerToolbar : { // 헤더에 표시할 툴 바
			      			start : 'prev next today',
			      			center : 'title',
			      			end : 'dayGridMonth,dayGridWeek,dayGridDay'
			      		},
			      		 dateClick: function(info) {
			                    alert('Clicked on: ' + info.dateStr); 
			                    // change the day's background color just for fun
			                    info.dayEl.style.backgroundColor = 'red';
			                },
			      		titleFormat : function(date) {
			      			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			      		},
			      		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			      		selectable : true, // 달력 일자 드래그 설정가능
			      		droppable : true,
			      		editable : true,
			      		nowIndicator: true, // 현재 시간 마크
			      		dayMaxEvents: 3,	// 일정 more 
			    	//	locale: 'ko', // 한국어 설정 
			      			events : [ 
			      	            {
			      	            	title : '풀캘린더완성도',
			      	                start : '2023-09-12',
			      	                end : '2023-09-20',
			      	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
			      	             },
			      	           {
				      	            	title : '풀캘린더완성도',
				      	                start : '2023-09-12',
				      	                end : '2023-09-20',
				      	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
				      	             },
				      	           {
					      	            	title : '풀캘린더완성도',
					      	                start : '2023-09-12',
					      	                end : '2023-09-20',
					      	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
					      	             },
					      	           {
						      	            	title : '풀캘린더완성도',
						      	                start : '2023-09-12',
						      	                end : '2023-09-20',
						      	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
						      	             },
						      	           {
							      	            	title : '풀캘린더완성도',
							      	                start : '2023-09-12',
							      	                end : '2023-09-20',
							      	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
							      	             },
			    
			      					]
			      		
			    
			        });
			        calendar.render();
			      });
			</script>

					<div class="crow">
						<div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
							<div class="card flex-fill w-100">
								<div class="card-header">
									<div class="btns-wr">
										<div class="project-search-area all-file-header-type-3">
											<div class="project-search">
												<input type="text" placeholder="일정명을 입력해주세요"
													class="js-calendar-search-input">
											</div>
										</div>
										<!-- 모달창  -->
										<div id="root">
											<button type="button" id="modal_opne_btn">+일정추가</button>
										</div>
												
										<div id="modal">
											<div class="modal_content">
												<h2>모달 창</h2>
												<p>모달 창 입니다.</p>
												<button type="button" id="modal_close_btn">모달 창 닫기</button>
											</div>
											<div class="modal_layer"></div>
										</div>

		
										<!-- 		<div class="btns_area">
											<button id="calendarAdd" type="button">+일정추가</button>
										</div>
										<div class="cmodal">
											<div class="cmodal_content">
												<h2>모달 창</h2>
												<p>모달 창 입니다.</p>
												<button type="button" id="cmodal_cloae_btn">모달 창 닫기</button>
											</div>
											<div class="modal_layer"></div>
										</div> -->

									</div>

								</div>
								<div class="ccard-body px-4">
										<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script>
		document.getElementById("modal_opne_btn").onclick = function() {
        document.getElementById("modal").style.display="block";
    	}
   
  		document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
   		}   
	</script>


	<!-- <script src="js/app.js"></script> -->

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>

</body>

</html>