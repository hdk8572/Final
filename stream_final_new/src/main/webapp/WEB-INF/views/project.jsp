<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
	<meta name="author" content="Stream">

	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>Stream - Final Project</title>
	
	<!--  Calendar CSS -->
	<link href="${pageContext.request.contextPath }/css/calreadmodal.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/calmodal.css" rel="stylesheet"> 
	<link href="${pageContext.request.contextPath }/css/fullcalendar.css" rel="stylesheet">  
	
	<!-- fullcalendar css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	
	<!-- Tab bar -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/project.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/projectheader.css" rel="stylesheet">
	
	<!-- Modal CSS -->
	<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">
	
	<!-- fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- SummerNote CDN -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	


	
	
</head>

<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>

			<main>
				<div class="project-detail-header">
					<div class="testtt">
						<i id="projectColor" class="project-color color-code-1"></i>
					</div>
					<div class="project-header-group">
						<h2 style="font-weight: bold;position: relative;left: -12px;">${projectPname.pname}</h2>
					</div>
				</div>
				<div class="w3-bar tabBar" style="height: 60px">
					<button class="w3-bar-item w3" onclick="openTab('Tab2')" style="padding: 26px 25px; color: rgb(0, 155, 119);">업무</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab3')" style="padding: 26px 25px">캘린더</button>
					<button class="w3-bar-item w3" onclick="openTab('Tab1')" style="padding: 26px 25px">피드</button>
				</div>

				<!-- 피드 탭 -->
				<div id="Tab1" class="w3-container tab ptab" style="display: none" style="height: 60px">
					<main class="content">
						<div class="tabtitle">
							<span class="text-tab">피드</span>
							<button class="btn btn-primary addTaskTab" data-bs-toggle="modal" data-bs-target="#myModal">업무 등록</button>
						</div>
						<div class="container-fluid p-0">
							<p>추후 진행</p>
							<!-- 내용 -->
						</div>
					</main>
				</div>

				<!-- 업무 탭 [Task]-->
				<div id="Tab2" class="w3-container tab ptab">
					<main class="content">
						<div class="tabtitle">
							<span class="text-tab">업무</span>
							<button class="btn btn-primary addTaskTab" data-bs-toggle="modal" data-bs-target="#myModal">업무 등록</button>
						</div>
						
						<%@ include file="/WEB-INF/views/addPtaskModal.jsp"%>

						<div class="container-fluid p-0">
							<table class="table table-hover my-0">
								<tbody>
								<tr>
									<th class="d-none d-xl-table-cell">업무명</th>
									<th class="d-none d-xl-table-cell">담당자</th>
									<th class="d-none d-xl-table-cell">진행도</th>
									<th class="d-none d-xl-table-cell">작성날짜</th>
									<th class="d-none d-xl-table-cell">시작일</th>
									<th class="d-none d-xl-table-cell">마감일</th>
								</tr>
								<c:forEach items="${tlist}" var="tlist">
									<tr class="listOne">
										<td>${tlist.ttitle}<button type="button" class="detailProject">상세내용</button></td>
										<td>${tlist.tmember}</td>
										<%-- <td>${tlist.tstatus}</td> --%>
										<input type="hidden" id="updateTstatus" >
										<td><select class="status setting" name="tstatus" id="updateTstatus">
												<option class="status request" selected="selected">요청</option>
												<option class="status progress">진행</option>
												<option class="status feedback">피드백</option>
												<option class="status complete">완료</option>
												<option class="status remain">보류</option>
										</select></td>
										<td>${fn:split(tlist.tdate, " ")[0]}</td>
										<td>${fn:split(tlist.tstartdate, " ")[0]}</td>
										<td>${fn:split(tlist.tenddate, " ")[0]}</td>
										<input type="hidden" name="tno" value="${tlist.tno}">
										<input type="hidden" name="pno" value="${tlist.pno}">
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<%@ include file="/WEB-INF/views/detailptaskmodal.jsp"%>
						</div>	
					</main>
				</div>

				<!-- 캘린더 탭 -->
				<div id="Tab3" class="w3-container tab ptab"  style="display: none" style="height: 60px">
					<main class="content" id="content-calendar">
						<div class="tabtitle">
							<span class="text-tab">캘린더</span>
							<button class="btn btn-primary addcal" id="myBtn" data-bs-toggle="modal" data-bs-target="#addcalmodal" onclick="getMemberProjectListHandler(this)">+일정추가</button>
						</div>
						<div class="container-fluid p-0">
							<!-- 내용  -->
							<%@ include file="/WEB-INF/views/calendar/calendar.jsp"%>
							
						</div>
					</main>
				</div>
			</main>
		</div>

	</div>
