<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link href="${pageContext.request.contextPath}/css/project.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/projectheader.css" rel="stylesheet">
	
	<!-- Modal CSS -->
	<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<!-- Tab bar -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	
	
</head>

<body style="overflow: scroll;">
<div class="wrapper">
	
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>

	<div class="main">
	
		<%@ include file="/WEB-INF/views/headerNavbar.jsp" %>
		
		<main>
		<div class="project-detail-header" >
				<div class="testtt"><i id="projectColor" class="project-color color-code-1"></i></div>
				<div class="project-header-group"><h2 style="font-weight: bold;">프로젝트 이름</h2></div>
		</div>		
		<div class="w3-bar tabBar" style="height: 60px">
		  <button class="w3-bar-item w3" onclick="openTab('Tab1')" style="padding: 26px 25px">피드</button>
		  <button class="w3-bar-item w3" onclick="openTab('Tab2')" style="padding: 26px 25px">업무</button>
		  <button class="w3-bar-item w3" onclick="openTab('Tab3')" style="padding: 26px 25px">캘린더</button>
		</div>
		
		<!-- 피드 탭 -->
		<div id="Tab1" class="w3-container tab ptab">
			<main class="content">
				<h2>피드</h2>
				<div class="container-fluid p-0">
				<p>추후 진행</p>	
				
				<!-- 내용 -->
				
				
				</div>
			</main>
		</div>
		
		<!-- 업무 탭 [Task]-->
		<div id="Tab2" class="w3-container tab ptab" style="display:none" style="height: 60px">
			<main class="content">
				<div>
					<span class="text-tab">업무</span>
					<div class="search-tab">
						<input class="serinput" type="text" placeholder="검색어 입력">
						<img class="serimg-tab"	src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
					</div>
					<button class="btn btn-primary addTaskTab" data-bs-toggle="modal" data-bs-target="#myModal">업무 등록</button>
				</div>
				<%@ include file="/WEB-INF/views/addPtaskModal.jsp" %>
				
				<div class="container-fluid p-0">
				<table class="table table-hover my-0">
					<tr>
						<th class="d-none d-xl-table-cell">업무명</th>
						<th class="d-none d-xl-table-cell">담당자</th>
						<th class="d-none d-xl-table-cell">진행도</th>
						<th class="d-none d-xl-table-cell">작성날짜</th>
						<th class="d-none d-xl-table-cell">시작일</th>
						<th class="d-none d-xl-table-cell">마감일</th>
					</tr>
					<c:forEach items="${tlist}" var="tlist">
					<tr>
						<td>${tlist.ttitle}</td>
						<td>${tlist.tmember}</td>
						<%-- <td>${tlist.tstatus}</td> --%>
						<td>
							<select class="status setting" name="tname">
							  <option class="status request" selected="selected">요청</option>
							  <option class="status progress">진행</option>
							  <option class="status feedback">피드백</option>
							  <option class="status complete">완료</option>
							  <option class="status remain">보류</option>
							</select>
						</td>
						<td>${fn:split(tlist.tdate, " ")[0]}</td>
						<td>${fn:split(tlist.tstartDate, " ")[0]}</td>
						<td>${fn:split(tlist.tendDate, " ")[0]}</td>
					</tr>
					</c:forEach>		
				</table>
				</div>
			</main>
		</div>
		
		<!-- 캘린더 탭 -->
		<div id="Tab3" class="w3-container tab ptab" style="display:none" style="height: 60px">
				
				<main class="content">
				<h2>캘린더</h2>
				<div class="search-tab">
				 	<input class="serinput" type="text" placeholder="검색어 입력">
					<img class="serimg-tab"	src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
				<div class="container-fluid p-0">
				<p>임지연</p>	
				
				
				<!-- 내용 -->
				
				</div>
			</main>
		</div>
		</main>
	</div>

</div>
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
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
		    $(this).find("span").css({
		      "color": "#009b77"	
		    });
		    $(this).find("svg").css({
		      "color": "#009b77"	
		    });
		  });
		});
	</script>
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