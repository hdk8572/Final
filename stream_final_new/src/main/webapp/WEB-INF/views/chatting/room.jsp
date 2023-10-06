<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="col-6">
			<h1>${room.roomName}</h1>
		</div>
		<div>
			<div class="col-6" id="msgArea">
				<c:if test="${!empty viewChat}">
					<c:forEach items="${viewChat}" var="item">
						<div class='alert alert-secondary'>
							<b> ${item.mName}: ${item.message} </b>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="input-group mb-3">
				<input type="text" id="msg" class="form-control">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" id="button-send">전송</button>
				</div>
			</div>
		</div>
		<div class="col-6"></div>
	</div>
	<script>
		$(document).ready(function() {

			var userId = "${room.userId}";
			var roomId = "${room.roomId}";
			var username = "${room.userId}"; 
			var name = "${room.mName}";
			
			console.log(userId + ", " + roomId + ", " + username);			
			var sockJs = new SockJS("/stream/stomp/chat");
			var stomp = Stomp.over(sockJs);

			stomp.connect({}, function() {
				console.log("STOMP Connection");

				stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
					var content = JSON.parse(chat.body);
					var userId = content.userId;
					var message = content.message;
					var str = '';
					if (userId === username) {
						str = "<div class='alert alert-secondary'>";
						str += "<b>" + name + " : " + message + "</b>";
						str += "</div>";
						$("#msgArea").append(str);
					} else {
						str += "<div class='alert alert-warning'>";
						str += "<b>" + name + " : " + message + "</b>";
						str += "</div>";
						$("#msgArea").append(str);
					}
				});

				$("#button-send").on("click", function(e) {
					var msg = document.getElementById("msg");

					
					stomp.send('/pub/chat/message', {}, JSON.stringify({
						roomId : roomId,
						message : msg.value,
						userId : username
					}));
					msg.value = '';
				});
				
				$("#msg").on("keyup", function(e){
					if(event.keyCode === 13){
						console.log(username + ":" + msg.value);
						stomp.send('/pub/chat/message', {}, JSON.stringify({
							roomId : roomId,
							message : msg.value,
							userId : username
						}));
						msg.value = '';
					}
				});

				

				

				stomp.send('/pub/chat/enter', {}, JSON.stringify({
					roomId : roomId,
					userId : username
				}));
			});
		});
	</script>
</body>
</html>