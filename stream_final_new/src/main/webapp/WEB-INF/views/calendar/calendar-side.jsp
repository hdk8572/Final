<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/streamapp.css">

<style>
li::marker {
	content: "";
}
.soption{
color: #939ba2;
}
.sidebar-menu{
    padding: 0.625rem 1.625rem;
}
</style>

<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<span class="align-brand-middle"><a href="${pageContext.request.contextPath}/projectlist"
			class="sidebar-brand-new">AdminKit</a>
		</span>

		<ul class="sidebar-nav">
			<li class="sidebar-item active">
				<a class="sidebar-link" href="${pageContext.request.contextPath}/projectlist"> 
					<i class="align-middle" data-feather="sliders"></i> 
					<span class="align-middle">내 프로젝트</span>
				</a>
			</li>

		<li class="sidebar-header">모아보기</li>





			<li class="sidebar-item cal-side">
			<!-- <i class="align-middle" data-feather="check-square"></i>  --> <!-- 아이콘  -->
			<div class="sidebar-menu">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square align-middle">
						<polyline points="9 11 12 14 22 4"></polyline>
						<path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
					</svg>
				<span class="align-middle">일정</span>
					</div>
					<ul class="soption">
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1" name="tsd"
								checked> <span class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2" name="tsd">
								<span class="form-check-label"> 내 일정 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3" name="tsd">
								<span class="form-check-label"> 등록한 일정 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4" name="tsd">
								<span class="form-check-label"> 선택안함 </span>
						</label></li>
					</ul>
			
			</li>

			<li class="sidebar-item cal-side">
			<!-- <i class="align-middle" data-feather="grid"></i>  --> <!-- 아이콘  -->
			<div class="sidebar-menu">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid align-middle">
					<rect x="3" y="3" width="7" height="7"></rect>
					<rect x="14" y="3" width="7" height="7"></rect>
					<rect x="14" y="14" width="7" height="7"></rect>
					<rect x="3" y="14" width="7" height="7"></rect>
				</svg>
			<span class="align-middle"> 업무</span>
			      </div>
					<ul class="soption">
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1" name="ted"
								checked> <span class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2" name="ted">
								<span class="form-check-label"> 내 업무 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3" name="ted">
								<span class="form-check-label"> 요청한 업무 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4" name="ted">
								<span class="form-check-label"> 선택안함 </span>
						</label></li>
					</ul>
			
			</li>
		</ul>
	</div>
</nav>