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
<title>Insert title here</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Emailsend Css -->
<link href="${pageContext.request.contextPath}/css/emailsend.css"
	rel="stylesheet">
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
</style>
</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
				<div class="emailBox">
					<form
						action="${pageContext.request.contextPath}/company/emailsend "
						method="post">
						<div class="emailTitle">사원초대</div>
						<table class="emailTable">
							<tr>
								<td><input class="form-control form-control-lg input-email"
									type="text" id="input-email" name="ncemail"
									placeholder="ex) 이메일을 입력하세요. " /></td>
								<td><button type="button" onclick="addEmailTable()"
										class="btn btn-lg btn-primary">추가</button> <input
									type="hidden" value="D000" name="defaultDeptCode">
									<button type="submit" class="btn btn-lg btn-primary">전송</button>
								</td>
							</tr>
						</table>

						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0 addTable" id="addEmail">
									<thead>
										<tr>
											<th>no</th>
											<th class=" d-xl-table-cell">e-mail</th>
											<th class=" d-xl-table-cell">삭제</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>
	<!-- Email Script -->
	<script>
		var eRowCount = 0;

		function addEmailTable() {
			var table = document.getElementById("addEmail");
			var row = table.insertRow(-1);

			var inputEmail = document.getElementById("input-email");
			var value = '<input type="hidden" name="emailArr" value="'+inputEmail.value+'"/>';
			value += inputEmail.value;

			var cell1 = row.insertCell(0)
			cell1.innerHTML = eRowCount + 1;

			var cell2 = row.insertCell(1);
			cell2.innerHTML = value;

			var cell3 = row.insertCell(2);
			cell3.innerHTML = "삭제";
			cell3.classList.add("delete-text");

			cell3.onclick = function() {
				removeERow(row);
			};

			inputEmail.value = "";
			eRowCount++

		}
		function removeERow(row) {
			var table = document.getElementById("addEmail");
			table.deleteRow(row.rowIndex);
			eRowCount--;
		}
	</script>
</body>
<!-------------------- Script ----------------------->
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</html>