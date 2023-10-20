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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin: 0px">
	<div class="container" style="margin :0px; height: 630px">
		<div class='chatscroll'>
			<div id="msgArea" class="col-6">

			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			var mainId = "${room.userId}"; //방만든사람 
			var roomId = "${room.roomId}";
			var username = "${principal.username}";  //현재 로그인 사용자
			var roomname = "${room.roomName}"; 			
			var user = "${name.mname}";
			
			console.log(mainId + ", " + roomId + ", " + username+", "+roomname+",");		
			var sockJs = new SockJS("/stream/stomp/arm");
			var stomp = Stomp.over(sockJs);

			stomp.connect({}, function() {
				console.log("STOMP Connection");

				stomp.subscribe("/sub/arm/" + roomId, function(chat) {
					var content = JSON.parse(chat.body);
					var name = content.mname; //stomp에서 보내는 mname 
					var userId = content.userId;//현재 채팅방에서 치는사람 id
					var message = content.message;
					var name = content.name;
					var str = '';
					if (username === userId) {
						str = "<div class='alert alert-secondary'>";
						str += "<div class='chatbox1'>";
						str += "<div class=msgbox1>" + message + "</div>";
						str += "<div>" + name +"</div>";
						str += "</div>";
						$("#msgArea").append(str);
					}
				});
				
				$("#button-send").on("click", function(e) {
					var msg = document.getElementById("msg");				
					stomp.send('/pub/arm/message', {}, JSON.stringify({
						roomId : roomId,
						message : msg.value,
						userId : username,
					}));
					msg.value = '';
				});
				
			});
		});
	</script>
</body>
</html>