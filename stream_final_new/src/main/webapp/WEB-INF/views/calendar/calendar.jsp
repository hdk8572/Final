<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
let logined_userid="${principal.username}"; /* 로그인! */
</script>
<script>
let calendar_pno="${pno}"; /* 프로젝트 번호! */
</script>

							<div class="card-header">
								<!-- 캘린더  -->
								<div id="croot">
									<div class="ccard-body px-4">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
<%@ include file="/WEB-INF/views/calendar/addcalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/updatecalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/readcalmodal.jsp" %>
<!-- 달력을 구성  -->
<%@ include file="/WEB-INF/views/calendar/calendarhandler.jsp" %>
