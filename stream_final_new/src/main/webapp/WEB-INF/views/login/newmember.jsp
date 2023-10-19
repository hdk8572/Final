<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">

<title>회원 가입</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Newmember Css -->
<link href="${pageContext.request.contextPath}/css/newmember.css"
	rel=stylesheet">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

</head>

<body>
	<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">회원 가입</h1>
							<p class="lead">추가 정보입력으로 Stream 비즈니스 계정을 만들어보세요!</p>
						</div>
						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<!--회원가입 form/ name= 회원가입 id= checkAll -->
									<form id="frmNewMember"
										action="${pageContext.request.contextPath}/newmember"
										name="Account" method="post" onsubmit="return checkAll();">
										<div class="mb-3">
											<label class="form-label">아이디</label> <input
												class="form-control form-control-lg" type="email"
												id="userid" placeholder="이메일을 입력하세요" name="userid"
												value="${userid}" required>
										</div>
										<div class="mb-3">
											<label class="form-label">이름</label> <input
												class="form-control form-control-lg" type="text"
												id="username" placeholder="이름을 입력하세요" name="mname"
												value="${username}" required>

										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호</label> <input
												class="form-control form-control-lg" type="password"
												id="userpwd" name="password" value="${userpwd}"
												placeholder="비밀번호를 입력하세요" required>
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호재확인</label> <input
												class="form-control form-control-lg" type="password"
												name="pwdcheck" id="pwdcheck" value="${pwdcheck}"
												placeholder="비밀번호 한번 더 입력하세요" required />
										</div>

										<div>
											<div class="mb-3">
												<label class="form-label">Company Code</label> <input
													class="form-control form-control-lg" type="text"
													name="ccode" placeholder="회사코드를 입력하세요" /> <small>
													<a href="#" class="ccodeToDept">부서조회</a>

												</small>
											</div>

											<div class="mb-3">
												<label class="form-label">Department</label> <select
													id="deptdrop" class="form-select mb-3" name="deptno"
													value="${deptdrop}">
													<option selected>해당하는 부서가 없습니다</option>

												</select>
											</div>
										</div>

										<div>
											<label class="form-check"> <input
												class="form-check-input" type="checkbox" value="agree"
												name="agree"> <span class="agree-label"> (필수)
													서비스 이용약관, 개인정보처리방침을 확인하였고, 이에 동의합니다. </span>
											</label>
										</div>
										<div class="text-center mt-3">
											<button type="submit" class="btn btn-lg btn-primary">회원가입</button>
										</div>
									</form>
								</div>

							</div>



						</div>
					</div>
				</div>

			</div>
		</div>

	</main>
	<!-------------------- Script ----------------------->
	<script src="js/app.js"></script>

	<script>
		// 회원가입 항목체크
		function checkAll() {
			if (!checkUserid(Account.userid.value)) {
				return false;
			} else if (!checkUserpwd(Account.userpwd.value,
					Account.pwdcheck.value)) {
				return false;
			} else if (!checkUsername(Account.username.value)) {
				return false;
			} else if (!checkDept(Account.deptdrop.value)) {
				return false;
			}
			return true;
		}

		//빈칸 누락 확인
		function checkBlank(value, dataName) {
			if (value == "") {
				alert(dataName + " 입력해주세요!");
				return false;
			}
			return true;
		}

		//아이디 확인
		function checkUserid(userid) {
			if (!checkBlank(userid, "아이디를"))
				return false;
			var idToCheck = /[A-Za-z0-9_]{1,25}+@[A-Za-z0-9]+\.[A-Za-z]{2,4}(\.[A-Za-z]{2})?$/;
			if (!idToCheck.test(userid)) {
				alert("이메일형식이 옳지 않습니다!");
				Account.userid.value = "";
				Account.userid.focus();
				return false;

			}
			return true;
		}

		//비밀번호, 비밀번호 재입력 확인
		function checkUserpwd(userpwd, pwdcheck) {
			if (userpwd != pwdcheck) {
				alert("비밀번호가 일치하지 않습니다.");
				Account.pwdcheck.value = "";
				Account.pwdcheck.focus();
				return false;
			}
			var pwdToCheck =/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,15}$/;
				if (!pwdToCheck.test(userpwd)){
					alert("비밀번호는 대소문자와 영어를 포함한 8-15자로 작성해주세요.");
					Account.userpwd.value="";
					Account.userpwd.focus();
					return false;
				}
			return true;
		}

		//이름 확인
		function checkUsername(username) {
			if (!checkBlank(username, "이름을")) {
				return false;
			}
			var nameToCheck = /^[A-Za-z가-힣]{2,15}$/;
			if (!nameToCheck.test(username)) {
				alert("이름 형식이 옳지 않습니다.");
				Account.username.value=""
				Account.username.focus();
				return false;
			}
			return true;

		}

		function checkDept(deptdrop) {

			if (deptdrop == "해당하는 부서가 없습니다") {
				alert("부서를 선택해주세요.")
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

			function deptView(data) {
				if(data == null || data == ""){
				var listHtml = "";
				listHtml += `<option selected>해당하는 부서가 없습니다</option>`;
				$("#deptdrop").html(listHtml);
				return;
			} else
			console.log("성공하였습니다")
			var listHtml = "";
	
			for (var i = 0; i < data.length; i++) {
				var deptName = data[i];
				listHtml += `<option value="\${deptName.deptno}">\${deptName.deptname}</option>`;
			}
			$("#deptdrop").html(listHtml);
		}
		function deptError(request, status, error) {
			console.log(request);
			console.log(status);
			console.log(error);
			alert("code: " + request.status + "\n" + "message: "
					+ request.responseText + "\n" + "error: " + error);
		}}
	</script>



</body>

</html>