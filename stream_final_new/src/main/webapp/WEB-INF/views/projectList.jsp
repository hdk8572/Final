<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
 	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>AdminKit Demo - Bootstrap 5 Admin Template</title>
	
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/projectList.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/makeProjectModal.css" rel="stylesheet">
	<!-- Tab bar -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	  </head>

<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp" %>
		<div class="main">
			<%@ include file="/WEB-INF/views/headerNavbar.jsp" %>
			
			
			
			<main class="content">
				<div class="container-fluid p-0">
					
					<h1 class="h3 mb-3">
						<span>${userId}님의 프로젝트 목록</span>
						<span><button class="btn btn-primary addProject" id="myBtn" data-bs-toggle="modal" data-bs-target="#myModal">프로젝트 추가+</button></span>
					</h1>
						
					<%@ include file="/WEB-INF/views/modal.jsp" %>
						
						<div class="row">
						<div class="col-xl-6 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row">
									<c:forEach items="${list}" var="vo">
										<div class="col-sm-6">
 											<div class="card">
												<form class="frm select" action="${pageContext.request.contextPath}/ptask" method="post">
												<input type="hidden" name="pno" value="${vo.pno}">
													<div class="card-body" >
														<div class="row">
															<div class="col mt-0">
																<h5 class="card-title">
																	Project
																</h5>
															</div>
															
															<div class="col-auto">
																<div class="stat text-primary">
																	${vo.prow}
																</div>
															</div>
														</div>
														<h1 class="mt-1 mb-3">${vo.pname}</h1>
														<div class="mb-0">
															<!-- <span class="text-muted">진행 중</span> -->
															<span class="text-muted">${fn:split(vo.pstartDate, " ")[0]}~${fn:split(vo.pendDate, " ")[0]}</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle me-2"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
														</div>
													</div>
												</form>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/stream.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
	$(document).ready(function() {
		  $(".sidebar-link").mouseover(function() {
		    $(this).css({
		      "background-color": "#009b77",
		    });
		    $(this).find("span").css({
		      "color": "white"	
		    });
		    $(this).find("svg").css({
		      "color": "white"	
		    });
		  }).mouseout(function() {
		    $(this).css({
		      "background-color": "white",
		    });