<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
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
    <%-- ${principal.username} --%>
    <form action="/stream/room" method="post">
        <input type="text" name="roomName" class="form-control" placeholder="Room Name">
        <!-- <input type="text" name="userId" class="form-control" placeholder="userId Name"> --> 
        
        <div>
    		<c:forEach var="viewMemmber" items="${viewMemmber}">
    		
    				<%-- <li><input type="checkbox" name="member" class="form-control">${viewMemmber.mName}</li> --%>
    				<li><input type="checkbox" name="member" class="form-control">${viewMemmber.userId}</li>
			</c:forEach>
    	</div>       
        <button class="btn btn-secondary">개설하기</button>
    </form>
     <script>
        $(document).ready(function(){
            var roomName1 = "${roomName1}";
            var member = "${member}";
            

            $(".btn-create").on("click", function (e){
                e.preventDefault();

                var roomName = $("input[roomName='roomName']").val();
                var member = $("input[roomName='member']").val(); 

                if(name == "" || userId == "") 
                    alert("Please write both the room name and userId name.");
                else
                    $("form").submit();
            });
        });
    </script>
</body>
</html>