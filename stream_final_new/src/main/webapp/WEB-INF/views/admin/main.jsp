<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon"><i class="align-middle me-2" data-feather="users"></i> </link> <!-- 로고 결정 요망 -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - 업무도 흐름이다!</title>

<link href="${pageContext.request.contextPath }/css/streamapp.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/maintask.css" rel="stylesheet">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="main">
			<main class="content">
				<h1>hello admin!</h1>
				<c:forEach items="${CNT }" var="cnt">
				<div>
					<span>지금까지 stream 그룹웨어를 </span>
					<span>${cnt.ccnt }</span>
					<span> 개 회사에서 이용 하고 있으며</span>
				</div>
				<div>
					<span>stream을 이용하여 진행된 프로젝트는 총 </span>
					<span>${cnt.pcnt }</span>
					<span> 개이고</span>
				</div>
				<div>
					<span>진행된 업무 개수는 모두 </span>
					<span>${cnt.tcnt }</span>
					<span> 개 입니다.</span>
				</div>
				</c:forEach>
			</main>
		</div>
	</div>
</body>
</html>