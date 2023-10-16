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

<meta charset="utf-8">
<meta name="author" content="Stream">

<link rel="shortcut icon" href="img/icons/icon-48x48.png" /> <!-- 로고 결정 요망 -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - Final Project</title>

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
						<div>
							<span>전체 업무</span> <span id="fullTaskCnt"></span>
						</div>
					</div>
					<div>
						<div class="card-body">
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body jm-body">
								<!-- 반복문 안쓴곳 -->
									<div class="jm-rwap-task jm-grey">
										<div class="jm-task-title row ">
											<!-- dropdown -->
											<div class="col-lg-4 jm-grey-nb">
												<div class="dropdown">
													<div class="jm-title" id="tno">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">업무명</span> <span> <svg
																	xmlns="http://www.w3.org/2000/svg" width="24"
																	height="24" viewBox="0 0 24 24" fill="none"
																	stroke="currentColor" stroke-width="2"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tstatus" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">상태</span> <span> </span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tmember" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">담당자</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tstartdate"
													draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">시작일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tenddate" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">마감일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tdate" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted "
															data-bs-toggle="dropdown">
															<span class="jm-cen">등록일</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="jm-drop  col-lg-1 jm-grey-nb">
												<div class="dropdown jm-move" id="tno" draggable="true">
													<div class="jm-title">
														<div class="card-subtitle text-muted"
															data-bs-toggle="dropdown">
															<span class="jm-cen">업무번호</span>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down align-middle me-2">
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
											<div class="dropdown col-lg-auto">
												<div class="jm-title" id="empty">
													<div class="card-subtitle text-muted"></div>
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
																class="feather feather-play align-middle me-2 jm-rotate">
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
																	<div class="jm-title-ttitle col-lg-4 jm-grey">
																		<span> <c:forEach begin="1"	end="${task.brelevel }">
																			&#8618;
																		</c:forEach> ${task.ttitle}
																		</span>
																		<c:if test="${task.brelevel == 0 }">
																			<button class="jm-inner-task-button" onclick="innerTaskInputHandler(this);">업무추가</button>
																		</c:if>
																		<button class="jm-tp jm-task-info" onclick="taskDetailButtonClickTestHandler(this);">자세히 보기</button>
																		<div class="jm-hidden">
																			<input type="hidden" name="pno" value="${project.pno}">
																			<input type="hidden" name="tno" value="${task.tno }">
																		</div>
																	</div>
																	<div class="jm-title-tstatus col-lg-1 jm-grey">${task.tstatus }</div>
																	<div class="jm-title-tmember col-lg-1 jm-grey">${task.tmember }</div>
																	<div class="jm-title-tstartdate col-lg-1 jm-grey">${task.tstartdate }</div>
																	<div class="jm-title-tenddate col-lg-1 jm-grey">${task.tenddate }</div>
																	<div class="jm-title-tdate col-lg-1 jm-grey jm-gr">${task.tdate }</div>
																	<div class="jm-title-tno col-lg-1 jm-grey jm-gr">${task.tno }</div>
																</li>
																<li class="jm-ajax-InnertaskIn">
																	<form class="addInnerTask" id="taskInputNo_${task.tno}">
																		<div class="jm-innerTaskInput jm-hidden">
																			<div class="jm-title-ttitle col-lg-4 jm-grey">
																				<input type="text" placeholder="하위업무명을 입력하세요"
																					name="ttitle" required="required">
																			</div>
																			<div class="jm-title-tstatus col-lg-1 jm-grey">
																				<span> <select
																					class="form-select mb-3 selectCategory ml-2 "
																					name="tstatus">
																						<option value="요청" class="status request"
																							selected="selected">요청</option>
																						<option value="진행" class="status progress">진행</option>
																						<option value="피드백" class="status feedback">피드백</option>
																						<option value="완료" class="status complete">완료</option>
																						<option value="보류" class="status remain">보류</option>
																				</select>
																				</span>
																			</div>
																			<div class="jm-title-tmember col-lg-1 jm-grey">
																				<span>
																					<select name="tmember" id="tmember_select_pno_${project.pno }"><!-- TMEMBERLIST ttttt -->
																					
																					</select>
																				</span>
																			</div>
																			<div class="dropdown jm-title-tstartdate col-lg-1 jm-grey">
																				<div data-bs-toggle="dropdown">
																					<button class="btn btn-secondary">시작일</button>
																				</div>
																				<div class="mini-pop dropdown-menu dropdown-menu-end">
																					<input type="date" name="tstartdate">
																				</div>
																			</div>
																			<div
																				class="dropdown jm-title-tenddate col-lg-1 jm-grey">
																				<div data-bs-toggle="dropdown">
																					<button class="btn btn-secondary">마감일</button>
																				</div>
																				<div class="mini-pop dropdown-menu dropdown-menu-end">
																					<input type="date" name="tenddate">
																				</div>
																			</div>
																			<div class="jm-title-tdate col-lg-1 jm-grey jm-gr">
																				<div class="innerTdate"></div>
																			</div>
																			<div class="jm-title-tno col-lg-1 jm-grey jm-gr">
																				<input type="hidden" name="tno" value="${task.tno}">
																				<input type="hidden" name="tcontent" value="default">
																				<input type="hidden" name="pno" value="${project.pno}">
																				<!-- 로그인 세션 받아서 등록 -->
																				<input type="hidden" name="userid" value="${principal.username}">
																				<button type="button" onclick="innerTaskaddListHandler(this);">추가하기</button>
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
				<%@ include file="/WEB-INF/views/detailptaskmodal.jsp"%>
			</main>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/footer.jsp"%>
	
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/js/maintask.js"></script>
	<script>
		abc=()=>{
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
				url: contextPath+"/sort",
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
		$(".jm-order").on("click", abc);
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
							class="feather feather-play align-middle me-2 jm-rotate">
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
								<div class="jm-title-ttitle col-lg-4 jm-grey">
									<span>
		`;
							for(var lv=0; lv<task.brelevel; lv++){
		htmlList+=`
										&#8618;
					`
							}
		htmlList+=`
									\${task.ttitle}
									</span>
					`
							if(task.brelevel ==0){
		htmlList+=`
										<button class="jm-inner-task-button" onclick="innerTaskInputHandler(this);">업무추가</button>
					`
							}
		htmlList+=`
									<button class="jm-tp jm-task-info" onclick="taskDetailButtonClickTestHandler(this);">자세히 보기</button>
									<div class="jm-hidden">
										<input type="hidden" name="pno" value="\${project.pno}">
										<input type="hidden" name="tno" value="\${task.tno }">
									</div>
								</div>
								<div class="jm-title-tstatus col-lg-1 jm-grey">\${task.tstatus }</div>
								<div class="jm-title-tmember col-lg-1 jm-grey">\${task.tmember }</div>
								<div class="jm-title-tstartdate col-lg-1 jm-grey">\${task.tstartdate }</div>
								<div class="jm-title-tenddate col-lg-1 jm-grey">\${task.tenddate }</div>
								<div class="jm-title-tdate col-lg-1 jm-grey jm-gr">\${task.tdate }</div>
								<div class="jm-title-tno col-lg-1 jm-grey jm-gr">\${task.tno }</div>
							</li>
							<li class="jm-ajax-InnertaskIn">
								<form class="addInnerTask" id="taskInputNo_\${task.tno}">
									<div class="jm-innerTaskInput jm-hidden">
										<div class="jm-title-ttitle col-lg-4 jm-grey">
											<input type="text" placeholder="하위업무명을 입력하세요"
												name="ttitle" required="required">
										</div>
										<div class="jm-title-tstatus col-lg-1 jm-grey">
											<span> <select
												class="form-select mb-3 selectCategory ml-2 "
												name="tstatus">
													<option value="요청" class="status request"
														selected="selected">요청</option>
													<option value="진행" class="status progress">진행</option>
													<option value="피드백" class="status feedback">피드백</option>
													<option value="완료" class="status complete">완료</option>
													<option value="보류" class="status remain">보류</option>
											</select>
											</span>
										</div>
										<div class="jm-title-tmember col-lg-1 jm-grey">
											<span>
												<select name="tmember" id="tmember_select_pno_\${project.pno }"><!-- TMEMBERLIST ttttt -->
												
												</select>
											</span>
										</div>
										<div class="dropdown jm-title-tstartdate col-lg-1 jm-grey">
											<div data-bs-toggle="dropdown">
												<button class="btn btn-secondary">시작일</button>
											</div>
											<div class="mini-pop dropdown-menu dropdown-menu-end">
												<input type="date" name="tstartdate">
											</div>
										</div>
										<div
											class="dropdown jm-title-tenddate col-lg-1 jm-grey">
											<div data-bs-toggle="dropdown">
												<button class="btn btn-secondary">마감일</button>
											</div>
											<div class="mini-pop dropdown-menu dropdown-menu-end">
												<input type="date" name="tenddate">
											</div>
										</div>
										<div class="jm-title-tdate col-lg-1 jm-grey jm-gr">
											<div class="innerTdate"></div>
										</div>
										<div class="jm-title-tno col-lg-1 jm-grey jm-gr">
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
	}
	</script>
</body>

</html>