<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- USER -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/setvariable.jsp"%>
<%@ include file="/WEB-INF/views/alertmsg.jsp" %>

<meta charset="utf-8">
<meta name="author" content="Stream">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - 업무도 흐름이다!</title>

<link href="${pageContext.request.contextPath }/css/streamapp.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/maintask.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>

	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">

				<div class="container-fluid p-0">
					<div class="h3 mb-3 jm-header">
					<c:if test="${findMname!=null }">
						<span>${findMname.mname }님의 프로젝트 목록</span> <span id="fullTaskCnt"></span>
					</c:if>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="jm-body">
								<!-- 반복문 안쓴곳 -->
									<div class="jm-rwap-task jm-grey">
										<div class="jm-task-title row ">
											<!-- dropdown -->
											<div class="jm-col-a jm-grey-nb">
												<div class="dropdown">
													<div class="jm-title" id="tno">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">업무명</span> <span> <svg
																	xmlns="http://www.w3.org/2000/svg" width="24"
																	height="24" viewBox="0 0 24 24" fill="none"
																	stroke="currentColor" stroke-width="2"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="feather feather-chevron-down align-middle">
																	<polyline points="6 9 12 15 18 9"></polyline></svg>
															</span>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="ttitle1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="ttitle2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="ttitle0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tstatus" draggable="true">
													<div class="jm-title">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">상태</span> <span> </span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tstatus1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tstatus2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tstatus0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tmember" draggable="true">
													<div class="jm-title">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">담당자</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tmember1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tmember2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tmember0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tstartdate"
													draggable="true">
													<div class="jm-title">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">시작일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tstartdate1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tstartdate2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tstartdate0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop  jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tenddate" draggable="true">
													<div class="jm-title">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">마감일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tenddate1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tenddate2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tenddate0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop  jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tdate" draggable="true">
													<div class="jm-title">
														<div class="text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">등록일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tdate1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tdate2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tdate0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jm-drop  jm-col-b jm-grey-nb">
												<div class="dropdown jm-move" id="tno" draggable="true">
													<div class="jm-title">
														<div class="text-muted"
															data-bs-toggle="dropdown">
															<span class="jm-cen">업무번호</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle">
																<polyline points="6 9 12 15 18 9"></polyline></svg>
														</div>
														<div class="mini-pop dropdown-menu dropdown-menu-end">
															<ul>
																<li class="dropdown-item jm-order" data-ordertype="tno1">오름차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tno2">내림차순</li>
																<li class="dropdown-item jm-order" data-ordertype="tno0">정렬 해제</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<ul id="taskContentUI">
										<c:forEach items="${projectList }" var="project">
											<li class="projectNo" id="projectNo_${project.pno }">
												<div class="jm-grey">
													<div class="jm-box-project-title jm-gr">
														<span> <svg xmlns="http://www.w3.org/2000/svg"
																width="24" height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-play align-middle jm-rotate">
																<polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
														</span> <span class="jm-project-title">${project.pname }</span> <span
															class="jm-project-task-count">(${project.maintaskList.size() })</span>
														<form class="jm-dn"
															action="${pageContext.request.contextPath }/member/ptasklist"
															method="get">
															<input type="hidden" name="pno" value="${project.pno}">
															<button class="jm-tp">바로가기</button>
														</form>
													</div>
												</div>
												<ul class="jm-inner-task">
													<li class="jm-wrap-section-task-title jm-gr">
														<ul class="jm-serction-task-title">
															<c:forEach items="${project.maintaskList }" var="task">
																<li class="plusplus row jm-task-line" id="taskNo_${task.tno}">
																	<div class="jm-title-ttitle jm-col-a jm-grey">
																		<span class="jm-margin-left"> 
																		<c:forEach begin="1"	end="${task.brelevel }">
																			<span>&#8618;</span></c:forEach>${task.ttitle}</span>
																		<c:if test="${task.brelevel == 0 }">
																			<button class="jm-inner-task-button jm-hidden-btn" onclick="innerTaskInputHandler(this); DateInputCheckHandler(this);">업무추가</button>
																		</c:if>
																		<button class="jm-tp jm-task-info jm-hidden-btn" onclick="taskDetailButtonClickTestHandler(this);">자세히 보기</button>
																		<div class="jm-hidden">
																			<input type="hidden" name="pno" value="${project.pno}">
																			<input type="hidden" name="tno" value="${task.tno }">
																		</div>
																	</div>
																	<div class="jm-title-tstatus jm-col-b jm-grey">${task.tstatus }</div>
																	<div class="jm-title-tmember jm-col-b jm-grey">${project.mname }</div>
																	<div class="jm-title-tstartdate jm-col-b jm-grey">${task.tstartdate }</div>
																	<div class="jm-title-tenddate jm-col-b jm-grey">${task.tenddate }</div>
																	<div class="jm-title-tdate jm-col-b jm-grey jm-gr">${task.tdate }</div>
																	<div class="jm-title-tno jm-col-b jm-grey jm-gr">${task.tno }</div>
																</li>
																<li class="jm-ajax-InnertaskIn">
																	<form class="addInnerTask" id="taskInputNo_${task.tno}">
																		<div class="jm-innerTaskInput jm-hidden">
																			<div class="jm-title-ttitle jm-col-a jm-grey">
																				<input type="text" class="jm-input-length jm-margin-left" placeholder="하위업무명을 입력하세요"
																					name="ttitle" required="required">
																			</div>
																			<div class="jm-title-tstatus jm-col-b jm-grey">
																				<select class="mb-3 selectCategory ml-2 "name="tstatus">
																					<option value="요청" class="status request" selected="selected">요청</option>
																					<option value="진행" class="status progress">진행</option>
																					<option value="피드백" class="status feedback">피드백</option>
																					<option value="완료" class="status complete">완료</option>
																					<option value="보류" class="status remain">보류</option>
																				</select>
																			</div>
																			<div class="jm-title-tmember jm-col-b jm-grey">
																				<select name="tmember" id="tmember_select_pno_${project.pno }"><!-- TMEMBERLIST ttttt -->
																					
																				</select>
																			</div>
																			<div class="dropdown jm-title-tstartdate jm-col-b jm-grey">
																				<div data-bs-toggle="dropdown">
																					<button class="btn btn-secondary">시작일</button>
																				</div>
																				<div class="mini-pop jm-date-input-layer dropdown-menu dropdown-menu-end">
																					<input type="date" name="tstartdate" required="required">
																				</div>
																			</div>
																			<div
																				class="dropdown jm-title-tenddate jm-col-b jm-grey">
																				<div data-bs-toggle="dropdown">
																					<button class="btn btn-secondary">마감일</button>
																				</div>
																				<div class="mini-pop jm-date-input-layer dropdown-menu dropdown-menu-end">
																					<input type="date" name="tenddate" required="required">
																				</div>
																			</div>
																			<div class="jm-title-tdate jm-col-b jm-grey jm-gr">
																				<div class="innerTdate"></div>
																			</div>
																			<div class="jm-title-tno jm-col-b jm-grey jm-gr">
																				<input type="hidden" name="tno" value="${task.tno}">
																				<input type="hidden" name="tcontent" value="default">
																				<input type="hidden" name="pno" value="${project.pno}">
																				<!-- 로그인 세션 받아서 등록 -->
																				<input type="hidden" name="userid" value="${principal.username}">
																				<button type="button" onclick="innerTaskaddListHandler(this)">추가하기</button>
																			</div>
																		</div>
																	</form>
																</li>
															</c:forEach>
														</ul>
													</li>
												</ul>
											</li>
										</c:forEach>
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
	<%@include file="/WEB-INF/views/task/maintaskscript.jsp" %>
	<%-- <%@ include file="/WEB-INF/views/detailptaskmodal.jsp"%> --%>
	<%@include file="/WEB-INF/views/task/maintasktaskdetailmodal.jsp" %>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/maintask.js"></script> --%>
	
	<script>
		taskSortHandler=()=>{
			var e1 = event.target;
			console.log(e1);
			var e2 = $(e1).data("ordertype");
			console.log(e2);
			
			$.ajax({
				type:"post",
			
				data:{
					ordertype : e2,
					userid : principal_username
					},
				dataType: "json",
				url: contextPath+"/member/sort",
				success:function(data){
					console.log(data);
					sortMakeView(data)
					},
				error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
			})
		}
		$(".jm-order").on("click", taskSortHandler);
	</script>
	<script>
	sortMakeView=(data)=>{
		console.log(data);
		
		var htmlList="";
		for(var p=0; p<data.length; p++){
			const project = data[p];
			htmlList+=`
		<li class="projectNo" id="projectNo_\${project.pno }">
			<div class="jm-grey">
				<div class="jm-box-project-title jm-gr">
					<span> <svg xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-play align-middle  jm-rotate">
							<polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
					</span> <span class="jm-project-title">\${project.pname }</span> <span
						class="jm-project-task-count">(\${project.maintaskList.length })</span>
					<form class="jm-dn"
						action="${pageContext.request.contextPath }/member/ptasklist"
						method="get">
						<input type="hidden" name="pno" value="\${project.pno}">
						<button class="jm-tp">바로가기</button>
					</form>
				</div>
			</div>
			<ul class="jm-inner-task">
				<li class="jm-wrap-section-task-title jm-gr">
					<ul class="jm-serction-task-title">
		`;
					for(var t=0; t<project.maintaskList.length; t++){
						const task = project.maintaskList[t];
		htmlList+=`
							<li class="plusplus row jm-task-line" id="taskNo_\${task.tno}">
								<div class="jm-title-ttitle jm-col-a jm-grey">
									<span class="jm-margin-left">
		`;
							for(var lv=0; lv<task.brelevel; lv++){
		htmlList+=`
										<span>&#8618;</span>
					`
							}
		htmlList+=`\${task.ttitle}
									</span>
					`
							if(task.brelevel ==0){
		htmlList+=`
										<button class="jm-inner-task-button jm-hidden-btn" onclick="innerTaskInputHandler(this); DateInputCheckHandler(this);">업무추가</button>
					`
							}
		htmlList+=`
									<button class="jm-tp jm-task-info jm-hidden-btn" onclick="taskDetailButtonClickTestHandler(this);">자세히 보기</button>
									<div class="jm-hidden">
										<input type="hidden" name="pno" value="\${project.pno}">
										<input type="hidden" name="tno" value="\${task.tno }">
									</div>
								</div>
								<div class="jm-title-tstatus jm-col-b jm-grey">\${task.tstatus }</div>
								<div class="jm-title-tmember jm-col-b jm-grey">\${project.mname }</div>
								<div class="jm-title-tstartdate jm-col-b jm-grey">\${task.tstartdate }</div>
								<div class="jm-title-tenddate jm-col-b jm-grey">\${task.tenddate }</div>
								<div class="jm-title-tdate jm-col-b jm-grey jm-gr">\${task.tdate }</div>
								<div class="jm-title-tno jm-col-b jm-grey jm-gr">\${task.tno }</div>
							</li>
							<li class="jm-ajax-InnertaskIn">
								<form class="addInnerTask" id="taskInputNo_\${task.tno}">
									<div class="jm-innerTaskInput jm-hidden">
										<div class="jm-title-ttitle jm-col-a jm-grey">
											<input class="jm-input-length jm-margin-left " type="text" placeholder="하위업무명을 입력하세요"
												name="ttitle" required="required">
										</div>
										<div class="jm-title-tstatus jm-col-b jm-grey">
											<select class="mb-3 selectCategory ml-2" name="tstatus">
													<option value="요청" class="status request" selected="selected">요청</option>
													<option value="진행" class="status progress">진행</option>
													<option value="피드백" class="status feedback">피드백</option>
													<option value="완료" class="status complete">완료</option>
													<option value="보류" class="status remain">보류</option>
											</select>
											
										</div>
										<div class="jm-title-tmember jm-col-b jm-grey">
												<select name="tmember" id="tmember_select_pno_\${project.pno }"><!-- TMEMBERLIST ttttt -->
												
												</select>
										</div>
										<div class="dropdown jm-title-tstartdate jm-col-b jm-grey">
											<div data-bs-toggle="dropdown">
												<button class="btn btn-secondary">시작일</button>
											</div>
											<div class="mini-pop dropdown-menu dropdown-menu-end">
												<input type="date" name="tstartdate">
											</div>
										</div>
										<div
											class="dropdown jm-title-tenddate jm-col-b jm-grey">
											<div data-bs-toggle="dropdown">
												<button class="btn btn-secondary">마감일</button>
											</div>
											<div class="mini-pop dropdown-menu dropdown-menu-end">
												<input type="date" name="tenddate">
											</div>
										</div>
										<div class="jm-title-tdate jm-col-b jm-grey jm-gr">
											<div class="innerTdate"></div>
										</div>
										<div class="jm-title-tno jm-col-b jm-grey jm-gr">
											<input type="hidden" name="tno" value="\${task.tno}">
											<input type="hidden" name="tcontent" value="default">
											<input type="hidden" name="pno" value="\${project.pno}">
											<!-- 로그인 세션 받아서 등록 -->
											<input type="hidden" name="userid" value="\${principal_username}">
											<button type="button" onclick="innerTaskaddListHandler(this);">추가하기</button>
										</div>
									</div>
								</form>
							</li>
		`
					}	
		htmlList+=`
					</ul>
				</li>
			</ul>
		</li>
		`
		}
	
		$('#taskContentUI').html(htmlList)
		titleHoverHandler()
	}
	</script>
	<script>
	function titleHoverHandler(){
		$(".jm-title-ttitle").hover(()=>{
			//$(event.target).find(".jm-hidden-btn").addClass("active");
			$(".jm-hidden-btn").css("visibility", "hidden");
			$(event.target).find(".jm-hidden-btn").css("visibility", "visible");
		},()=>{
			$(event.target).find(".jm-hidden-btn").css("visibility", "hidden");
			//$(event.target).find(".jm-hidden-btn").removeClass("active");
		})
		}
	</script>
	<script>
	DateInputCheckHandler=(thisElement)=>{
		console.log("===DateInputCheckHandler===")
		console.log(thisElement);
		var dateA1 = $(thisElement).closest('li').next().children('form')[0].id;
		console.log(dateA1);
		var dateA2 = "#"+dateA1;
		console.log(dateA2);
		var startDateInput = $(dateA2).find('input[name=tstartdate]')[0];
		var endDateInput = $(dateA2).find('input[name=tenddate]')[0];
		console.log(startDateInput);
		console.log(endDateInput);
		
			startDateInput.addEventListener('change', function() {
				console.log(startDateInput.value);
			compareDates();
		});
		
			endDateInput.addEventListener('change', function() {
				console.log(endDateInput.value);
			compareDates();
		});
	
		function compareDates() {
			var startDate = new Date(startDateInput.value);
			var endDate = new Date(endDateInput.value);
			
			if(endDate < startDate) {
				alert("입력한 종료일이 시작일보다 이전입니다. 올바른 날짜를 선택해 주세요.");
				
				endDateInput.value = ''; //종료일 입력필드 초기화
			}
		} 
	}
