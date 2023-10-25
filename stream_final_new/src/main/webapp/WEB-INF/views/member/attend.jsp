<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Attend Css -->
<%-- <link href="${pageContext.request.contextPath}/css/attend.css"
	rel="stylesheet"> --%>
<!-- Modal Css -->
<link href="${pageContext.request.contextPath}/css/Modal.css"
	rel="stylesheet">
<!-- DropDown Css -->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="${pageContext.request.contextPath}/css/projectList.option.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<style>
.content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.attendBox {
	width: 1000px;
	height: 100vh;
	background-color: white;
	padding: 20px;
}

p {
	font-size: 20px;
	font-weight: 600;
	margin: 10px;
}

.attendTitle {
	text-align: center;
	font-size: 20px;
	margin: 20px;
	font-weight: 600;
}

.attendBtn {
	display: flex;
	align-items: flex-start;
	text-align: center;
	margin-bottom: 20px;
	text-align: center
}

.btn {
	margin-left: 10px;
}

table.attendTable {
	width: 100%;
	border-collapse: collapse;
}

table.attendTable th, table.attendTable td {
	border: 1px solid black;
	text-align: center;
	padding: 5px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
				<div class="attendBox">

					<div class="attendTitle">
						<p>근태관리</p>
					</div>
					<div class="attendBtn">
						<button type="button" class="btn btn-lg btn-primary" id="inbtn">출근</button>
						<button type="button" class="btn btn-lg btn-primary" id="outbtn">퇴근</button>
						<input type="hidden" id="username" name="userid"
							value="${principal.username }">
					</div>
					<div class="tableBox">
						<table class="attendTable">
							<thead>
								<th>날짜</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무시간(단위:분)</th>
								<th>상태</th>
							</thead>
							<tbody id="attendAppend">

							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
<!-------------------- Script ----------------------->
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script>
	$(document).ready(
			function() {

				$("#attendAppend").empty();

				$.ajax({
					url : "${pageContext.request.contextPath}/member/attend",
					type : "post",
					data : {
						userid : $("[name=userid]").val()
					},
					dataType : "json",
					success : function(data) {
						var tdHtml = "";
						for (var i = 0; i < data.length; i++) {
							var attendList = data[i];

							var originalDate = attendList.atdate;
							var formattedDate = originalDate.split('-')[0]
									+ '-' + originalDate.split('-')[1] + '-'
									+ originalDate.split('-')[2];

							// 데이터를 이용하여 <td> 엘리먼트를 생성하고 문자열에 추가
							tdHtml += "<tr>";
							tdHtml += "<td>" + formattedDate + "</td>";
							tdHtml += "<td>" + attendList.atintime + "</td>";
							tdHtml += "<td>" + attendList.atouttime + "</td>";
							tdHtml += "<td>" + attendList.atworkhour + "</td>";
							tdHtml += "<td>" + attendList.atstate + "</td>";
							tdHtml += "</tr>";
						}

						// 생성된 HTML 문자열을 원하는 위치에 추가
						$("#attendAppend").html(tdHtml);
					},
					error : function(xhr, status, error) {
						console.log("AJAX 요청 실패");
						console.log("에러 상태: " + status);
						console.log("에러 메시지: " + error);
					}
				});
			});
	// 출근버튼 (inbtn)
	$("#inbtn").click(inbtnClickHandler);

	function inbtnClickHandler() {
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1;
		var day = currentDate.getDate();
		var hours = currentDate.getHours();
		var minutes = currentDate.getMinutes();
		var seconds = currentDate.getSeconds();

		var todayid = year + "-" + month + "-" + day + "-"
				+ $("[name=userid]").val();
		var today = year + "-" + month + "-" + day + " " + hours + ":"
				+ minutes + ":" + seconds;
		$.ajax({
			url : "${pageContext.request.contextPath}/member/attendin",
			type : "post",
			data : {
				userid : $("[name=userid]").val(),
				atdate : todayid,
				attime : today

			},
			dataType : "json",
			success : function(data) {
				console.log("success");
				console.log(data);
				if (data.msg == undefined) {
					var tdHtml = "";
					for (var i = 0; i < data.attendList.length; i++) {
						var atList = data.attendList[i];
						var originalDate = atList.atdate;
						var formattedDate = originalDate.split('-')[0] + '-'
								+ originalDate.split('-')[1] + '-'
								+ originalDate.split('-')[2];

						tdHtml += "<tr>";
						tdHtml += "<td>" + formattedDate + "</td>";
						tdHtml += "<td>" + atList.atintime + "</td>";
						if (atList.atouttime == null) {
							tdHtml += "<td>" + 퇴근 전 + "</td>";

						} else {
							tdHtml += "<td>" + atList.atouttime + "</td>";
						}
						tdHtml += "<td>" + atList.atworkhour + "</td>";

						tdHtml += "<td>" + atList.atstate + "</td>";
						tdHtml += "</tr>";

					}
					$("#attendAppend").html(tdHtml);
					alert("출근이 처리되었습니다.")
				} else {
					console.log(data.msg);
					alert(data.msg)
				}
			},
			error : function(xhr, status, error) {
				console.log("AJAX 요청 실패");
				console.log("에러 상태: " + status);
				console.log("에러 메시지: " + error);
			}
		});
	};

	$("#outbtn").click(outbtnClickHandler);

	function outbtnClickHandler() {
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
		var day = currentDate.getDate();
		var hours = currentDate.getHours();
		var minutes = currentDate.getMinutes();
		var seconds = currentDate.getSeconds();

		var todayid = year + "-" + month + "-" + day + "-"
				+ $("[name=userid]").val();
		var today = year + "-" + month + "-" + day + " " + hours + ":"
				+ minutes + ":" + seconds;
		$.ajax({
			url : "${pageContext.request.contextPath}/member/attendout",
			type : "post",
			data : {
				userid : $("[name=userid]").val(),
				atdate : todayid,
				attime : today

			},
			dataType : "json",
			success : function(data) {
				console.log("success");
				console.log(data);
				if (data.msg == undefined) {
					var tdHtml = "";
					for (var i = 0; i < data.attendList.length; i++) {
						var atList = data.attendList[i];
						var originalDate = atList.atdate;
						var formattedDate = originalDate.split('-')[0] + '-'
								+ originalDate.split('-')[1] + '-'
								+ originalDate.split('-')[2];

						tdHtml += "<tr>";
						tdHtml += "<td>" + formattedDate + "</td>";
						tdHtml += "<td>" + atList.atintime + "</td>";
						if (atList.atouttime == null) {
							tdHtml += "<td>" + 0 + "</td>";

						} else {
							tdHtml += "<td>" + atList.atouttime + "</td>";
						}
						tdHtml += "<td>" + atList.atworkhour + "</td>";

						tdHtml += "<td>" + atList.atstate + "</td>";
						tdHtml += "</tr>";

					}
					$("#attendAppend").html(tdHtml);
					alert("퇴근이 처리되었습니다.")
				} else {
					console.log(data.msg);
					alert(data.msg)
				}
			},
			error : function(xhr, status, error) {
				console.log("AJAX 요청 실패");
				console.log("에러 상태: " + status);
				console.log("에러 메시지: " + error);
			}
		});
	};
</script>
</html>