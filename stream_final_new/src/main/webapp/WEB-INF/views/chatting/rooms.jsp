<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="container">
        <div>
            <ul>
                <c:forEach var="room" items="${list}">
    				<li><a href="<c:url value='/room'><c:param name='roomId' value='${room.roomId}'/></c:url>">${room.roomName}</a></li>
				</c:forEach>
            </ul>
        </div>
    </div>
    <form action="/stream/room" method="post">
        <input type="text" name="roomName" class="form-control" placeholder="Room Name">
        <input type="text" name="writer" class="form-control" placeholder="Writer Name">
        <button class="btn btn-secondary">개설하기</button>
    </form>
     <script>
        $(document).ready(function(){
            var roomName1 = "${roomName1}";

            if(roomName1 != null)
                alert(roomName1 + "방이 개설되었습니다.");

            $(".btn-create").on("click", function (e){
                e.preventDefault();

                var roomName = $("input[roomName='roomName']").val();
                var writer = $("input[roomName='writer']").val(); 

                if(name == "" || writer == "") 
                    alert("Please write both the room name and writer name.");
                else
                    $("form").submit();
            });
        });
    </script>
</body>
</html>