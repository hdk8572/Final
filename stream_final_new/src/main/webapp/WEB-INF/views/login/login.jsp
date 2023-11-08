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

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-in.html" />

<title>Stream - 업무도 흐름이다!</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Login Css -->
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
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
							<h1 class="h2 loginTitle">Stream에 오신 것을 환영합니다!</h1>
							<p class="lead"></p>
						</div>

						<div>


							<div class="card">
								<div class="card-body">
									<div class="m-sm-4">

										<div>
											<!-- 로그인  -->
											<form id="frmMemberLogin"
												action=${pageContext.request.contextPath}/login
												method="post">
												<div class="mb-3">

													<label class="form-label">ID <span>ex) streamjj1@naver.co.kr</span></label> <input
														class="form-control form-control-lg" type="email"
														name="userid" placeholder="이메일을 입력해주세요."
														required="required" />
												</div>
												<div class="mb-3">
													<label class="form-label">Password <span>ex) Aa12345!</span></label> <input
														class="form-control form-control-lg" type="password"
														name="password" placeholder="비밀번호를 입력해주세요."
														required="required" />
												</div>
												<div class="text-center mt-3">
													<!-- <a href="index.html" class="btn btn-lg btn-primary">로그인</a>-->
													<button type="submit" class="btn btn-lg btn-primary">로그인</button>

												</div>
											</form>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</div>

									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-------------------- Script ----------------------->
	<script src="js/app.js"></script>

</body>

</html>