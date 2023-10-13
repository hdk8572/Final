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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
.alert-secondary{
	color: green;
}
.alert-warning{
	color: pink;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="col-6">
			<h1>${room.roomName}</h1>
		</div>
		<div>
			<div id="msgArea" class="col-6" >
						<c:forEach items="${viewChat}" var="item">
							<div class='alert alert-secondary'>
								<b> ${item.mName}: ${item.message} </b>
							</div>
						</c:forEach>
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

			var mainId = "${room.userId}"; //방만든사람 
			var roomId = "${room.roomId}";
			var username = "${principal.username}";  //현재 로그인 사용자
			var roomname = "${room.roomName}"; 			
			var user = "${name.mName}";
			
			console.log(mainId + ", " + roomId + ", " + username+", "+roomname+",");		
			var sockJs = new SockJS("/stream/stomp/chat");
			var stomp = Stomp.over(sockJs);

			stomp.connect({}, function() {
				console.log("STOMP Connection");

				stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
					var content = JSON.parse(chat.body);
					var userId = content.userId; //name 출력하는 곳
					var message = content.message;
					var str = '';
					
					if (username === userId) {
						str = "<div class='alert alert-secondary'>";
						str += "<b>" + userId + " : " + message + "</b>";
						str += "</div>";
						$("#msgArea").append(str);
					} else {
						str += "<div class='alert alert-warning'>";
						str += "<b>" + userId + " : " + message + "</b>";
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
				
				stomp.send('/pub/chat/enter', {}, JSON.stringify({
					roomId : roomId,
					userId : username
				}));
			});
		});
	</script>
</body>
</html>
