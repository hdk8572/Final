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
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
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
	<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
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
							method="post" name="Company" onsubmit="return checkAll();">
							<div class="card cards">
								<div class="m-sm-4 ccard">
									<div class="mb-3">
										<label class="form-label">회사 명</label> <input
											class="form-control form-control-lg" type="text" name="cname"
											id="cname" placeholder="" />
									</div>
									<div class="mb-3">
										<label class="form-label">회사 전화번호</label> <input
											class="form-control form-control-lg" type="text" id="cphone"
											name="cphone" placeholder="" />
									</div>
									<div class="mb-3">
										<label class="form-label">회사 주소</label> <input
											class="form-control form-control-lg" type="text"
											id="caddress" name="caddress" placeholder="" />
									</div>
									<div class="text-center mt-3">
										<button type="button"
											class="btn btn-lg btn-primary nextButton">다음</button>
									</div>
									<input type="hidden" name="password" value="12345" />
								</div>
							</div>

							<div class="card cards">
								<div class="m-sm-4 ccard">
									<div class="mb-3">
										<label class="form-label">부서명 입력</label> <input type="hidden"
											value="D000" name="defaultDeptCode" placeholder="기본부서" />
										</td> <input type="hidden" value="부서미선택"
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
												class="form-control form-control-lg input-email" type="email"
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
	<!-- 이메일/부서 null값으로 추가불가 -->
	<script>
	
	
	</script>
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

	<!-- 회사가입 항목체크 -->
	<script>
	function checkAll(){
		if(!checkCname(Company.cname.value)){
			return false;
		}else if(!checkCphone(Company.cphone.value)){
			return false;
		} else if(!checkCaddress(Company.caddress.value)){
			return false;
		}
		return true;
		}
		
	function checkBlank(value, dataName){
	if (value == ""){
		alert(dataName + " 입력해주세요!");
		return false;
	}
	return true;
	}

	function checkCname(cname){
	if(!checkBlank(cname, "회사명을"))
		return false;
	var nameToCheck = /^[A-Za-z가-힣\s!@#$%^&*()_+[\]{};':".,<>?\\/-]{2,25}$/;
	if(!nameToCheck.test(cname)){
		alert("회사명 형식이 옳지 않습니다.");
		return false;
	}
	return true;
}
	function checkCphone(cphone) {
	    if (!checkBlank(cphone, "회사 전화번호를"))
	        return false;

	    const phoneToCheck = cphone.replace(/\D/g, '');

	    if (phoneToCheck.length !== 10 && phoneToCheck.length !== 11) {
	        alert("10 또는 11자리의 숫자를 입력해주세요.");
	        return false;
	    }

	    if (!/^01[01]/.test(phoneToCheck)) {
	        alert("010 또는 011로 시작되는 전화번호를 입력해주세요.");
	        return false;
	    }

	    if (!/^\d+$/.test(phoneToCheck)) {
	        alert("전화번호 형식이 올바르지 않습니다.");
	        return false;
	    }

	    return true;
	}
</script>
	<!-- Dept Script -->
	<script>
		var dRowCount = 0;

		function addDeptTable() {
			
			var inputDept = document.getElementById("input-dept");
			var inputValue = inputDept.value.trim();
			
			if (inputValue === '') {
		        alert("부서이름을 입력해주세요!");
		    } else{
			
			var table = document.getElementById("addDept");
			var row = table.insertRow(-1);

			
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
			
			var inputEmail = document.getElementById("input-email");
			
			var table = document.getElementById("addEmail");
			var row = table.insertRow(-1);

			
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