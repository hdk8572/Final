<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Stream">

<title>Stream - 업무도 흐름이다!</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!-- Tab bar -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">

<!-- Modal CSS -->
<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/css/calreadmodal.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/calmodal.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath }/css/fullcalendar.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- SummerNote CDN -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">


<script>
let logined_userid="${principal.username}"; /* 로그인! */
</script>
<script>
let calendar_pno="${pno}"; /* 프로젝트 번호! */
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
			<div class="main">
				<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main>
				<main class="content" id="content-calendar">
					<div class="content-cal">
 						<h2>
							Calendar
						</h2>
						<div class="container-fluid p-0">
							<div class="card-header">
								<!-- 캘린더  -->
								<div id="croot">
									<div class="ccard-body px-4">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
						</div>
						<%@ include file="/WEB-INF/views/calendar/readcalmodal.jsp" %>
					 </div>
				</main>
				<%@ include file="/WEB-INF/views/footer.jsp"%>
			</main>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
<!-- 달력을 구성  -->
<%@ include file="/WEB-INF/views/calendar/calendarhandler.jsp" %>
<script>
document.addEventListener('DOMContentLoaded', loadCalendarHandler);
</script>

<!-- /pcal 수정,삭제 dropdown 없앰 -->
<script>
	document.addEventListener("DOMContentLoaded", function(){
		var hideReadSvg = document.querySelector(".feather.feather-more-vertical.me-2");
		
		var ReadSvg = true;
		
		if(ReadSvg){
			hideReadSvg.style.display ="none";
		}
	});
</script>


</body>
</html>