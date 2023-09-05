<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>업무 보기 페이지</title>

<link href="${pageContext.request.contextPath }/css/app.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
.jm-body ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.jm-task-aside {
	float: right;
	direction: ltr;
	max-width: 260px;
	min-width: 260px;
	background: #dfdfdf;
}
/* 
.jm-task-title {
	overflow: hidden;
}

.jm-task-title>div {
	float: left;
}
.jm-serction-task-title>li{
	overflow: hidden;
}

.jm-serction-task-title div {
	float: left;
}  
*/
/* 
#tno {
	width: 500px;
}

#tstatus {
	width: 100px;
}

#tmember {
	width: 100px;
}

.
#tstartdate {
	width: 100px;
}

#tenddate {
	width: 100px;
}

#tdate {
	width: 100px;
} */
</style>
<style>
.mini-pop {
	display: none
}

.mini-pop.active {
	display: block;
}
</style>
<script>
	window.onload = loadedHandler;
	function loadedHandler() {
		//$(".jm-title").children('button').hide();
		//$(".jm-title").hover(hnHandler, hdHandler);
		//$(".jm-title").click(clickHandler);
		//$(".jm-title").blur(blurHandler);

	}
	/*
	function hdHandler(e){
		$(".jm-title").children('button').hide();
		
		if($(".mini-pop").hasClass("show")){
			$(".mini-pop").removeClass("show");
		}
		
	}
	function hnHandler(e){
		$(this).children("button").show();
	}
	function clickHandler(e){
		$(this).children(".mini-pop").addClass("show");
	} */
</script>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/task/maintast-side.jsp"%>
		<!-- 
		<aside class="jm-task-aside">
			<div>
				<ul>
					<li>
						<div>상태</div>
						<div>
							<ul>
								<li><input type="checkbox">요청</li>
								<li><input type="checkbox">진행</li>
								<li><input type="checkbox">피드백</li>
								<li><input type="checkbox">완료</li>
								<li><input type="checkbox">보류</li>
							</ul>
						</div>
					</li>

					<li>
						<div>시작일</div>
						<ul>
							<li><input type="radio" name="startdate">전체</li>
							<li><input type="radio" name="startdate">오늘</li>
							<li><input type="radio" name="startdate">이번 주</li>
							<li><input type="radio" name="startdate">이번 달</li>
							<li><input type="radio" name="startdate">미정</li>
						</ul>
					</li>
					<li>
						<div>마감일</div>
						<ul>
							<li><input type="radio" name="enddate">전체</li>
							<li><input type="radio" name="enddate">지연</li>
							<li><input type="radio" name="enddate">오늘</li>
							<li><input type="radio" name="enddate">이번 주</li>
							<li><input type="radio" name="enddate">이번 달</li>
							<li><input type="radio" name="enddate">미정</li>
						</ul>
					</li>
				</ul>
			</div>
		</aside> 
		-->
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
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">4 New Notifications</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-danger" data-feather="alert-circle"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Update completed</div>
												<div class="text-muted small mt-1">Restart server 12
													to complete the update.</div>
												<div class="text-muted small mt-1">30m ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-warning" data-feather="bell"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Lorem ipsum</div>
												<div class="text-muted small mt-1">Aliquam ex eros,
													imperdiet vulputate hendrerit et.</div>
												<div class="text-muted small mt-1">2h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-primary" data-feather="home"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Login from 192.186.1.8</div>
												<div class="text-muted small mt-1">5h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-success" data-feather="user-plus"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">New connection</div>
												<div class="text-muted small mt-1">Christina accepted
													your request.</div>
												<div class="text-muted small mt-1">14h ago</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all notifications</a>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="message-square"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">4 New Messages</div>
								</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-5.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Vanessa Tucker">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Vanessa Tucker</div>
												<div class="text-muted small mt-1">Nam pretium turpis
													et arcu. Duis arcu tortor.</div>
												<div class="text-muted small mt-1">15m ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-2.jpg"
													class="avatar img-fluid rounded-circle"
													alt="William Harris">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">William Harris</div>
												<div class="text-muted small mt-1">Curabitur ligula
													sapien euismod vitae.</div>
												<div class="text-muted small mt-1">2h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-4.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Christina Mason">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Christina Mason</div>
												<div class="text-muted small mt-1">Pellentesque auctor
													neque nec urna.</div>
												<div class="text-muted small mt-1">4h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-3.jpg"
													class="avatar img-fluid rounded-circle"
													alt="Sharon Lessman">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Sharon Lessman</div>
												<div class="text-muted small mt-1">Aenean tellus
													metus, bibendum sed, posuere ac, mattis non.</div>
												<div class="text-muted small mt-1">5h ago</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all messages</a>
								</div>
							</div></li>
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
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i
									class="align-middle me-1" data-feather="settings"></i> Settings
									& Privacy</a> <a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="help-circle"></i> Help
									Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">전체 업무</h1>
					<div class="card-body">
						<input type="text" class="form-control"
							placeholder="업무명 또는 업무번호를 검색하세요">
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Empty card</h5>
								</div>
								<div class="card-body jm-body">
									<div class="jm-rwap-task">
										<div class="jm-task-title row">
											<!-- dropdown -->
											<div class="dropdown col-lg-4">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>업무명</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-1">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>상태</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-1">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>담당자</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-1">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>시작일</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-1">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>마감일</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-1">
												<div class="jm-title" id="tno">
													<div class="card-subtitle text-muted dropdown-toggle"
														data-bs-toggle="dropdown">
														<span>등록일</span>
													</div>
													<div class="mini-pop dropdown-menu dropdown-menu-end">
														<ul>
															<li class="dropdown-item">오름차순</li>
															<li class="dropdown-item">내림차순</li>
															<li class="dropdown-item">정렬 해제</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="dropdown col-lg-auto">
												<div class="jm-title" id="empty">
													<div class="card-subtitle text-muted">
														<span>빈공간</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<ul id="taskContentUI">
										<li id="projectNo">
											<div class="jm-title-button">
												<div class="jm-wrap-project-title">
													<span class="jm-project-title">프로젝트명</span> <span
														class="jm-project-task-count">(0)업무개수</span>
													<button class="jm-project-button">바로가기</button>
												</div>
											</div>
											<ul class="jm-inner-task">
												<div class="jm-wrap-section-task-title">
													<ul class="jm-serction-task-title">
														<li class="plusplus row">
															<div class="jm-title-tno col-lg-4">프로젝트명</div>
															<div class="jm-title-tstatus col-lg-1">상태</div>
															<div class="jm-title-tmember col-lg-1">담당자</div>
															<div class="jm-title-tstartdate col-lg-1">시작일</div>
															<div class="jm-title-tenddate col-lg-1">마감일</div>
															<div class="jm-empty-cell col-lg-1">등록일</div>
														</li>
													</ul>
												</div>
											</ul>
										</li>
									</ul>

								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			<%@include file="/WEB-INF/views/footer.jsp"%>
		</div>
	</div>

	<script src="js/app.js"></script>

	<script>
		/* 	document.addEventListener("DOMContentLoaded", function() {
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
			}); */
	</script>
	<script>
		/* document.addEventListener("DOMContentLoaded", function() {
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
		}); */
	</script>
	<script>
		/* document.addEventListener("DOMContentLoaded", function() {
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
		}); */
	</script>
	<script>
		/* document.addEventListener("DOMContentLoaded", function() {
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
		}); */
	</script>
	<script>
		/* document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		}); */
	</script>
	<script>
		
	</script>

</body>

</html>