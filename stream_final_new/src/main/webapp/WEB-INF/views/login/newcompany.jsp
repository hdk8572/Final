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

<title>기업 가입</title>

<link href="css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
.table {
	width: 512px;
}

.cardcard {
	display: none;
}
</style>

</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">기업 가입</h1>
							<p class="lead">기업 정보를 입력 후 그룹웨어 Stream을 이용해보세요!</p>
						</div>

						<div class="card cards">
							<div class="card-body cardcard">
								<div class="m-sm-4">
									<form>
										<div class="mb-3">
											<label class="form-label">회사 명</label> <input
												class="form-control form-control-lg" type="text"
												name="cname" placeholder="" />
										</div>
										<div class="mb-3">
											<label class="form-label">회사 전화번호</label> <input
												class="form-control form-control-lg" type="text"
												name="cphone" placeholder="" />
										</div>
										<div class="mb-3">
											<label class="form-label">회사 주소</label> <input
												class="form-control form-control-lg" type="text"
												name="caddress" placeholder="" />
										</div>
										<div class="text-center mt-3">
											<button type="button"
												class="btn btn-lg btn-primary nextButton">다음</button>
											<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="card cards">
							<div class="card-body cardcard">
								<div class="m-sm-4">
									<form>
										<div class="mb-3">


											<label class="form-label">부서명 입력</label>
											<table>
												<td><input class="form-control form-control-lg"
													type="text" name="dept" placeholder="ex) 영업부 " /></td>
												<td><a href="index.html" class="btn btn-lg btn-primary">추가</a>
												</td>
											</table>

										</div>
										<div class="row">
											<div class="col-12 col-lg-8 col-xxl-9 d-flex">
												<div class="card flex-fill">

													<table class="table table-hover my-0">
														<thead>
															<tr>
																<th>no</th>
																<th class="d-none d-xl-table-cell">부서 코드</th>
																<th class="d-none d-xl-table-cell">부서 이름</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>01</td>
																<td class="d-none d-xl-table-cell">D001</td>
																<td class="d-none d-xl-table-cell">부서이름1</td>
															</tr>
															<tr>
																<td>02</td>
																<td class="d-none d-xl-table-cell">D002</td>
																<td class="d-none d-xl-table-cell">부서이름2</td>
															</tr>
															<tr>
																<td>03</td>
																<td class="d-none d-xl-table-cell">D003</td>
																<td class="d-none d-xl-table-cell">부서이름3</td>
															</tr>
															<tr>
																<td>04</td>
																<td class="d-none d-xl-table-cell">D004</td>
																<td class="d-none d-xl-table-cell">부서이름4</td>
															</tr>
															<tr>
																<td>05</td>
																<td class="d-none d-xl-table-cell">D005</td>
																<td class="d-none d-xl-table-cell">부서이름5</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="text-center mt-3">
												<button type="button"
													class="btn btn-lg btn-primary prevButton">이전</button>
												<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
												<button type="button"
													class="btn btn-lg btn-primary nextButton">다음</button>
												<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
											</div>
									</form>
								</div>
							</div>
						</div>
						<br>

						<div class="card cards">
							<div class="card-body cardcard">
								<div class="m-sm-4">
									<form>
										<div class="mb-3">
											<label class="form-label">이메일 전송</label> <input
												class="form-control form-control-lg" type="text" name="dept"
												placeholder="ex) 이메일을 입력해주세요 " />
										</div>
										<div class="row">
											<div class="col-12 col-lg-8 col-xxl-9 d-flex">
												<div class="card flex-fill">

													<table class="table table-hover my-0">
														<thead>
															<tr>
																<th>no</th>
																<th class="d-none d-xl-table-cell">e-mail</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>01</td>
																<td class="d-none d-xl-table-cell">e-mail1@gamil.com</td>
																<td>삭제</td>
															</tr>
															<tr>
																<td>02</td>
																<td class="d-none d-xl-table-cell">e-mail2@gamil.com</td>
																<td>삭제</td>
															</tr>
															<tr>
																<td>03</td>
																<td class="d-none d-xl-table-cell">e-mail3@gamil.com</td>
																<td>삭제</td>
															</tr>
															<tr>
																<td>04</td>
																<td class="d-none d-xl-table-cell">e-mail4@gamil.com</td>
																<td>삭제</td>
															</tr>
															<tr>
																<td>05</td>
																<td class="d-none d-xl-table-cell">e-mail5@gamil.com</td>
																<td>삭제</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="text-center mt-3">
												<button type="button"
													class="btn btn-lg btn-primary prevButton">이전</button>
												<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
												<a href="index.html" class="btn btn-lg btn-primary">등록</a>
												<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
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


	<script>
		let currentIndex = 0;
		showCards(currentIndex);

		$('.prevButton').on('click', function() {
			currentIndex = (currentIndex - 1 + 3) % 3; // 3은 문장의 개수
			showCards(currentIndex);
		});

		$('.nextButton').on('click', function() {
			currentIndex = (currentIndex + 1) % 3; // 3은 문장의 개수
			showCards(currentIndex);
		});

		function showCards(index) {
			const cards = document.querySelectorAll('.cards .cardcard');
			cards.forEach(function(cardcard) {
				cardcard.style.display = 'none';
			});

			cards[index].style.display = 'block';
		}
	</script>
	<script src="js/app.js"></script>

</body>

</html>