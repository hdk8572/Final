<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<c:forEach items="${principal.authorities}" var="authority">
			<c:if test="${authority.authority eq 'ROLE_M'}">
				<span class="align-brand-middle"><a
					href="${pageContext.request.contextPath}/member/projectlist"
					class="sidebar-brand-new">Stream</a></span>
			</c:if>
			<c:if test="${authority.authority eq 'ROLE_C'}">
				<span class="align-brand-middle"><a
					href="${pageContext.request.contextPath}/company/main"
					class="sidebar-brand-new">Stream</a></span>
			</c:if>
			<c:if test="${authority.authority eq 'ROLE_A'}">
				<span class="align-brand-middle"><a
					href="${pageContext.request.contextPath}/admin/main"
					class="sidebar-brand-new">Stream</a></span>
			</c:if>
		</c:forEach>

		<ul class="sidebar-nav">
			<c:forEach items="${principal.authorities}" var="authority">
				<c:if test="${authority.authority eq 'ROLE_M'}">
					<li class="sidebar-item active"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/member/projectlist">
							<!-- <i
							class="align-middle" data-feather="sliders"></i>  --> <i
							class="align-middle" data-feather="grid"></i> <span
							class="align-middle">내 프로젝트</span>
					</a></li>


					<li class="sidebar-header">모아보기</li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/info"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-info align-middle me-2">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="12" y1="16" x2="12" y2="12"></line>
						  <line x1="12" y1="8" x2="12.01" y2="8"></line></svg><span
							class="align-middle">공지사항</span> </a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/member/maintask"> <i
							class="align-middle" data-feather="align-left"></i> <span
							class="align-middle">전체업무</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/member/pcal"><i
							class="align-middle me-2" data-feather="calendar"></i><span
							class="align-middle">전체 캘린더</span> </a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/member/attend"><i
							class="align-middle me-2" data-feather="user-check"></i><span
							class="align-middle">근태관리</span> </a></li>
					<li class="sidebar-item"><a class="sidebar-link" id="popup"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-message-square align-middle me-2">
								<path
									d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg><span
							class="align-middle">채팅</span> </a></li>
					<li class="sidebar-item">
					    <div class="parent d-flex justify-content-center align-items-center text-center">
					        <div id="time" class="text-light"></div>
					    </div>
					</li>

				</c:if>
				<c:if test="${authority.authority eq 'ROLE_C' }">
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/company/emailsend"><i
							class="align-middle me-2" data-feather="users"></i> <span
							class="align-middle">사원 초대</span> </a></li>
							<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/info"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-info align-middle me-2">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="12" y1="16" x2="12" y2="12"></line>
						  <line x1="12" y1="8" x2="12.01" y2="8"></line></svg><span
							class="align-middle">공지사항</span> </a></li>
							<li class="sidebar-item">
					    <div class="parent d-flex justify-content-center align-items-center text-center">
					        <div id="time" class="text-light"></div>
					    </div>
					</li>
				</c:if>
				<c:if test="${authority.authority eq 'ROLE_A' }">
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/info"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-info align-middle me-2">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="12" y1="16" x2="12" y2="12"></line>
						  <line x1="12" y1="8" x2="12.01" y2="8"></line></svg><span
							class="align-middle">공지사항</span> </a></li>
							<li class="sidebar-item">
					    <div class="parent d-flex justify-content-center align-items-center text-center">
					        <div id="time" class="text-light"></div>
					    </div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</nav>

<script>
	$(".sidebar-link").mouseover(function() {
		$(this).css({
			"background-color" : "#009b77",
		});
		$(this).find("span").css({
			"color" : "white"
		});
		$(this).find("svg").css({
			"color" : "white"
		});
	}).mouseout(function() {
		$(this).css({
			"background-color" : "white",
		});
		$(this).find("span").css({
			"color" : "#009b77"
		});
		$(this).find("svg").css({
			"color" : "#009b77"
		});
	});
	popupclickHandler=()=>{
		var jsPopup = window
		.open("${pageContext.request.contextPath }/member/rooms",null,"width=450, height=650, resizable=no, scrollbars=no,toolbars=no, menubar=no");

	}
	$("#popup").on("click", popupclickHandler)
	
	/* 관리자, 회사 페이지 오류떄문에 임시 수정 하였습니다. [JM] */
	/* window.onload = function() {
		var popupButton = document.getElementById("popup");
		popupButton.onclick = function() {
			var jsPopup = window
					.open("${pageContext.request.contextPath }/member/rooms",null,"width=450, height=650, resizable=no, scrollbars=no,toolbars=no, menubar=no");

		};
	}; */
</script>
<script>
	const dpTime = function () {
	    const now = new Date();
	    let hours = now.getHours();
	    let minutes = now.getMinutes();
	    let seconds = now.getSeconds();
	    let day = now
	    let ampm = '';
	    if (hours > 12) {
	      hours -= 12;
	      ampm = '오후 '
	    } else {
	      ampm = '오전 '
	    }
	    if (hours < 10) {
	      hours = '0' + hours
	    }
	    if (minutes < 10) {
	      minutes = '0' + minutes
	    }
	    if (seconds < 10) {
	      seconds = '0' + seconds
	    }
	    document.querySelector('#time').innerHTML = ampm + hours + ":" + minutes + ":" + seconds
	  }
	  dpTime();
	  setInterval(dpTime, 1000)  // 1초마다 함수 실행되도록 설정
</script>
