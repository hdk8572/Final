<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link href="${pageContext.request.contextPath}/css/test.css" rel="stylesheet">
	
</head>
<style>
	.a1 { display:none; }
	boby{
		margin: 0px;
	}
	
</style>

<!-- <script src="https://code.jquery.com/jquery-3.7.0.js"></script> -->
<script src="${pageContext.request.contextPath}/js/jquery-3.7.0.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- sockjs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<!-- stompjs -->
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.umd.min.js">
<script>
function popupOpen(){ 
    var popUrl = "/stream/chat";	//팝업창에 출력될 페이지 URL
    var popOption = "left=800, top=100, width=500, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
        window.open(popUrl,"",popOption);
    }

</script>
<%@ include file="/WEB-INF/views/searchbar.jsp" %>
<nav class="navbar navbar-expand navbar-light navbar-bg">

	<a class="sidebar-toggle js-sidebar-toggle"> <i
		class="hamburger align-self-center"></i>
	</a>

	<div class="navbar-collapse collapse">
		<ul class="navbar-nav navbar-align">
			<li class="nav-item dropdown" ><a
				class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
				data-bs-toggle="dropdown">
 					<div class="position-relative">
						<i class="align-middle" data-feather="bell"></i> <span
							class="indicator">4</span>
					</div>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
					aria-labelledby="alertsDropdown">
					<div class="dropdown-menu-header">알림</div>
					<div class="search">
						<input class="serinput" type="text" placeholder="검색어 입력">
							<img class="serimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
					</div>
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
						<a  id="load">더보기</a>
					</div> 
				</div></li>
				<div class="container">
        <div class="sidesheet">
                 <%@ include file="/WEB-INF/views/chatting/NewChat.jsp" %>
        </div>

        <button class="floating-btn" onclick="toggleSidesheet()">채팅</button>
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
			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
				data-bs-toggle="dropdown"> <i class="align-middle"
					data-feather="settings"></i>
			</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
				href="#" data-bs-toggle="dropdown"> <img
					src="img/avatars/user1.jpg" class="avatar img-fluid rounded me-1"
					alt="Charles Hall" border-radius: 50% !important/> <span class="text-dark">사용자</span>
			</a>
				<div class="dropdown-menu dropdown-menu-end">
					<a class="dropdown-item" href="pages-profile.html"><i
						class="align-middle me-1" data-feather="user"></i> 내 프로필</a> <!-- <a
						class="dropdown-item" href="#"><i class="align-middle me-1"
						data-feather="pie-chart"></i> Analytics</a> -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="index.html"><i
						class="align-middle me-1" data-feather="settings"></i> 환경 설정</a> 
						<!-- <a class="dropdown-item" href="#"><i
						class="align-middle me-1" data-feather="help-circle"></i> Help
						Center</a> -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Log out</a>
				</div></li>
		</ul>
	</div>
</nav>
<script>
  $(function(){
      $(".a1").slice(0, 3).show(); // 초기갯수
      $("#load").click(function(e){ // 클릭시 more
          e.preventDefault();
          $(".a1:hidden").slice(0, 3).show(); // 클릭시 more 갯수 지저정
          if($(".a1:hidden").length == 0){ // 컨텐츠 남아있는지 확인
              $(".dropdown-menu-footer").remove(); // 컨텐츠 없을시 alert 창 띄우기 
              
            }
      });
  });

  function toggleSidesheet() {
	    document.querySelector('.container').classList.toggle('sidesheet-open');
	}

  </script>