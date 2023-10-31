<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/chat.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>
</head>
<body style="margin: 0px">
	<div class="container" style="margin :0px; height: 630px">
		<div class="col-6">
			<div class="col-7"><b>stream[${room.roomName}]</b> 
				<a class="back" href="${pageContext.request.contextPath}/member/rooms">채팅리스트</a>
			</div>
		</div>
		<div class='chatscroll'>
			<div id="msgArea" class="col-6">

				<c:forEach items="${viewChat}" var="item">
					<c:choose>
						<c:when test="${item.mname eq name.mname}">
							<div class='alert alert-secondary'>
								<div class='chatbox1'>
									<div class=namebox1>${item.mname} </div>
									<div class=msgbox1>${item.message}</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class='alert-warning'>
								<div class='chatbox2'>
									<p>${item.mname} </p>
									<div class=msgbox2>${item.message}</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<div class="input-group mb-3">
			<div class="input-group-append">
				<textarea id="msg" class="form-control" maxlength="100" placeholder="메세지를 입력하세요."></textarea>
					<button class="btn btn-outline-secondary" id="button-send">전송</button>					
				</div>
			</div>
	</div>

	<script>
		$(document).ready(function() {

			var mainId = "${room.userId}";
			var roomId = "${room.roomId}";
			var username = "${principal.username}";  
			var roomname = "${room.roomName}"; 			
			var user = "${name.mname}";
			
			console.log(mainId + ", " + roomId + ", " + username+", "+roomname+",");		
			var sockJs = new SockJS("${pageContext.request.contextPath }/stomp/chat");
			var stomp = Stomp.over(sockJs);

			stomp.connect({}, function() {
				console.log("STOMP Connection");

				stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
					var content = JSON.parse(chat.body);
					var name = content.mname; 		
					var userId = content.userId;
					var message = content.message;
					var str = '';
					if (username === userId) {
						str = "<div class='alert alert-secondary'>";
						str += "<div class='chatbox1'>";
						str += "<div class=namebox1>"+ name + "</div>";
						str += "<div class=msgbox1>" + message + "</div>"
						str += "</div>";
						str += "</div>";
						$("#msgArea").append(str);
					} else {
						str += "<div class='alert alert-warning'>";
						str += "<div class='chatbox2'>";
						str += "<p>"+ name + "</p>";
						str += "<div class=msgbox2>" + message + "</div>"
						str += "</div>";
						str += "</div>";
						$("#msgArea").append(str);
					}
				});
				
				$("#button-send").on("click", function(e) {
					var msg = document.getElementById("msg");				
					stomp.send('/pub/chat/message', {}, JSON.stringify({
						roomId : roomId,
						message : msg.value,
						userId : username,
						mname : name
					}));
					msg.value = '';
				});
				
				stomp.send('/pub/chat/enter', {}, JSON.stringify({
					roomId : roomId,
					userId : username,
					mname : name
				}));
			});
		});
	</script>
</body>
</html>
