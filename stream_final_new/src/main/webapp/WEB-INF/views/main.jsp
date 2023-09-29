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


<title>로그인</title>

<!-- Bootstrap Css -->
<link href="css/streamapp.css" rel="stylesheet">
<!-- Main Css -->
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

</head>

<body>
	<%@ include file="/WEB-INF/views/message.jsp"%>
	<!-- 모달박스 -->
	<div id="main-modal">
		<div class="modalbox">
			<div class="mmbox" id="mmnewcompany">
				<p>처음오셨나요?</p>
				<p class="mmcompany">회사 등록</p>
			</div>

			<div class="mmbox" id="mmlogin">
				<p>이미 이용중이시라면!</p>
				<p class="mmlogin">로그인</p>
			</div>

		</div>
		<a class="modal_close_btn">X</a>
	</div>
	<div class="main-box">
		<img class="logo-img" src="img/photos/main-logo.svg" alt="/">
	</div>
	<!-- 모달박스 끝 -->

	<div class="main-text">
		<a>업무도 흐름이다!</a><br> <a> 국내 최고 업무 협업툴 Stream!</a>
	</div>
	<button id="main-modal-open" class="btn btn-primary btn-lg">
		<a>지금 바로 시작하기!</a>
	</button>
	<div class="img-box main-box">
		<img class="full-img" src="img/photos/top-slide-01.webp" alt="/">
	</div>
	<script src="js/app.js"></script>

	<!-------------------- Script ----------------------->
	<!-- 모달script -->
	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = document.getElementById(id);
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto'
			});
			document.body.append(bg);

			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});

			modal
					.setStyle({
						position : 'fixed',
						display : 'block flex',
						background : 'rgba(255, 255, 255, 0.7)',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,

						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'

					});
		}

		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};

		document.getElementById('main-modal-open').addEventListener('click',
				function() {
					// 모달창 띄우기
					modal('main-modal');
				});
	</script>

	<script>
		document
				.getElementById("mmnewcompany")
				.addEventListener(
						"click",
						function() {
							window.location.href = "${pageContext.request.contextPath}/newcompany";
						});
		document
				.getElementById("mmlogin")
				.addEventListener(
						"click",
						function() {
							window.location.href = "${pageContext.request.contextPath}/login";
						});
	</script>
	<!-- 모달스크립트끝 -->
</body>

</html>