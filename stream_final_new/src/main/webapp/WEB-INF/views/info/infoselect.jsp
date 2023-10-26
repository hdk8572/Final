<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/info.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
			<div class="row" >
			<div>
				<div class="col-lg-12">
					<h1 class="page-header">글읽기</h1>
				</div>
				<hr>
				<input type="hidden" id="y_emp_dCode" value="">
			</div>
			<div style="margin-left: 70px;">
			<form action="/stream/info"  method="get">
    <button type="submit" class="btn btn-secondary" id="y_btn_back" style="margin: 30px 0px 10px;">목록</button>
			</form>
			<input type="hidden" name="ino" value="${info.userId}">
			<input id="y_hid_title" name="y_hid_title" type="hidden"
				value="${readBoard.board_title }"> <input id="y_hid_content"
				name="y_hid_content" type="hidden"
				value="${readBoard.board_content }">
			<form action="/stream/info/update" method="get">
				<div >
					<table class="col-lg-11" >
						<tr class="y_read_tr">
							<td class="y_read" style="background: #ededed; width: 100px;">No</td>
							<td class="y_read" id="ino">${info.ino}</td>
							<td class="y_read" style="background: #ededed; width: 100px;">작성자</td>
							<td class="y_read" id="iwriter">${info.iwriter}</td>

						</tr>
						<tr class="y_insert_tr">
							<td class="y_read" style="background: #ededed; width: 100px;">제목</td>
							<td class="y_read" id="ititle">${info.ititle}</td>
							<td class="y_read" style="background: #ededed; width: 100px;">작성일</td>
							<td class="y_read" id="idate">${info.idate}</td>
						</tr>
						<tr class="y_insert_tr">
							<td colspan="4" class="y_read"
								style="background: #ededed; width: 100px; text-align: center;">내용</td>
						</tr>
						<tr class="y_insert_tr">
							<td colspan=4 class="y_read">
								<div id="itext" style="height: 450px">${info.itext}</div>
							</td>
						</tr>
					</table>

					<input type="hidden" name="ino" value="${info.ino}">
					<button type="submit" class="btn btn-primary" id="updateButton" style="margin-top: 10px">수정</button>
			</form>
			</div>
			</div>
			</main>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	
	<script>

	document.getElementById('updateButton').addEventListener('click', function (event) {
        var infoUserId = '${info.userId}';
        var currentUserId = '${principal.username}';
        
        if (infoUserId !== currentUserId) {
            event.preventDefault(); 
            alert('작성자만 수정할 수 있습니다.');
        }
    });

	</script>
</body>
</html>