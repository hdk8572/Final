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
<title>Stream - 업무도 흐름이다!</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/chatlist.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/projectList.css"
	rel="stylesheet">


<link
	href="${pageContext.request.contextPath}/css/projectList.option.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
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
			
				<div id="s_menu_box1" class="s_menu_box s_scroll">
					<div class="container">
						<div>
							<ul style="list-style: none;padding: 0">
								<c:forEach var="room" items="${list}">
									<div class="room-link">
										<form action="${pageContext.request.contextPath }/member/rooms/do" method="post">
										<li class="roomlist"
											style="display: flex; align-items: center;">
									<div class="stat text-primary" style="font-size: 0.7em; background-color: #009b77;color: white;">${room.mname}</div>	<a class="roomnamelist" href="<c:url value='${pageContext.request.contextPath }/member/room'><c:param name='roomId' value='${room.roomId}' /></c:url>"
											style="display: inline-block;padding:15px ;width: 320px; overflow: hidden; white-space: nowrap; text-decoration: none;">${room.roomName}</a>
										<input type="hidden" name="Id" value="${room.roomId}">
											<button type="submit" class="delbtn" style="border: 0 ;background-color:#f5f7fb ;" onclick="confirmDelete()">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>
													</button>

											</li>
										</form>
									</div>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div id="s_menu_box2" class="s_menu_box s_scroll">
					<form action="${pageContext.request.contextPath }/member/room" method="post">
					<div class="modal-body">
						<div>
							<div class="s_select_part_tt">방 제목</div>
								<input type="text" name="roomName" class="form-control" placeholder="방 제목을 입력하세요" maxlength="15">
						</div>
						<div>
							
							<div class="s_select_part_tt">
								대화상대 선택<span id="s_select_part_cnt"></span>
							</div>
						</div>
						<div class="s_modal_menu_box s_scroll">
								<div style="list-style: none">
									<c:forEach var="viewMemmber" items="${viewMemmber}">
										<li
											style="border-bottom: solid 1px lightgray; padding: 0 0 5px">
											<input type="checkbox" class="check_btn" name="member"
											value="${viewMemmber.userId}" style="margin: 10px"
											<c:if test="${viewMemmber.userId == principal.username}">
                								checked
           									 </c:if>>
											<label for="check_btn_${viewMember.userId}"><span>${viewMemmber.mname}</span></label>
										</li>
									</c:forEach>
								</div>
							</div>
					</div>
					<button class="btn-create" style="margin: 20px 0 0 0; position: relative; left: 150px;background-color: #009b77; border: solid #009b77;
	border-radius: 6px; padding: 5px;color:white;font-size:0.8em">개설하기</button>
					</form>
				</div>
			</div>
		</article>
	</section>	
	<script>
	$(document).ready(function(){
	    var roomName1 = "${roomName1}";
	    var member = "${member}";
	    var user = "${principal.username}";  
	    $(".btn-create").on("click", function (e){
	        var roomName = $("input[name='roomName']").val();
	        var member = $("input[name='member']:checked").length;
	        if (!roomName) {
	            e.preventDefault();
	            alert("방 제목을 입력하세요.");
	        }else{
	        	if (member === 0) {
		            e.preventDefault();
		            alert("채팅 상대를 선택하세요.");
		        }
	        }
	        
	    });
	    
	});

    	$("#s_chat_list").click(function() {
    		$("#s_menu_box2").css('display', 'block');
    		$("#s_menu_box1").css('display', 'none');
    		$("#s_chat_list").attr('class', 'btn btn-primary');
    		$("#s_emp_list").attr('class', 'btn btn-light');
    	});
    	
    	
    	$(".s_chat_box").click(function() {
    		$(".s_chat_box").css('color', 'black');
    	});
    	
    	
    	$("#s_emp_list").click(function() {
    		$("#s_menu_box1").css('display', 'block');
    		$("#s_menu_box2").css('display', 'none');
    		$("#s_emp_list").attr('class', 'btn btn-primary');
    		$("#s_chat_list").attr('class', 'btn btn-light');
    	});
    	
    	function showAlert(message) {
    	    var alertBox = $("<div>").text(message).addClass("alert-box");
    	    $("body").append(alertBox);

    	    setTimeout(function() {
    	        alertBox.remove();
    	    }, 3000);
    	}
    	function confirmDelete() {
    	    var confirmation = confirm("채팅방을 나가시겠습니까?");
    	    if (confirmation) {

    	        document.querySelector('form').submit();
    	    }else
    	    	 event.preventDefault();
    	}
    </script>
</body>
</html>