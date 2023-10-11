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
<!-- Mypage Css -->
<link href="${pageContext.request.contextPath}/css/mypage.css"
	rel=stylesheet">
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
.agree-label {
	font-size: 14px;
}

.form-check-input {
	margin-left: 20px;
}

.content {
	display: flex; /* 내용물을 가로로 정렬하기 위해 Flexbox를 사용합니다. */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	height: 100vh; /* 부모 div의 높이를 화면 높이와 동일하게 설정합니다. */
}

.myPageBox {
	width: 700px;
	border: 1px white solid;
	background-color: white;
	border-radius: 20px;
	padding: 20px;
	border-radius: 20px;
}

.myPageTitle {
	text-align: center;
	font-size: 30px;
	margin: 10px;
	font-weight: 600;
}
</style>
</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
				<div class="m-sm-4">
					<div class="myPageBox">
						<div class="myPageTitle">마이페이지 수정</div>
						<!--회원가입 form/ name= 회원가입 id= checkAll -->
						<form id="frmNewMember"
							action="${pageContext.request.contextPath}/member/editmypage"
							name="Account" method="post" onsubmit="return checkAll();">
							<div class="mb-3">
								<label class="form-label">아이디</label> <input
									class="form-control form-control-lg" type="email" id="userid"
									placeholder="${principal.username }" name="userid"
									value="${principal.username}" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label">이름</label> <input
									class="form-control form-control-lg" type="text" id="username"
									placeholder="${mvo.mname }" name="mname" value="${username}">
							</div>

							<div class="mb-3">
								<label class="form-label">비밀번호</label> <input
									class="form-control form-control-lg" type="password"
									id="userpwd" name="password" value="${userpwd}"
									placeholder="비밀번호를 입력하세요">
							</div>
							<div class="mb-3">
								<label class="form-label">비밀번호재확인</label> <input
									class="form-control form-control-lg" type="password"
									name="pwdcheck" id="pwdcheck" value="${pwdcheck}"
									placeholder="비밀번호 한번 더 입력하세요" />
							</div>

							<div>
								<div class="mb-3">
									<label class="form-label">Company Code</label> <input
										class="form-control form-control-lg" type="text" name="ccode"
										placeholder="${mvo.ccode }" value="${mvo.ccode}" /> <small>
										<a href="#" class="ccodeToDept">부서조회</a>

									</small>
								</div>

								<div class="mb-3">
									<label class="form-label">Department</label> <select
										id="deptdrop" class="form-select mb-3" name="deptno">
										<option value="${mvo.deptno }" selected>${mvo.deptname }</option>

									</select>
								</div>
								<div class="mb-3">
									<label class="form-label">휴대폰</label> <input
										class="form-control form-control-lg" type="text"
										id="userphone" placeholder="${mvo.mphone}" name="mphone"
										value="${mvo.mphone}">

								</div>
								<div class="mb-3">
									<label class="form-label">직급</label> <input
										class="form-control form-control-lg" type="text" id="userrank"
										placeholder="${mvo.mrank }" name="mrank" value="${mvo.mrank }">

								</div>
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-lg btn-primary">정보수정</button>
							</div>

						</form>
					</div>
				</div>
			</main>
		</div>
	</div>

</body>
<!-------------------- Script ----------------------->
<script>
	// 회원가입 항목체크
	function checkAll() {
		if (!checkUserpwd(Account.userpwd.value, Account.pwdcheck.value)) {
			return false;
		} else if (!checkUserrank(Account.userrank.value)) {
			return false;
		} else if (!checkDept(Account.deptdrop.value)) {
			return false;
		} else if (!checkPhone(Account.userphone.value)) {
			return false;
		} else if (!checkUsername(Account.username.value)){
			return false;
		}
		return true;
	}

	//빈칸 누락 확인
	function checkBlank(value, dataName) {
		if (value == "") {
			alert(dataName + " 입력해주세요!");
			return false
		}
		return true;
	}

	//비밀번호, 비밀번호 재입력 확인
	function checkUserpwd(userpwd, pwdcheck) {
		if (userpwd != pwdcheck) {
			alert("비밀번호가 일치하지 않습니다.");
			Account.pwdcheck.value = "";
			return false;
		}
		return true;
	}

	//직급확인
	function checkUserrank(userrank) {
		var rankToCheck = /^[가-힣]{2,4}$/;
		if (!rankToCheck.test(userrank)) {
			alert("직급 형식이 옳지 않습니다.");
			return false;
		}
		return true;

	}
	//부서확인
	function checkDept(deptdrop) {

		if (deptdrop == "해당하는 부서가 없습니다") {
			alert("부서를 선택해주세요.")
			return false;
		}
		return true;
	}
	//폰번호확인
	function checkPhone(userphone) {
			
			  const phoneToCheck = userphone.replace(/\D/g, '');
			  if (phoneToCheck.length < 10 || phoneToCheck.length > 11) {
			    alert("10-11자 사이의 숫자를 입력해주세요.")
				  return false;
			    
			  }

			  if (phoneToCheck.length === 10 && !/^01/.test(phoneToCheck)) {
				    alert("01로 시작되는 전화번호를 입력해주세요.")
				  return false;
			  }

			  if (phoneToCheck.length === 11 && !/^01/.test(phoneToCheck)) {
				    alert("01로 시작되는 전화번호를 입력해주세요.")
				  return false;
			  }

			  if (!/^\d+$/.test(phoneToCheck)) {
				    alert("전화번호 형식이 옳지 않습니다.")
			    return false;
			  }
			  return true;
			}
	//이름 확인
	function checkUsername(username) {
		if (!checkBlank(username, "이름을")) {
			return false;
		}
		var nameToCheck = /^[가-힣]{2,15}$/;
		if (!nameToCheck.test(username)) {
			alert("이름 형식이 옳지 않습니다.");
			return false;
		}
		return true;

	}

</script>


<script>
	$(".ccodeToDept").click(btnDeptListClickHandler);

	function btnDeptListClickHandler() {
		console.log($("#frmDeptList").serialize());
		$.ajax({
			url : "${pageContext.request.contextPath}/deptlist",
			type : "post",
			data : {
				ccode : $("[name=ccode]").val()
			},
			dataType : "json",
			success : deptView,
			error : deptError

		});
	}
	function deptView(data) {
		console.log("성공하였습니다")
		var listHtml = "";
		for (var i = 0; i < data.length; i++) {
			var deptName = data[i];
			listHtml += `<option value="\${deptName.deptno}">\${deptName.deptname}</option>`;
		}
		$("#deptdrop").html(listHtml);
	}
	function deptError() {
		var listHtml = "";
		listHtml += `<option selected>해당하는 부서가 없습니다</option>`;
		$("#deptdrop").html(listHtml);
	}
</script>
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</html>