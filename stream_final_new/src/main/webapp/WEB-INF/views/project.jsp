<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
	<meta name="author" content="Stream">

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>Stream - 업무도 흐름이다!</title>
	
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
				<div class="w3-bar tabBar" >
					<button class="w3-bar-item w3" onclick="openTab('TabTask')" data-tabmenu="TabTask" >업무</button>
					<button class="w3-bar-item w3" onclick="openTab('TabCalendar')" data-tabmenu="TabCalendar">캘린더</button>
					<button class="w3-bar-item w3" onclick="openTab('TabPheed')" data-tabmenu="TabPheed" >피드</button>
				</div>

				<!-- 피드 탭 -->
				<div id="TabPheed" class="w3-container tab ptab" >
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
				<div id="TabTask" class="w3-container tab ptab">
					<main class="content">
						<div class="tabtitle">
							<span class="text-tab">업무</span>
							<button class="btn btn-primary addTaskTab" data-bs-toggle="modal" data-bs-target="#myModal">업무 등록</button>
						</div>
						
						<%@ include file="/WEB-INF/views/addPtaskModal.jsp"%>

						<div class="container-fluid p-0">
							<input type="hidden" name="pno" value="${pno}">
							<table class="table table-hover my-0">
								<tbody>
								<tr>
									<th class="d-none d-xl-table-cell">업무명</th>
									<th class="d-none d-xl-table-cell">담당자</th>
									<th class="d-none d-xl-table-cell">진행도</th>
									<th class="d-none d-xl-table-cell">작성일</th>
									<th class="d-none d-xl-table-cell">시작일</th>
									<th class="d-none d-xl-table-cell">마감일</th>
								</tr>
								</tbody>
								<tbody class="wrap-PtaskList">
								<!--  
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
								-->
								</tbody>
							</table>
							<%@ include file="/WEB-INF/views/detailptaskmodal.jsp"%>
						</div>	
					</main>
				</div>

				<!-- 캘린더 탭 -->
				<div id="TabCalendar" class="w3-container tab ptab">
					<main class="content" id="content-calendar">
						<div class="tabtitle">
							<span class="text-tab">캘린더</span>
							<button class="btn btn-primary addcal" id="myBtn" type="reset" data-bs-toggle="modal" data-bs-target="#addcalmodal" onclick="getMemberProjectListHandler(this)">+일정추가</button>
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

	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<!-- SummerNote CDN -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<script>

	/* ajax 용 - contextPath 변수 지정 */
	const contextPath = "${pageContext.request.contextPath}";
	
	/* ajax 용 - principal.username */
	const useridJs = "${principal.username}";
	const ptaskPno = $(".container-fluid.p-0").find("input[name=pno]").val();
	

	
	/* 상단 탭바 위치 이동*/
	function openTab(tabName) {
	  var i;
	  var x = document.getElementsByClassName("tab");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  $(".w3-bar-item.w3").removeClass("click");
	  $(".w3-bar-item.w3").each(function(idx, thisElement){
		  if(tabName == $(thisElement).data("tabmenu")){
			  $(thisElement).addClass("click");
		  }
	  });
	  
	  document.getElementById(tabName).style.display = "block";
	  if(tabName == "TabCalendar"){
		  loadCalendarHandler();
	  } else if(tabName == "TabTask") {
		  loadPtaskList();
	  }
	}
	
	$(document).ready(function() {
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
		// 로딩되고 나서 처음 // 업무가 보이도록 함.  // 만약 calendar 설정되어있다면 calendar가 보이도록함.
		var tabmenu = "${projectTabs}";
		if(tabmenu == "TabCalendar"){
			openTab('TabCalendar');
		} else {
			openTab('TabTask');
		}
		
		$(document).on('click', '.deletePtask', updatePtaskHide);
		$(this).find(".detailProject").click(detailProject);
	}); 
	
	</script>
	<script>
	function mouseEvent() {
		$(".listOne").hover(
			function(){
				$(".detailProject").css("visibility", "hidden");
				$(".deletePtask").css("visibility", "hidden");
				$(this).find(".detailProject").css("visibility", "visible");
				$(this).find(".deletePtask").css("visibility", "visible");
		},
			function(){
				$(".deletePtask").css("visibility", "hidden");				
			}
		);
		
	}
	
	
	
	</script>
	<script>
	
	function loadPtaskList() {
		$.ajax({
			url: "${pageContext.request.contextPath}/member/loadPtaskList",
			type: "get",
			async : false,
			dataType: "json",
			data: {pno: ptaskPno},
			success: function(data) {
				console.log("data :");
				console.log(data);
				makePtaskList(data);
			},
			error: function() {
				console.log("loadPtaskList에서 실패");
			}
		});
		console.log("loadPtaskList 실행");
		mouseEvent(); 
	}
	
	function makePtaskList(data) {
	    var pTaskListHtml = "";
	    for(var i=0; i<data.length; i++){
			var pl = data[i];

			console.log("item.tstatus :"+pl.tstatus);
			
			pTaskListHtml+=`
	        	<tr class="listOne">
					<td>\${pl.ttitle}<button type="button" class="detailProject">상세내용</button></td>
					<td>\${pl.tmember}</td>
					<%-- <td>${tlist.tstatus}</td> --%>
					<input type="hidden" id="updateTstatus" >
//					\${pl.tstatus}
					<input type="hidden" id="currentTstatus" value="\${pl.tstatus}" >
					<td>
						<select class="status setting" name="tstatus" id="updateTstatus_\${i}">
							<option class="status request" value="미진행" name="미진행" selected>미진행</option>
							<option class="status progress" value="진행" name="진행">진행</option>
							<option class="status remain" value="보류" name="보류">보류</option>
						</select>
					</td>
					<td>\${pl.tdate}</td>
					<td>\${pl.tstartdate}</td>
					<td>\${pl.tenddate}
						<button type="button" class="deletePtask"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg></button>
					</td>
					<input type="hidden" name="tno" value="\${pl.tno}">
					<input type="hidden" name="pno" value="\${pl.pno}">
				</tr>`;
				}
	    $(".wrap-PtaskList").html(pTaskListHtml);
	    for(var i=0; i<data.length; i++){
			var pl = data[i];
			console.log("item.tstatus :"+pl.tstatus);
			$("select#updateTstatus_"+i).val(pl.tstatus).prop("selected", true);
	    }
	}
	
	function detailProject() {
		var targetTno = $(this).closest("tr").find("input[name=tno]").val();
		var targetPno = $(this).closest("tr").find("input[name=pno]").val();
		var targetRno = $(this).closest("tr").find("input[name=rno]").val();
		$("#detailProjectModal").modal("toggle");
		
		$.ajax({
		 	url: "${pageContext.request.contextPath}/member/ptaskselectOne",
		 	type: "get",
		 	dataType: "json",
		 	data: {tno: targetTno, pno: targetPno},
		 	async : false,
		 	success: function(result){
		 		$(".wrap-card .tcontent").html(result.tcontent);
		 		$(".wrap-card .ttitle").html(result.ttitle);
		 		$(".wrap-card .tstatus").html(result.tstatus);
		 		$(".wrap-card .userid").html(result.userid);
		 		$(".wrap-card .tstartdate").val(result.tstartdate);
		 		$(".wrap-card .tenddate").val(result.tenddate);
		 		$(".wrap-card [name=tno]").val(result.tno);
		 		$(".wrap-card [name=pno]").val(result.pno);
		 		replyLoadList(targetTno);
		 	},
		 	error: function() {
		 		console.log("detailProject에서 오류 발생");
		 	}
		});
		
	}
	
	function updatePtaskHide() {
		var targetTno = $(this).closest("tr").find("input[name=tno]").val();
		console.log(targetTno);
		$.ajax({
			url: "${pageContext.request.contextPath}/member/updateTstatusHide",
			type: "post",
			data: {tno: targetTno},
			dataType: "json",
			success: function() {
				loadPtaskList();
			},
			error: function(error) {
				console.log("updateTstatusHide 실패");
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
	<script>
	
	function selectOption() {
		$("select[name=tstatus]").load(function() {
			console.log($(this).val());
		});
		
		$("select[name=tstatus]").change(function() {
			console.log($(this).val());
		});
	}
	
	
	
	
	</script>
</body>
</html>