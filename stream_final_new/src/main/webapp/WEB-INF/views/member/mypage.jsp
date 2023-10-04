<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Css -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"
	rel="stylesheet">
<!-- Modal Css -->
<link href="${pageContext.request.contextPath}/css/Modal.css"
	rel="stylesheet">
<!-- DropDown Css -->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<style>
.btn-primary {
	font-size: 20px;
	margin: 0 0 0 100px;
}

/*모달 CSS*/
#mypage-modal {
	display: none;
	width: 350px;
	height: 400px;
	background-color: #f5f7fb;
	border: 1px solid black;
	border-radius: 10px;
	position: relative;
}

#mypage-modal .modal_close_btn {
	position: absolute;
}

.modal_close_btn {
	color: white;
	cursor: pointer;
	top: 10px;
	right: 10px;
}

.modalbox {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center; /* 세로 중앙 정렬 */
	align-items: center; /* 가로 중앙 정렬 */
}

.modal-header {
	height: 65px;
	width: 100%;
	background-color: #009b77;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	padding-top: 10px;
	display: flex;
	justify-content: flex-end;
	position: relative;
}

.mp-table {
	width: 80%;
	height: 70%;
	border-collapse: collapse;
	align-items: middle;
	overflow: auto;
	margin-top: 65px;
	margin-bottom: 65px;
}

.mp-button {
	align-items: middle;
	text-align: center; /* 가로 가운데 정렬 */
	vertical-align: middle;
	margin: 20px 0 0 0;
}

.mp-content {
	color: grey;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- 모달박스 -->
		<div id="mypage-modal">
			<div class="modalbox">
				<div class="modal-header"></div>

				<table class="mp-table">
					<tr>
						<td class="mp-item"><svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-briefcase align-middle me-2">
							<rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
							<path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg><span>회사명</span></td>
						<td class="mp-content" data-field="cname"></td>
					</tr>
					<tr>
						<td class="mp-item"><svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-monitor align-middle me-2">
							<rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect>
							<line x1="8" y1="21" x2="16" y2="21"></line>
							<line x1="12" y1="17" x2="12" y2="21"></line></svg><span>부서명</span></td>
						<td class="mp-content" data-field="deptname"></td>
					</tr>
					<tr>
						<td class="mp-item"><svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-award align-middle me-2">
							<circle cx="12" cy="8" r="7"></circle>
							<polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg><span>직급명</span></td>
						<td class="mp-content" data-field="mrank"></td>
					</tr>
					<tr>
						<td class="mp-item"><svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-user align-middle me-2">
							<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
							<circle cx="12" cy="7" r="4"></circle></svg><span>이름</span></td>
						<td class="mp-content" data-field="mname"></td>
					</tr>
					<tr>
						<td class="mp-item"><svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-phone align-middle me-2">
							<path
									d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg><span>전화번호</span>
						</td>
						<td class="mp-content" data-field="mphone"></td>
					</tr>
					<tr>
						<td colspan="2" class="mp-button"><button
								class="btn btn-primary btn-sm mp-button">정보수정</button></td>
					</tr>

				</table>


			</div>
			<a class="modal_close_btn">X</a>
		</div>
		<!-- 모달박스 끝 -->

		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
				<div class="container-fluid p-0"></div>
				<div>
					<button id="mypage-open" class="btn btn-primary btn-lg">
						<a>mypage</a>
					</button>
				</div>
			</main>
		</div>
	</div>

</body>
<!-------------------- Script ----------------------->
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>

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
			overflow : 'auto',
			backgroundColor : 'rgba(0,0,0,0.4)'
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

	document.getElementById('mypage-open').addEventListener('click',
			function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/showmypage',
					method : 'GET',
					data : {
						userid : '${principal.username}'
					},
					dataType: 'json',
					success : function(data) {
						 console.log(data);
						var mname=data.mname;
						var cname=data.cname;
						var mrank=data.mrank;
						var mphone=data.mphone;
						var deptname=data.deptname;
						
			            $('.mp-content[data-field="mname"]').text(data.mname);
			            $('.mp-content[data-field="cname"]').text(data.cname);
			            $('.mp-content[data-field="mrank"]').text(data.mrank);
			            $('.mp-content[data-field="mphone"]').text(data.mphone);
			            $('.mp-content[data-field="deptname"]').text(data.deptname);
						
						modal('mypage-modal');
					},
					error : function(error) {
						console.error('오류발생', error);
					}
				});
				// 모달창 띄우기
			});
</script>

<!-- 모달스크립트끝 -->
</html>