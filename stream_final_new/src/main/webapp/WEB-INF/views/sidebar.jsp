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
		<span class="align-brand-middle"><a
			href="${pageContext.request.contextPath}/projectlist"
			class="sidebar-brand-new">Stream</a></span>

		<ul class="sidebar-nav">
			<c:forEach items="${principal.authorities}" var="authority">
				<c:if test="${authority.authority eq 'ROLE_M'}">
					<li class="sidebar-item active"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/projectlist"> <!-- <i
							class="align-middle" data-feather="sliders"></i>  -->
							  <i class="align-middle" data-feather="grid"></i> <span
							class="align-middle">내 프로젝트</span>
					</a></li>


					<li class="sidebar-header">모아보기</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/maintask"> <i
							class="align-middle" data-feather="square"></i> <span
							class="align-middle">전체업무</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/pcal"><i
							class="align-middle me-2" data-feather="calendar"></i> <span
							class="align-middle">캘린더</span> </a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/#"> <i
							class="align-middle me-2" data-feather="paperclip"></i> <span
							class="align-middle">파일함</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/#"> <i
							class="align-middle" data-feather="align-left"></i> <span
							class="align-middle">내 게시물</span></a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/member/attend"><i
							class="align-middle me-2" data-feather="user-check"></i><span
							class="align-middle">근태관리</span> </a></li>
				</c:if>
				<c:if test="${authority.authority eq 'ROLE_C' }">
					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/company/emailsend"><i
							class="align-middle me-2" data-feather="users"></i> <span
							class="align-middle">직원 초대</span> </a></li>
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
</script>

