<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${pageContext.request.contextPath }/css/jm.css"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script src="${pageContext.request.contextPath }/js/maintask.js"></script>

</head>
<body>
	<div class="wrapper">
		<%-- <%@include file="/WEB-INF/views/task/maintast-side.jsp"%> --%>
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headerNavbar.jsp"%>
			<main class="content">
			
				<div class="container-fluid p-0">

					<div class="h3 mb-3 jm-header">
						<div>
							<span>전체 업무</span>
							<span id="fullTaskCnt"></span>
						</div>
					</div>
					<div>
						<div class="card-body">
							<div class="search">
								<input class="serinput" type="text"
									placeholder="업무명, 업무번호를 입력하세요."> <img class="serimg"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body jm-body">
									<div class="jm-rwap-task jm-grey">
										<div class="jm-task-title row ">
											<!-- dropdown -->
											<div class="col-lg-4 jm-grey-nb">
												<div class="dropdown">
													<div class="jm-title" id="tno">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>업무명</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tstatus" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>상태</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tmember" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>담당자</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tstartdate"
													draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>시작일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tenddate" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>마감일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tdate" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>등록일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tdate" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span>업무번호</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down align-middle me-2"><polyline points="6 9 12 15 18 9"></polyline></svg>
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
											</div>
											<div class="dropdown col-lg-auto">
												<div class="jm-title" id="empty">
													<div class="card-subtitle text-muted">
														
													</div>
												</div>
											</div>
										</div>
									</div>
									<ul id="taskContentUI">
										<c:forEach items="${projectList }" var="project">
											<li id="projectNo">
												<div class="jm-grey">
													<div class="jm-box-project-title jm-gr">
														<span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
															 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
															  class="feather feather-play align-middle me-2 jm-rotate"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
														</span>
														<span class="jm-project-title">${project.pname }</span> 
														<span class="jm-project-task-count">(${project.maintaskList.size() })</span>
														<form class="jm-dn" action="${pageContext.request.contextPath }/ptasklist" method="get">
															<input type="hidden" name="pno" value="${project.pno}" >
															<button class="jm-project-button jm-tp">바로가기</button>
														</form>
													</div>
												</div>
												<ul class="jm-inner-task">
													<div class="jm-wrap-section-task-title jm-gr">
														<ul class="jm-serction-task-title">
															<c:forEach items="${project.maintaskList }" var="task">
																<li class="plusplus row">
																	<div class="jm-title-ttitle col-lg-4 jm-grey">
																		<span>${task.ttitle	}</span>
																		<button>업무추가</button>
																		<form action="#">
																			<span class="jm-tp jm-task-info">자세히 보기</span>
																		</form>
																	</div>
																	<div class="jm-title-tstatus col-lg-1 jm-grey">${task.tstatus }</div>
																	<div class="jm-title-tmember col-lg-1 jm-grey">${task.tmember }</div>
																	<div class="jm-title-tstartdate col-lg-1 jm-grey">${task.tstartdate }</div>
																	<div class="jm-title-tenddate col-lg-1 jm-grey">${task.tenddate }</div>
																	<div class="jm-empty-tdate col-lg-1 jm-grey jm-gr">${task.tdate }</div>
																	<div class="jm-empty-tdate col-lg-1 jm-grey jm-gr">${task.tno }</div>
																</li>
															</c:forEach>
														</ul>
													</div>
												</ul>
											</c:forEach>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script src="js/app.js"></script>

</body>

</html>