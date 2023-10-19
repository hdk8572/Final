<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" /> <!-- 로고 결정 요망 -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - Final Project</title>

<link href="${pageContext.request.contextPath }/css/streamapp.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/maintask.css" rel="stylesheet">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>관리자페이지</title>
</head>
<body>
	<div class="wrapper">
		<div class="main">
			<main class="content">
				<h1>hello admin!</h1>
				<c:choose>
					<c:when test="${CNT != null }">
				<div>
					<span>지금까지 stream 그룹웨어를 </span>
					<span>${CNT.ccnt }</span>
					<span> 개 회사에서 이용 하고 있으며</span>
				</div>
				<div>
					<span>stream을 이용하여 진행된 프로젝트는 총 </span>
					<span>${CNT.pcnt }</span>
					<span> 개이고</span>
				</div>
				<div>
					<span>진행된 업무 개수는 모두 </span>
					<span>${CNT.tcnt }</span>
					<span> 개 입니다.</span>
				</div>
					</c:when>
				</c:choose>
				
			</main>
		</div>
	</div>
</body>
</html>