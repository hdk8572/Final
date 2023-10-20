<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Access-denied CSS -->
<link href="${pageContext.request.contextPath}/css/access-denied.css"
	rel="stylesheet">

<title>Stream - 업무도 흐름이다!</title>
<style>
.content {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.denied-box {
	width: 600px;
	height: 400px;
	border-radius: 60px;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.img-box {
	width: 100px;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.text-box {
	max-width: 100%;
	text-align: center;
	margin-top: 10px;
}

.link-box {
	justify-content: center;
}

h1 {
	margin: 0;
}
</style>
</head>
<body>
	<div class="content">
		<div class="denied-box">
			<div class="img-box">
				<img src="${pageContext.request.contextPath}/img/forbidden.png"
					style="max-width: 100%; max-height: 100%">
			</div>
			<div class="text-box">
				<h1>
					접근이 거부되었습니다 <br> Error 403 Forbidden.
				</h1>

				<p>
					입력한 주소를 사용하여 액세스할 수 없습니다. <br> 입력하신 페이지의 주소가 정확한지 다시 한번 확인해주시기
					바랍니다.
				</p>
			</div>

			<div class="link-box">
				<a href="${pageContext.request.contextPath}/main">메인페이지</a> <a
					href="javascript:history.back()">뒤로가기</a>
			</div>

		</div>

	</div>

</body>
</html>