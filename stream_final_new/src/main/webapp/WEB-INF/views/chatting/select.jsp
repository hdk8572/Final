<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
	<!-- Bootstrap CSS -->
	<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
	<!-- ProjectList CSS -->
	<link href="${pageContext.request.contextPath}/css/chatlist.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/projectList.css" rel="stylesheet">
	<!-- Modal CSS -->
	<link href="${pageContext.request.contextPath}/css/Modalchat.css" rel="stylesheet">	
	<!-- DropDown - Option CSS -->	
	<link href="${pageContext.request.contextPath}/css/projectList.option.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<section>
        <article style="float: left;">
            <div id="s_sub_menu_box">
				<div id="s_sub_menu">
	                <button id="s_emp_list" class="btn btn-primary s_chat_menu">채팅 리스트</button>
	                <button id="s_chat_list" class="btn btn-light s_chat_menu" >새 채팅</button>
                </div>
			<!-- 채팅방리스트 -->
                <div id="s_menu_box1" class="s_menu_box s_scroll">
					<div class="s_emp_box">
						방제목
					</div>
					<div class="s_emp_box">
						방제목1
					</div>
                </div>

				<div id="s_menu_box2" class="s_menu_box s_scroll">
					<div class="modal-body">
						<div>
							<div class="s_select_part_tt">방 제목</div>
							<input type="text" class="form-control"
								style="margin-bottom: 30px;" id="s_room_title" name="room_title"
								placeholder="방 제목을 입력해주세요." required>
						</div>
						<div>
							<!-- 친구 리스트에서 체크하는 사람 이름 추가될 div박스 -->
							<div class="s_select_part_tt">
								대화상대 선택<span id="s_select_part_cnt"></span>
							</div>
							<div id="s_select_part" class="s_scroll">
								<div style="margin-top: 17px;" id="s_invite_list">초대할 친구를
									선택해주세요.</div>
							</div>
						</div>
						<div class="s_modal_menu_box s_scroll">
							<div id="s_f_list">친구 리스트</div>
							<!-- 로그인한 사람 제외한 사원 리스트만큼 반복문 실행 -->
							<c:forEach items="${selectEmpList }" var="i">
								<div class="s_emp_box">
									<!-- 사원의 프로필 사진 -->
									<img class="s_img_style" src="${i.emp_file_path }">
									<!-- 사원의 부서명, 이름 -->
									<div class="s_dn_en">${i.dept_name }- ${i.emp_name }</div>
									<div class="form-check">
										<!-- 체크박스 이름은 사원의 이름으로 넣어줌 -->
										<input class="form-check-input" name="${i.emp_name }"
											type="checkbox">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
	        		<button type="button" class="primary">방만들기</button>
				</div>
			</div>
        </article>  
    </section>

</body>
	

<script>

	$("#s_chat_list").click(function() {
		$("#s_menu_box2").css('display', 'block');
		$("#s_menu_box1").css('display', 'none');
		$("#s_chat_list").attr('class', 'btn btn-primary');
		$("#s_emp_list").attr('class', 'btn btn-light');
		$("#s_chat_list").css('border', '1px solid #0d6efd');
		$("#s_emp_list").css('border', '1px solid');
	});
	
	// 채팅 리스트에 있는 대화방 리스트 클릭했을 때
	$(".s_chat_box").click(function() {
		$(".s_chat_box").css('color', 'black');
		$(this).css('color', 'rgb(13, 110, 253)');
	});
	
	// 사원목록 클릭했을 때
	$("#s_emp_list").click(function() {
		$("#s_menu_box1").css('display', 'block');
		$("#s_menu_box2").css('display', 'none');
		$("#s_emp_list").attr('class', 'btn btn-primary');
		$("#s_chat_list").attr('class', 'btn btn-light');
		$("#s_emp_list").css('border', '1px solid #0d6efd');
		$("#s_chat_list").css('border', '1px solid');
	});

	$(".s_chat_box").click(function() {
		// hidden으로 넣어준 방 번호 value roomNo 변수에 담아주어 전달
		var roomNo = $(this).children().val();
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/echo/selectroom?room_no=" + roomNo);
	});
</script>
</html>