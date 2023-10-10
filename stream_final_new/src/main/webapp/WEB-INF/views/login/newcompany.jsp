<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-up.html" />

<title>기업 가입</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
<!-- Newcompany Css-->
<link href="${pageContext.request.contextPath}/css/newcompany.css"
	rel="stylesheet">
<!-- Jqeury -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="preconnect"
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

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
						<form action="${pageContext.request.contextPath}/newcompany"
							method="post">
							<div class="card cards">
								<div class="m-sm-4 ccard">
									<div class="mb-3">
										<label class="form-label">회사 명</label> <input
											class="form-control form-control-lg" type="text" name="cname"
											placeholder="" />
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
									<div class="mb-3">
										<label class="form-label">비밀 번호</label> <input
											class="form-control form-control-lg" type="text"
											name="password" placeholder="" />
									</div>
									<div class="text-center mt-3">
										<button type="button"
											class="btn btn-lg btn-primary nextButton">다음</button>
									</div>
								</div>
							</div>

							<div class="card cards">
								<div class="m-sm-4 ccard">
									<div class="mb-3">
										<label class="form-label">부서명 입력</label> <input type="hidden"
											value="D000" name="defaultDeptCode" placeholder="기본부서" />
										</td> <input type="hidden" value="DefaulDept"
											name="defaultDeptName" placeholder="기본부서" />
										</td>
										<table>
											<td><input class="form-control form-control-lg"
												type="text" id="input-dept" placeholder="ex) 영업부 " /></td>
											<td>
												<button type="button" onclick="addDeptTable()"
													class="btn btn-lg btn-primary">추가</button>
											</td>
										</table>
									</div>
									<div class="row">
										<div class="col-12 col-lg-8 col-xxl-9 d-flex">
											<div class="card flex-fill">

												<table class="table table-hover my-0" id="addDept">
													<thead>
														<tr>
															<th>no</th>
															<th class="d-xl-table-cell">부서 이름</th>
															<th class="d-xl-table-cell">삭제</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="text-center mt-3">
										<button type="button"
											class="btn btn-lg btn-primary prevButton">이전</button>
										<button type="button"
											class="btn btn-lg btn-primary nextButton">다음</button>
									</div>
								</div>
							</div>

							<div class="card cards">
								<div class="m-sm-4 ccard">
									<div class="mb-3">
										<label class="form-label">이메일 입력</label>
										<table>
											<td><input
												class="form-control form-control-lg input-email" type="text"
												id="input-email" name="ncemail"
												placeholder="ex) 이메일을 입력하세요. " /></td>
											<td><button type="button" onclick="addEmailTable()"
													class="btn btn-lg btn-primary">추가</button></td>
										</table>
									</div>
									<div class="row">
										<div class="col-12 col-lg-8 col-xxl-9 d-flex">
											<div class="card flex-fill">
												<table class="table table-hover my-0" id="addEmail">
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
									</div>

									<div class="text-center mt-3">
										<button type="button"
											class="btn btn-lg btn-primary prevButton">이전</button>
										<button type="submit" class="btn btn-lg btn-primary">등록</button>
									</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</main>

	<!-------------------- Script ----------------------->
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
			const cards = document.querySelectorAll('.cards .ccard');
			cards.forEach(function(cardcard) {
				cardcard.style.display = 'none';
			});

			cards[index].style.display = 'block';
		}
	</script>

<!-- Dept Script -->
	<script>
		var dRowCount = 0;

		function addDeptTable() {
			var table = document.getElementById("addDept");
			var row = table.insertRow(-1);

			var inputDept = document.getElementById("input-dept");
			var value = '<input type="hidden" name="deptArr" value="'+inputDept.value+'"/>';
			value += inputDept.value;

			var cell1 = row.insertCell(0)
			cell1.innerHTML = dRowCount + 1;

			var cell2 = row.insertCell(1);
			cell2.innerHTML = value;

			var cell3 = row.insertCell(2);
			cell3.innerHTML = "삭제";
			cell3.classList.add("delete-text");

			cell3.onclick = function() {
				removeDRow(row);
			};

			inputDept.value = "";
			dRowCount++

		}
		function removeDRow(row) {
			var table = document.getElementById("addDept");
			table.deleteRow(row.rowIndex);
			dRowCount--;
		}
	</script>

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



	<script src="js/app.js"></script>
</body>

</html>