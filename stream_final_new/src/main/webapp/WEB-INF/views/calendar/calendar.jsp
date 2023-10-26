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




<!-- 제목 유효성 검사  -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    var addTitle = document.getElementById("title");

    function validateTitle() {
        var titleValue = addTitle.value;

        if (!titleValue) {
            alert("제목을 입력해주세요.");
        } else if (titleValue.length > 20) {
            alert("제목은 20자 이내여야 합니다.");
        }
    }

    addTitle.addEventListener("input", validateTitle);

    document.getElementById("addcalmodal").addEventListener("submit", function(event) {
        validateTitle(); // 폼 제출 시 다시 한 번 검사
        if (addTitle.value === "") {
            event.preventDefault(); // 제목이 비어있을 때 폼 제출 방지
        }
    });
});
</script>

<!-- 내용 유효성검사  -->
<script>
	$('#summernote-addcalmodal').on('summernote.keyup', function() {
		
		var max = 200;
		
		var length = $(this).summernote('code').replace(/<(?:.|\n)*?>/gm, '').length;
		if(length > max) {
			alert('최대 글자수를 초과하였습니다.')
			
			$(this).summernote('editor.undo');
		}
	});
</script>
	
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