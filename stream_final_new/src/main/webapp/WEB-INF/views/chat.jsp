<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
<style>
boby{
	margin: 0;
	padding: 0;
}
.col-6{
	background-color: #009b77;
} 
.col-61{
	position: relative;
	height: 50px;
	padding: 0 0px 5px 20px;
	height: 30px;
}
.chatheader{
	background-color: #009b77;
	height: 60px;
	font-size: 24px;
	line-height: 60px;
}
#msg,#button-send{
	float: left;
}
#msg{
	margin: 10px 0 10px 10px;
	width: 85%;
	height: 60px;
	border-radius: 8px;
}
#button-send{
	margin: 10px 0;
	height: 65px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js">
/* function jstalktheme_testfunc()
{
	var otxtmsg = document.getElementById("jstalktheme_testmsg");
	
	var d = new Date();
	var ampm = (d.getHours()>12 ?  "PM" : "AM");
	var h = (d.getHours()>12 ? d.getHours()-12 : d.getHours());
	var m = d.getMinutes();

	test_type ^= 0x01;
	jstalktheme_addmsg(test_type, "아무개", ampm+" "+h+":"+m, otxtmsg.value.replace("\n","<br />\n"));
} */

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin: 0; min-height: 100% ;background-color:rgb(221, 231, 245, 0.2) ">

	<div class="container">
		<div class="chatheader">
			<label><span style="color: white; margin: 20px">채팅방</span></label>
		</div>
		<div  class="scroller" style="overflow: scroll; height: 650px ;overflow-x: hidden">
			<div>
				<div id="msgArea" class="col"></div>
				<div class="col-6"></div>
			</div>
		</div>
	</div>
	<footer>
		<div class="input-group mb-3" >
			<input type="text" id="msg" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2" >
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button"
					id="button-send">전송</button>
			</div>
		</div>
	</footer>

	<script >
            $(document).ready(function(){

            const username = "김민성";

            $("#disconn").on("click", (e) => {
                disconnect();
            })
            
            $("#button-send").on("click", (e) => {
                send();
            });

            const websocket = new WebSocket("ws://localhost:8090/stream/ws/chat");

            websocket.onmessage = onMessage;
            websocket.onopen = onOpen;
            websocket.onclose = onClose;

            function send(){

                let msg = document.getElementById("msg");

                console.log(username + ":" + msg.value);
                websocket.send(username + ":" + msg.value);
                msg.value = '';
            }
            
            //채팅창에서 나갔을 때
            function onClose(evt) {
                var str = username + ": 님이 방을 나가셨습니다.";
                websocket.send(str);
            }
            
            //채팅창에 들어왔을 때
            function onOpen(evt) {
                var str = username + ": 님이 입장하셨습니다.";
                websocket.send(str);
            }

            function onMessage(msg) {
                var data = msg.data;
                var sessionId = null;
                //데이터를 보낸 사람
                var message = null;
                var arr = data.split(":");

                for(var i=0; i<arr.length; i++){
                    console.log('arr[' + i + ']: ' + arr[i]);
                }

                var cur_session = username;

                //현재 세션에 로그인 한 사람
                console.log("cur_session : " + cur_session);
                sessionId = arr[0];
                message = arr[1];

                console.log("sessionID : " + sessionId);
                console.log("cur_session : " + cur_session);

                //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
                if(sessionId == cur_session){
                    var str = "<div class='col-61'>";
                    str += "<div class='alert alert-secondary'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
                else{
                    var str = "<div class='col-61'>";
                    str += "<div class='alert alert-warning'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
            }
            })
           
</script>
</body>
</html>