</body>
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<!-- SummerNote CDN -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<script>

	/* ajax 용 - contextPath 변수 지정 */
	const contextPath = "${pageContext.request.contextPath}";
	
	/* ajax 용 - principal.username */
	const useridJs = "${principal.username}";
	
	/* 상단 탭바 위치 이동*/
	function openTab(tabName) {
	  var i;
	  var x = document.getElementsByClassName("tab");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  document.getElementById(tabName).style.display = "block";
	   
	  if(tabName == "Tab3"){
		  loadCalendarHandler();
	  }
	}
	
	const nonClick = document.querySelectorAll(".w3-bar-item.w3");

	function handleClick(event) {
	  // div에서 모든 "click" 클래스 제거
	  nonClick.forEach((e) => {
	    e.classList.remove("click");
	  });
	  // 클릭한 div만 "click"클래스 추가
	  event.target.classList.add("click");
	  $(".w3-bar-item.w3").css("color", "black");
	  $(".w3-bar-item.w3.click").css("color", "#009b77");
	  
	}

	nonClick.forEach((e) => {
	  e.addEventListener("click", handleClick);
	  
	});	
	
	$(document).ready(function (){
		$("#summernote").summernote({				//  위즈윅 - summerNote		
		     placeholder: '프로젝트 설명을 입력해주세요.',
		     tabsize: 2,
		     height: 120,
		     toolbar: [
		       ['style', ['style']],
		       ['font', ['bold', 'underline', 'clear']],
		       ['color', ['color']],
		       ['para', ['ul', 'ol', 'paragraph']],
		       ['table', ['table']],
		       ['insert' /* ['link', 'picture', 'video'] */],
		       ['view', ['fullscreen', 'codeview', 'help']]
		     ]
		});
		$(this).find(".detailProject").click(detailProject);
		
	}); 
	
	</script>
	<script>
	$(".listOne").mouseover(function() {
		$(this).find(".detailProject").css("visibility", "visible");
	});
	$(".listOne").mouseout(function() {
		$(this).find(".detailProject").css("visibility", "hidden");
	});
	</script>
	<script>
	function detailProject() {
		targetTno = $(this).closest("tr").find("input[name=tno]").val();
		targetPno = $(this).closest("tr").find("input[name=pno]").val();
		targetRno = $(this).closest("tr").find("input[name=rno]").val();
		$("#detailProjectModal").modal("toggle");
		
		$.ajax({
		 	url: "${pageContext.request.contextPath}/member/ptaskselectOne",
		 	type: "get",
		 	dataType: "json",
		 	data: {tno: targetTno, pno: targetPno},
		 	async : false,
		 	success: function(result){
		 		console.log(result);
		 		$(".wrap-card .tcontent").html(result.tcontent);
		 		$(".wrap-card .ttitle").html(result.ttitle);
		 		$(".wrap-card .tstatus").html(result.tstatus);
		 		$(".wrap-card .userid").html(result.userid);
		 		$(".wrap-card .tstartdate").val(result.tstartdate);
		 		$(".wrap-card .tenddate").val(result.tenddate);
		 		$(".wrap-card [name=tno]").val(result.tno);
		 		$(".wrap-card [name=pno]").val(result.pno);
		 		replyLoadList();
		 	},
		 	error: function() {
		 		console.log("detailProject에서 오류 발생");
		 	}
		});
		
	}
	</script>
	<script>
	$("select[id=updateTstatus]").change(updateOption);

	function updateOption() {
 	    /* var updatedOption = $("select[id=updateStatus] option:selected").text(); */
		var updatedOption = $(event.target).find("option:selected").text();
 	    console.log(updatedOption);	
 	    $("#updateTstatus").val(updatedOption);
	}
	</script>
</html>