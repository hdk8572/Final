<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="/src/main/webapp/resources/adminKit/css/app.css">
	

<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="index.html"> <span
			class="align-middle">AdminKit</span>
		</a>

		<ul class="sidebar-nav">
			<li class="sidebar-item active"><a class="sidebar-link"
				href="index.html"> <i class="align-middle"
					data-feather="sliders"></i> <span class="align-middle">내 프로젝트</span>
			</a></li>

			<li class="sidebar-header">모아보기</li>
			
			<li class="sidebar-item cal-side"><i class="align-middle"
				data-feather="check-square"></i> <span class="align-middle">
					<div class="card-title">일정</div>
					<ul>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1"
								name="tsd" checked> <span
								class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2"
								name="tsd" > <span
								class="form-check-label"> 내 일정 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3"
								name="tsd" > <span
								class="form-check-label"> 등록한 일정 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4"
								name="tsd" > <span
								class="form-check-label"> 선택안함 </span>
						</label></li>
					</ul>
			</span></li>

			<li class="sidebar-item cal-side"><i class="align-middle"
				data-feather="grid"></i> <span class="align-middle">
					<div class="card-title">업무</div>
					<ul>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1"
								name="ted" checked> <span
								class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2"
								name="ted" > <span
								class="form-check-label"> 내 업무 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3"
								name="ted" > <span
								class="form-check-label"> 요청한 업무 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4"
								name="ted" > <span
								class="form-check-label"> 선택안함 </span>
						</label></li>
					</ul>
			</span></li>
		</ul>
	</div>
</nav>