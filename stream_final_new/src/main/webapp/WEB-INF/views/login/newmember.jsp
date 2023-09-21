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
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-up.html" />

<title>회원 가입</title>

<link href="css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<style>
.agree-label {
	font-size: 14px;
}

.form-check-input {
	margin-left: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
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
									<form id="frmNewMember" action=${pageContext.request.contextPath}/newmember
										method="post">
										<div class="mb-3">
											<label class="form-label">E-mail</label> <input
												class="form-control form-control-lg" type="email"
												placeholder="이메일을 입력하세요" name="userid">
											<!-- 	placeholder="Readonly input" readonly -->

										</div>
										<div class="mb-3">
											<label class="form-label">이름</label> <input
												class="form-control form-control-lg" type="text"
												placeholder="이름을 입력하세요" name="mname">

										</div>
										<div class="mb-3">
											<label class="form-label">Password</label> <input
												class="form-control form-control-lg" type="password"
												name="password" placeholder="비밀번호를 입력하세요">
										</div>
										<!-- 										<div class="mb-3">
											<label class="form-label">Repeat Password</label> <input
												class="form-control form-control-lg" type="password"
												name="password" placeholder="" />
										</div> -->

										<div>
											<div class="mb-3">
												<label class="form-label">Company Code</label> <input
													class="form-control form-control-lg" type="text"
													name="ccode" placeholder="회사코드를 입력하세요" /> <small>
													<a href ="#" class="ccodeToDept">부서조회</a>
												</small>
											</div>

											<div class="mb-3">
												<label class="form-label">Department</label> <select
													id="deptdrop" class="form-select mb-3" name="deptno">
													<option selected>부서를 선택해주세요</option>
											
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
											<button type="submit" class="btn btn-lg btn-primary">로그인</button>
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
	<script src="js/app.js">
		
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
				error: deptError

			});
		}
		function deptView(data){
			console.log("성공하였습니다")
			 var listHtml = "";
			for (var i=0; i<data.length; i++){
				var deptName = data[i];
				listHtml += `<option value="\${deptName.deptno}">\${deptName.deptname}</option>`;
			}
			$("#deptdrop").html(listHtml);
		}
		function deptError(){
			var listHtml = "";
			listHtml += `<option selected>해당하는 부서가 없습니다</option>`;
			$("#deptdrop").html(listHtml);
		}
	</script>



</body>

</html>