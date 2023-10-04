<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<nav class="navbar navbar-expand navbar-light navbar-bg">
	<a class="sidebar-toggle js-sidebar-toggle"> <i
		class="hamburger align-self-center"></i>
	</a>
	<div class="navbar-collapse collapse">
		<ul class="navbar-nav navbar-align">
			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
				data-bs-toggle="dropdown">
					<div class="position-relative">
						<i class="align-middle" data-feather="bell"></i>
						<span class="indicator">4</span>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
					aria-labelledby="alertsDropdown">
					<div class="dropdown-menu-header">알림</div>
					<div class="list-group">
						<div class="a1">
							<a href="#" class="list-group-item">
								<div class="row g-0 align-items-center">
									<div class="col-2">
										<img src="img/avatars/user1.jpg"
											class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
									</div>
									<div class="col-10 ps-2">
										<div class="text-dark">프로젝트명</div>
										<div class="text-muted small mt-1">ㅁㅁㅁ님의 일정 등록</div>
										<div class="text-muted small mt-1">안녕</div>
									</div>
								</div>
							</a>
						</div>
						<div class="a1">
							<a href="#" class="list-group-item">
								<div class="row g-0 align-items-center">
									<div class="col-2">
										<img src="img/avatars/user1.jpg"
											class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
									</div>
									<div class="col-10 ps-2">
										<div class="text-dark">프로젝트명</div>
										<div class="text-muted small mt-1">ㅁㅁㅁ님의 일정 등록</div>
										<div class="text-muted small mt-1">안녕</div>
									</div>
								</div>
							</a>
						</div>
						<div class="a1">
							<a href="#" class="list-group-item">
								<div class="row g-0 align-items-center">
									<div class="col-2">
										<img src="img/avatars/user1.jpg"
											class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
									</div>
									<div class="col-10 ps-2">
										<div class="text-dark">프로젝트명</div>
										<div class="text-muted small mt-1">ㅁㅁㅁ님의 일정 등록</div>
										<div class="text-muted small mt-1">안녕</div>
									</div>
								</div>
							</a>
						</div>
						<div class="a1">
							<a href="#" class="list-group-item">
								<div class="row g-0 align-items-center">
									<div class="col-2">
										<img src="img/avatars/user1.jpg"
											class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
									</div>
									<div class="col-10 ps-2">
										<div class="text-dark">프로젝트명</div>
										<div class="text-muted small mt-1">ㅁㅁㅁ님의 일정 등록</div>
										<div class="text-muted small mt-1">안녕</div>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="dropdown-menu-footer">
						<a id="load">더보기</a>
					</div>
				</div></li>

			<div class="container">
				<div class="sidesheet"></div>
				<button id="popup">채팅</button>
			</div>

			<%--  				<div>
					<button class="btn btn-primary addProject" id="myBtn" data-bs-toggle="modal" data-bs-target="#myModal">채팅</button>
				</div>	
					<%@ include file="/WEB-INF/views/chatting/select.jsp" %> --%>
<!-- 			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
				data-bs-toggle="dropdown">
					<div class="position-relative">
						<i class="align-middle" data-feather="message-square"></i>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
					aria-labelledby="messagesDropdown">
					<div class="dropdown-menu-header">
						<div class="position-relative">채팅</div>
					</div>
					<div class="list-group">
						<a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성1</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a>
						 <a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="William Harris">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성2</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a> 
						<a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="Christina Mason">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성3</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a> 
						<a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성4</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a>
						 <a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성5</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a> 
						<a href="javascript:popupOpen()" class="list-group-item">
							<div class="row g-0 align-items-center">
								<div class="col-2">
									<img src="img/avatars/user1.jpg"
										class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
								</div>
								<div class="col-10 ps-2">
									<div class="text-dark">김민성6</div>
									<div class="text-muted small mt-1">내용1</div>
									<div class="text-muted small mt-1">시간 전</div>
								</div>
							</div>
						</a>
					</div>
	 					<div class="dropdown-menu-footer">
						<a  class="text-muted">더보기</a>
					</div>
				</div></li> -->

			<li class="nav-item dropdown">
				<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown"> <i class="align-middle" data-feather="settings"></i></a>
				<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown"> <img src="img/avatars/user1.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" border-radius: 50% !important/>
					<span class="text-dark">사용자</span>
				</a>

				<div class="dropdown-menu dropdown-menu-end">
					<a class="dropdown-item"  href="#" id="mypage-open"><i class="align-middle me-1" data-feather="user"></i> 내 프로필</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="index.html">
						<i class="align-middle me-1" data-feather="settings"></i> 환경 설정
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Log out</a>
				</div>
			</li>
		</ul>
	</div>
</nav>

		<!-- 모달박스 -->
		<div id="mypage-modal">
			<div class="modalbox">
				<div class="mpmodal-header"></div>

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



<script type="text/javascript">
    
 	      window.onload = function () {
            var popupButton = document.getElementById("popup");
            popupButton.onclick = function () {
               var jsPopup = window.open("room", null, "width=600, height=700, resizable=no, scrollbars=no,toolbars=no, menubar=no");
            
            
            };
         };
      </script>
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
      
