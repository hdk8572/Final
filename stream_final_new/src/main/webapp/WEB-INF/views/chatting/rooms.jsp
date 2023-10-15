<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<title>Stream - chatroom</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link rel="canonical" href="https://demo-basic.adminkit.io/" />
<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- ProjectList CSS -->
<link href="${pageContext.request.contextPath}/css/chatlist.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/projectList.css"
	rel="stylesheet">
<!-- Modal CSS -->
<link href="${pageContext.request.contextPath}/css/Modalchat.css"
	rel="stylesheet">
<!-- DropDown - Option CSS -->
<link
	href="${pageContext.request.contextPath}/css/projectList.option.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<article style="float: left;">
			<div id="s_sub_menu_box">
				<div id="s_sub_menu">
					<button id="s_emp_list" class="btn btn-primary s_chat_menu">채팅
						리스트</button>
					<button id="s_chat_list" class="btn btn-light s_chat_menu">새
						채팅</button>
				</div>
				<!-- 채팅방리스트 -->
				<div id="s_menu_box1" class="s_menu_box s_scroll">
					<div class="container">
						<div>
							<ul style="list-style: none;padding: 0">
								<c:forEach var="room" items="${list}">
									<div class="room-link">

										<li class="roomlist"
											style="display: flex; align-items: center;"><img
											src="${pageContext.request.contextPath}/img/avatars/user1.jpg"
											class="avatar img-fluid rounded me-1" alt="Charles Hall"
											style="border-radius: 50% !important;" /> <a
											class="roomnamelist"
											href="<c:url value='/room'><c:param name='roomId' value='${room.roomId}' /></c:url>"
											style="display: inline-block;padding:15px ;width: 320px; overflow: hidden; white-space: nowrap; text-decoration: none;">${room.roomName}</a>
										</li>
									</div>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div id="s_menu_box2" class="s_menu_box s_scroll">
					<form action="/stream/room" method="post">
					<div class="modal-body">
						<div>
							<div class="s_select_part_tt">방 제목</div>
								<input type="text" name="roomName" class="form-control" placeholder="방 제목을 입력하세요" maxlength="10">
						</div>
						<div>
							<!-- 친구 리스트에서 체크하는 사람 이름 추가될 div박스 -->
							<div class="s_select_part_tt">
								대화상대 선택<span id="s_select_part_cnt"></span>
							</div>
						</div>
						<div class="s_modal_menu_box s_scroll">
							<div style="list-style: none">
								<c:forEach var="viewMemmber" items="${viewMemmber}">
									<li style="border-bottom: solid 2px gray; padding:  0 0 5px">
									<input type="checkbox" class="check_btn" name="member" value="${viewMemmber.userId}" style="margin: 10px" >									
										<label for="check_btn_${viewMember.userId}"><span>${viewMemmber.userId}</span></label>
									</li>
								</c:forEach>
							</div>
						</div>
					</div>
					<button class="btn btn-secondary" style="margin: 20px 0 0 0; position: relative; left: 140px;background-color: #009b77">개설하기</button>
					</form>
				</div>
			</div>
		</article>
	</section>	
	<script>
     
        $(document).ready(function(){
            var roomName1 = "${roomName1}";
            var member = "${member}";
            
            $(".btn-create").on("click", function (e){
                e.preventDefault();
					
                var roomName = $("input[roomName='roomName']").val();
               
                var member = $("input[member='member']").val(); 
				
                
            });
            console.log(member+"member확인");	
        });
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
</body>
</html>