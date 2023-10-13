<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Emailsend Css -->
<link href="${pageContext.request.contextPath}/css/attend.css"
	rel="stylesheet">
<!-- Modal Css -->
<link href="${pageContext.request.contextPath}/css/Modal.css"
	rel="stylesheet">
<!-- DropDown Css -->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="${pageContext.request.contextPath}/css/projectList.option.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
				<div class="attendBox">

					<div class="attendTitle">
						<p>근태관리</p>
					</div>
					<div class="attendBtn">
						<button type="button" id="inbtn">출근</button>
						<button type="button" id="outbtn">퇴근</button>
						<button type="button" id="earlybtn">조퇴</button>
						<input type="hidden" id="username" name="userid" value="${principal.username }">
					</div>
					<table>
						<thead>
							<th>날짜</th>
							<th>출근시간</th>
							<th>퇴근시간</th>
							<th>근무시간</th>
							<th>상태</th>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>

</body>
<!-------------------- Script ----------------------->
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script>
	
	    // 출근버튼 (inbtn)
	    $("#inbtn").click(inbtnClickHandler);
	    
	    function inbtnClickHandler(){
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/member/attendin",
	    		type: "post",
	    		data: {
	    			userid: $("[name=userid]").val()
	    		},
	    		dataType: "json",
	    		success: console.log("success")
	    		/* error: (request, status, error) => {
	    			alert("code: " + request.status + "\n" + "message: "
	    					+ request.responseText + "\n" + "error: " + error);
	    		} */
	    	})
	    }
	

</script>
</html>