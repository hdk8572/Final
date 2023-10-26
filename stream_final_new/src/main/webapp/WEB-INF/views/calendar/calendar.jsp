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

<!-- 지도 script 이건 맨 위에 있어야 한다.-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=200d239f8c4b9f3e0d914ec332ddfe21&libraries=services"></script>

<!-- 달력을 구성  -->
<%@ include file="/WEB-INF/views/calendar/calendarhandler.jsp" %>

<%@ include file="/WEB-INF/views/calendar/addcalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/readcalmodal.jsp" %>
<%@ include file="/WEB-INF/views/calendar/updatecalmodal.jsp" %>


<!-- summerNote	 -->
<script>
	$(document).ready(function (){
		
		//addcalmodal
		$("#summernote-addcalmodal").summernote({					
		     placeholder: '내용을 작성해주세요. -200글자 제한',
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
		
		//updatecalmodal 
		$("#summernote-updatecalmodal").summernote({					
			 placeholder: '내용을 작성해주세요.',
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
		
	});
</script>