</script>
<script>
	jmRegExp=(thisElement)=>{
		console.log("===정규표현식===");
		console.log(thisElement);	//추가하기 버튼
		var eTarget1 = $(thisElement).parent();	
		console.log(eTarget1);
		var eTargetTtitle = $(eTarget1).siblings('.jm-title-ttitle').find('input[name=ttitle]')[0];
		console.log(eTargetTtitle);	//	input [name=ttitle]
		var ttitleValue = $(eTargetTtitle).val();	
		console.log(ttitleValue);	//input 입력값
		
		var eTargetTstartdate = $(eTarget1).siblings('.jm-title-tstartdate').find('input[name=tstartdate]')[0];
		console.log(eTargetTstartdate);
		var tstartdateValue = $(eTargetTstartdate).val();	//input[name=tstartdate].val
		console.log(tstartdateValue);
		
		var eTargetTenddate = $(eTarget1).siblings('.jm-title-tenddate').find('input[name=tenddate]')[0];
		console.log(eTargetTenddate);
		var tendDateValue = $(eTargetTenddate).val();	//input[name=tenddate].val
		console.log(tendDateValue);
		
		var regTtitleValue = /^(?:(?:[ㄱ-ㅎ가-힣]{1,13}|[A-Za-z]{1,40}|[!@#$%^&*()_+]{1,13}|\d{1,40}| ){1,40})$/;
		
		
		if(ttitleValue==""){
			alert("업무명을 입력해 주세요.")
			
			$(eTargetTtitle).focus();
			return false;
		}else if(!regTtitleValue.test(ttitleValue)){
			alert("업무명은 한글 13자(띄어쓰기 포함), 영어, 숫자, 특수문자 40자(띄어쓰기 포함) 까지 입력 가능합니다.")
			eTargetTtitle.value="";
			$(eTargetTtitle).focus();
			return false;
		}
		if(!tstartdateValue){
			alert("시작 날자를 지정해 주세요");
			return false;
		}
		if(!tendDateValue){
			alert("마감 날자를 지정해 주세요");
			return false;
		}
		
		return true;
	}
</script>

</body>

</html>