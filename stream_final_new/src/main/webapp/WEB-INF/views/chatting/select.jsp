<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>채팅</title> -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>Stream - Final Project</title>
	
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
	<!-- Tab bar -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<section>
        <article style="float: left;">
            <div id="s_sub_menu_box">
				
				<!-- 서브 메뉴 -->
				<div id="s_sub_menu">
	                <button id="s_emp_list" class="btn btn-primary s_chat_menu">채팅 리스트</button>
	                <button id="s_chat_list" class="btn btn-light s_chat_menu" >새 채팅</button>
                </div>
                <!-- 사원 목록 클릭 시 띄울 내용 -->
                <div id="s_menu_box1" class="s_menu_box s_scroll">
					<div class="s_emp_box">
						방제목
					</div>
					<div class="s_emp_box">
						방제목1
					</div>
                </div>
                <!-- 채팅 리스트 클릭 시 띄울 내용 -->
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
    
    
    <!-- 방 만들기 Modal -->
	<div class="modal fade" id="roomModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="height: 1200px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">방 만들기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
      			<div>
      				<div class="s_select_part_tt">방 제목</div>
      				<input type="text" class="form-control" style="margin-bottom: 30px;" id="s_room_title" name="room_title" placeholder="방 제목을 입력해주세요." required>
      			</div>
        		<div>
        			<!-- 친구 리스트에서 체크하는 사람 이름 추가될 div박스 -->
        			<div class="s_select_part_tt">대화상대 선택<span id="s_select_part_cnt"></span></div>
	        		<div id="s_select_part" class="s_scroll">
	        			<div style="margin-top: 17px;" id="s_invite_list">초대할 친구를 선택해주세요.</div>
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
	                	<div class="s_dn_en">${i.dept_name } - ${i.emp_name }</div>
	                	<div class="form-check">
	                	  <!-- 체크박스 이름은 사원의 이름으로 넣어줌 -->
						  <input class="form-check-input" name="${i.emp_name }" type="checkbox">
						</div>
	                </div>
                </c:forEach>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="s_create_room">방만들기</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>
	
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
	// 체크박스 선택됐을 때 대화상대선택 박스에 넣기
	
	// 체크박스가 변했을 때마다 함수 실행
	$("input[type='checkbox']").change(function() {
		var name = $(this).parent().siblings().text(); // ex) 영업팀 - 차두리
		name = name.split(' - '); // ' - ' 구분자를 기준으로 잘라 배열 형식으로 가져옴  ex) name[0] 영업팀 name[1] 차두리
		// 위에서 체크박스 name을 사원의 이름으로 넣어주어 해당 checkbox의 name이 name[1]인 것이 체크되어 있다면
		if($("input:checkbox[name=" + name[1] + "]").is(':checked')) { // 체크박스 체크되어 있을 경우
			// 초대할 친구를 선택해주세요. 문구는 보이지 않도록 설정
			$("#s_invite_list").css('display', 'none');
			// 대화상대 선택박스에 div박스에 해당 사원 이름과 닫기버튼 추가
			// 이 때 닫기버튼에 remove(this) 함수를 넣어주어 닫기버튼 클릭 시 remove함수 실행하여 해당 div박스 제거
			$("#s_select_part").append('<div class="s_invite_p" >' + name[1] + '<button type="button" class="btn-close" onclick="remove(this)" aria-label="Close"></button></div>')
			// 대화상대선택 옆 띄울 숫자 변경
			cplength();
		} else { // 체크박스 해제 시
			// 체크박스 선택 시 대화상대 선택박스에 추가된 div의 class만큼 반복문 실행
			for(var i = 0; i < $(".s_invite_p").length; i++){
				// 해당 div박스의 text가 체크박스에서 선택한 name[1]과 같으면
				if($(".s_invite_p").eq(i).text() == name[1]) {
					// 해당 div박스 삭제
					$(".s_invite_p").eq(i).remove();
					// 반복문 탈출
					break;
				}
			}
			// 대화상대선택 옆 띄울 숫자 변경
			cplength();
		}
		// 대화상태 선택이 많아져서 스크롤바 생겼을 시 추가될 때마다 스크롤 제일 하단으로 내리기
		var offset = $("#s_select_part").children().last().offset();
		$("#s_select_part").animate({scrollTop : 90000},0);
	})
	
	// 대화상대선택 옆 띄울 숫자
	function cplength() {
		// 대화상대선택에 아무도 선택되지 않았다면
		if($(".s_invite_p").length == 0) {
			// 대화상대 선택 숫자 안띄움
			$("#s_select_part_cnt").text("");
		} else { // 있다면
			// 선택된 div개수 만큼 띄움
			$("#s_select_part_cnt").text($(".s_invite_p").length);
		}
	}
	
	// 대화상대 X 버튼 눌렀을 때 제거
	function remove(e) {
		// 버튼의 부모인 div의 text로 이름을 name의 변수에 담아줌
		var name = $(e).parent("div").text();
		// 그 name을 가진 checkbox의 name이 체크되어 있으면 해제해줌
		$("input:checkbox[name=" + name + "]").prop("checked", false);
		// div박스 삭제
		$(e).parent().remove();
		// 대화상대선택 옆 띄울 숫자 변경
		cplength();
	}
	
	// 방만들기 버튼 클릭 시 대화상대 선택에 있는 사람들 DB에 저장
	$("#s_create_room").click(function() {
		
		// 배열 arr 선언
		var arr = [];
		// 대화상대 선택에 있는 개수만큼 반복문 실행
		for(var i = 0; i < $(".s_invite_p").length; i++) {
			// 대화상대 선택에 있는 div하나씩 돌며 배열에 push해줌
			arr.push($(".s_invite_p").eq(i).text());
		}
		
		// 본인도 채팅참여자에 추가하여 배열에 push해줌
		arr.push("${selectOne.emp_name}");
		
		// ajax에 전달할 obj
		var obj = {
					"emp_name" : arr,
					"room_title" : $("#s_room_title").val()
				};
		
		// 대화상대 선택 안했을 시
		if($(".s_invite_p").length == 0) {
			swal({
                title: "대화상대가 선택되지 않았습니다.",
                text: "대화할 사원을 선택해주세요!",
                icon: "error",
                closeOnClickOutside: false,
                closeOnEsc: false
            });
			return;
		}
			
	});
</script>

<!-- 서브메뉴 눌렀을 때 -->
<script>
	// 채팅 리스트 클릭했을 때
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
</script>

<!-- 채팅 리스트에서 방 눌렀을 때 -->
<script>
	$(".s_chat_box").click(function() {
		// hidden으로 넣어준 방 번호 value roomNo 변수에 담아주어 전달
		var roomNo = $(this).children().val();
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/echo/selectroom?room_no=" + roomNo);
	});
</script>
</html>