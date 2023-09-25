<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.sentences .sentence {
	display: none;
}

.section {
	display: none;
}
</style>
</head>
<body>
<div>
<p>
이건 jsp파일 내부에서 꺼내는 법
${principal.username}

</p>
</div>
<div>
<p>
이건 controller로 꺼내는 법
welcome, ${username}
</p>
</div>

</body>
</html>